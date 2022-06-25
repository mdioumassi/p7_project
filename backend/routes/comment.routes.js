const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth.middleware');

const commentCtrl = require('../controllers/comment.controller');

router.get('/', auth, commentCtrl.readComments);
router.post('/', auth, commentCtrl.createComment);
router.put('/:id', auth, commentCtrl.updateComment);
router.delete('/:id', auth, commentCtrl.deleteComment);

module.exports = router;