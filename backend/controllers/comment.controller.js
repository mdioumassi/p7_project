const db = require('../config/database').getDB();

module.exports.readComments = (req, res, next) => {
    const sql = `SELECT * FROM comments`;
    db.query(sql, (err, result) => {
        if (err) {
            res.status(400).json({err});
        }
        else {
            res.status(200).json(result);
        }
    });
}

module.exports.createComment = (req, res, next) => {
    const {commenter_id, postCommented_id, pseudo, message, date} = req.body;
    const sql = `INSERT INTO comments (commenter_id, postCommented_id, pseudo, message, date) VALUES (?, ?, ?, ?, ?)`;
    db.query(sql, [commenter_id, postCommented_id, pseudo, message, date], (err, result) => {
        if (err) {
            res.status(400).json({err});
        }
        else {
            res.status(201).json(result);
        }
    });
}

module.exports.updateComment = (req, res, next) => {
    const message = req.body.message;
    const id = req.params.id;
    const sql = `UPDATE comments SET message=? WHERE id=?`;
    db.query(sql, [message, id], (err, result) => {
        if (err) {
            res.status(400).json({err});
        }
        else {
            res.status(200).json(result);
        }
    });
}

module.exports.deleteComment = (req, res, next) => {
    const id = req.params.id;
    const sql = `DELETE FROM comments WHERE id=?`;
    db.query(sql, [id], (err, result) => {
        if (err) {
            res.status(400).json({err});
        }
        else {
            res.status(200).json(result);
        }
    });
}