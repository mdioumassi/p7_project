import React, { useEffect, useState, useContext } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { dateParser } from '../Utils';
import LikeButton from './LikeButton';
import { UidContext } from '../AppContext';
import { editPost, deletePost } from '../../features/post.slice';
import axios from 'axios';
import CardComments from './CardComments';

const Card = ({ post }) => {
    const [isLoading, setIsLoading] = useState(true);
    const [isUpdated, setIsUpdated] = useState(false);
    const [textUpdate, setTextUpdate] = useState(null);
    const [showComments, setShowComments] = useState(false);
    const usersData = useSelector(state => state.user.getUsersValue);
    const commentsData = useSelector(state => state.comment.value);
    const dispatch = useDispatch();
    const uid = useContext(UidContext);

    const updateItem = () => {
        if (textUpdate) {
            axios.put(`${process.env.REACT_APP_API_URL}api/post/${post.id}`, {
                message: textUpdate,
                video: post.video
            }, {withCredentials: true})
                .then(res => {
                    const dataObject = {postID: post.id, textUpdate};
                    dispatch(editPost(dataObject));
                    setIsUpdated(false);
                })
                .catch(err => console.log(err));
        }
    }

    const deleteQuote = () => {
        axios.delete(`${process.env.REACT_APP_API_URL}api/post/${post.id}`, {withCredentials: true})
            .then(res => dispatch(deletePost(post.id)))
            .catch(err => console.log(err));
    }

    const hoverIcons = (e) => {
        const currentSrc = e.target.getAttribute('src');
        e.target.setAttribute('src', currentSrc.replace("regular", "solid"));
    }

    const unhoverIcons = (e) => {
        const currentSrc = e.target.getAttribute('src');
        e.target.setAttribute('src', currentSrc.replace("solid", "regular"));
    }

    useEffect(() => {
        if (usersData !== null) {
            setIsLoading(false);
        }
    }, [usersData])

    let counterComment = 0;
    
    return (
        <div className='card' id='myCard'>
            {isLoading ? (
                <p>Loading...</p>
            ) : (
                <>
                    <div className="card__header">
                        <div className='card__header__info-poster'>
                            <img src={usersData !== null &&
                                usersData.map((user) => {
                                    if (user.id === post.poster_id) return user.image;
                                    else return null;
                                }).join("")
                            } alt="user-pic" />
                            <p>
                                {usersData !== null &&
                                    usersData.map((user) => {
                                        if (user.id === post.poster_id) return user.pseudo;
                                        else return null;
                                    }).join("")}
                            </p>
                        </div>
                        <p className='card__header__post-date'>{dateParser(post.date)}</p>
                    </div>
                    <div className="card__content">
                        {isUpdated === false && <p className='card__content__text'>{post.message}</p>}
                        {isUpdated === true && (
                            <div className='card__content__text-update'>
                                <textarea defaultValue={post.message} onChange={e => setTextUpdate(e.target.value)} />
                                <button onClick={updateItem}>Valider modifications</button>
                            </div>
                        )}
                        {post.image !== "No img" &&
                            <img className='card__content__img' src={post.image} alt="card-pic" />
                        }
                        {(post.video.includes("https://www.yout") || post.video.includes("https://yout")) &&
                            <div className="card__content__container">
                                <iframe className='card__content__container__video'
                                    width="500"
                                    height="300"
                                    src={post.video}
                                    frameBorder="0"
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                    allowFullScreen
                                    title={post._id}
                                ></iframe>
                            </div>
                        }
                    </div>
                    {uid === post.poster_id && (
                        <div className='card__action'>
                            <div className="card__action__update-container">
                                <img className='card__action__update-container__edit'
                                src="./icons/pen-to-square-regular.svg" alt="edit" 
                                onClick={() => setIsUpdated(!isUpdated)}
                                onMouseOver={e => hoverIcons(e)}
                                onMouseOut={e => unhoverIcons(e)}
                                />
                            </div>
                            <div className="card__action__delete-container">
                                <img className='card__action__delete-container__suppress'
                                src="./icons/trash-can-regular.svg" alt="suppress" 
                                onClick={() => {
                                    if (window.confirm("Voulez-vous supprimer ce post ?")) {
                                        deleteQuote();
                                    }
                                }}
                                onMouseOver={e => hoverIcons(e)}
                                onMouseOut={e => unhoverIcons(e)}
                                />
                            </div>
                        </div>
                    )}
                    <div className="card__footer">
                        <div className="card__footer__likes">
                            <LikeButton post={post} />
                        </div>
                        <div className="card__footer__comments">
                            <img src="./icons/message-regular.svg" alt="comment"
                            onClick={() => setShowComments(!showComments)}
                            onMouseOver={e => hoverIcons(e)}
                            onMouseOut={e => unhoverIcons(e)}
                            />
                            {commentsData.forEach(comment => {
                                if (comment.postCommented_id === post.id) {
                                    counterComment += 1;
                                }
                            })}
                            <p>{counterComment}</p>
                        </div>
                    </div>
                    {showComments && <CardComments post={post} />}
                </>
            )}
        </div>
    );
};

export default Card;