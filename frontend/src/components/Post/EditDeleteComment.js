import axios from 'axios';
import React, { useContext, useEffect, useState } from 'react';
import { useDispatch } from 'react-redux';
import { deleteComment, editComment } from '../../features/comment.slice';
import { UidContext } from '../AppContext';

const EditDeleteComment = ({comment, postId}) => {
    const [isAuthor, setIsAuthor] = useState(false);
    const [edit, setEdit] = useState(false);
    const [text, setText] = useState('');
    const dispatch = useDispatch();
    const uid = useContext(UidContext);

    const handleEdit = (e) => {
        e.preventDefault();

        if (text) {
            axios.put(`${process.env.REACT_APP_API_URL}api/comment/${comment.id}`, {
                message: text
            }, {withCredentials: true})
                .then(res => {
                    const dataObject = {commentID: comment.id, message: text}
                    dispatch(editComment(dataObject));
                    setEdit(!edit);
                })
                .catch(err => console.log(err));
        }
    }

    const handleDelete = () => {
        axios.delete(`${process.env.REACT_APP_API_URL}api/comment/${comment.id}`, {withCredentials: true})
            .then(res => dispatch(deleteComment(comment.id)))
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
        const checkAuthor = () => {
            if (uid === comment.commenter_id) {
                setIsAuthor(true);
            }
        }
        checkAuthor();
    }, [uid, comment.commenter_id]);

    return (
        <>
            {isAuthor && (
                <div className="container">
                    <img src="./icons/pen-to-square-regular.svg" alt="edit" className='container__edit-img'
                        onClick={() => setEdit(!edit)}
                        onMouseOver={e => hoverIcons(e)}
                        onMouseOut={e => unhoverIcons(e)} />
                </div>
            )}
            {isAuthor && edit && (
                <div className="edit-comment">
                    <form onSubmit={handleEdit} className="edit-comment__form">
                        <input type="text" name="text" onChange={e => setText(e.target.value)} defaultValue={comment.message} />
                        <input type="submit" value="Valider modifications" className='edit-button'/>
                        <img src="./icons/trash-can-regular.svg" alt="delete" className='edit-comment__form__deleteImg'
                        onClick={() => {
                            if (window.confirm("Voulez-vous supprimer ce commentaire ?")) {
                                handleDelete();
                            }
                        }}
                        onMouseOver={e => hoverIcons(e)}
                        onMouseOut={e => unhoverIcons(e)} />
                    </form>
                </div>
            )}
        </>
    );
};

export default EditDeleteComment;