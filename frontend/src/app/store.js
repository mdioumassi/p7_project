import { configureStore } from "@reduxjs/toolkit";
import userReducer from "../features/user.slice";
import postReducer from "../features/post.slice";
import commentReducer from "../features/comment.slice";

export const store = configureStore({
    reducer: {
        user: userReducer,
        post: postReducer,
        comment: commentReducer
    }
})