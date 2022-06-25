import { createSlice } from "@reduxjs/toolkit";

export const commentSlice = createSlice({
    name: "comment",
    initialState: {
        value: null
    },
    reducers: {
        getComments: (state, action) => {
            state.value = action.payload;
        },
        editComment: (state, action) => {
            const commentToEdit = state.value.find(comment => comment.id === action.payload.commentID);
            commentToEdit.message = action.payload.message;
        },
        deleteComment: (state, action) => {
            state.value = state.value.filter(comment => comment.id !== action.payload);
        }
    }
});

export const { getComments, editComment, deleteComment } = commentSlice.actions;
export default commentSlice.reducer;