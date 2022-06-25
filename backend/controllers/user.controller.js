const db = require('../config/database').getDB();

module.exports.getAllUsers = (req, res, next) => {
    const sql = `SELECT * FROM users`;
    db.query(sql, (err, result) => {
        if (err) {
            res.status(400).json({err});
        }
        else {
            res.status(200).json(result);
        }
    });
}

module.exports.getUser = (req, res, next) => {
    const id = req.params.id;
    const sql = `SELECT * FROM users WHERE id=?`;
    db.query(sql, [id], (err, result) => {
        if (err) {
            res.status(400).json({err});
        }
        else {
            res.status(200).json(result);
        }
    });
}

module.exports.updateUser = (req, res, next) => {
    const pseudoUpdated = req.body.pseudo;
    const id = req.params.id;
    const sql = `UPDATE users SET pseudo=? WHERE id=?`;
    db.query(sql, [pseudoUpdated, id], (err, result) => {
        if (err) {
            res.status(400).json({err});
        }
        else {
            res.status(200).json(result);
        }
    });
}

module.exports.updateUserPic = (req, res, next) => {
    if (req.file) {
        const pic = `${req.protocol}://${req.get('host')}/images/${req.file.filename}`;
        const id = req.params.id;
        const sql = `UPDATE users SET image=? WHERE id=?`;
        db.query(sql, [pic, id], (err, result) => {
            if (err) {
                console.log(err);
            }
            else {
                res.status(200).json(result);
            }
        })
    }
    else {
        console.log('No file');
    }
}

module.exports.deleteUser = (req, res, next) => {
    const id = req.params.id;
    const sql = `DELETE FROM users WHERE id=?`;
    db.query(sql, [id], (err, result) => {
        if (err) {
            res.status(400).json({err});
        }
        else {
            res.status(200).json(result);
        }
    });
}