const express = require('express');
const router = express.Router();
const userService = require('../users/user.service');
const empService = require('./emp.service');
// routes
router.post('/authenticate', authenticate);
router.get('/users', getUsers);
router.get('/emp', getEmps);


module.exports = router;

function authenticate(req, res, next) {
    userService.authenticate(req.body)
        .then(user => user ? res.json(user) : res.status(400).json({ message: 'Username or password is incorrect' }))
        .catch(err => next(err));
}

function getUsers(req, res, next) {
    userService.getAll()
        .then(users => res.json(users))
        .catch(err => next(err));
}

function getEmps(req, res, next) {
    empService.getAll()
        .then(users => res.json(users))
        .catch(err => next(err));
}