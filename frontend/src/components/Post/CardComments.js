 import React, { useContext, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { UidContext } from '../AppContext';
import { dateParser } from '../Utils';
import axios from 'axios';
import { getComments } from '../../features/comment.slice';
import EditDeleteComment from './EditDeleteComment';

const CardComments = ({ post }) => {
    const [text, setText] = useState("");
    const uid = useContext(UidContext);
    const usersData = useSelector(state => state.user.getUsersValue);
    const commentsData = useSelector(state => state.comment.value);
    const dispatch = useDispatch();

    const handleComment = (e) => {
        const userPseudo = usersData !== null &&
            usersData.map((user) => {
                if (user.id === uid) return user.pseudo;
                else return null;
            }).join("")
        
        const dataObject = {
            commenter_id: uid,
            postCommented_id: post.id,
            pseudo: userPseudo,
            message: text,
            date: new Date().toISOString().slice(0, 10)
        }

        e.preventDefault();
        if (text) {
            axios.post(`${process.env.REACT_APP_API_URL}api/comment`, dataObject, {withCredentials: true})
                .then(res => {
                    axios.get(`${process.env.REACT_APP_API_URL}api/comment`, {withCredentials: true})
                        .then(res => {
                            dispatch(getComments(res.data));
                            setText("");
                        })
                        .catch(err => console.log(err));
                })
                .catch(err => console.log(err));
        }
    }

    return (
        <div className="comments-container">
            {commentsData.map(comment => {
                if (comment.postCommented_id === post.id) {
                    return (
                        <div className={comment.commenter_id === uid ?
                        'comment by-user' : 'comment'} key={comment.id}>
                            <div className="comment-header">
                                <div className="info-commenter">
                                    <img src={usersData !== null &&
                                        usersData.map((user) => {
                                            if (user.id === comment.commenter_id) return user.image;
                                            else return null;
                                        }).join("")
                                    } alt="user-pic" />
                                    <p>
                                        {usersData !== null &&
                                            usersData.map((user) => {
                                                if (user.id === comment.commenter_id) return user.pseudo;
                                                else return null;
                                            }).join("")}
                                    </p>
                                </div>
                                <p className='comment-date'>{dateParser(comment.date)}</p>
                            </div>
                            <p className='message'>{comment.message}</p>
                            <EditDeleteComment comment={comment} postId={post.id} />
                        </div>
                    )
                }
                else return null;
            })}
            <form onSubmit={handleComment} className="comment-form">
                <input type="text" name="text"
                onChange={e => setText(e.target.value)} value={text} placeholder="Laisser un commentaire" />
                <input type="submit" value="Envoyer" />
            </form>
        </div>
    );
};

export default CardComments;