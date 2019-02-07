const express = require('express');
const router = express.Router();
const userService = require('../users/user.service');
const empService = require('./emp.service');
const incentiveService = require('./incentive.service');


// routes
router.post('/authenticate', authenticate);
router.get('/users', getUsers);
router.get('/emp', getEmps);
router.get('/incentive', view_all_incentive);
router.get('/incentive/:empid/views', view_all_incen_By_ID);
router.get('/incentive/:empid/view/:m', view_all_incen_By_m);


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

function view_all_incen_By_ID(req, res, next) {
    incentiveService.getAll(req.params)
        .then(data => res.json(data))
        .catch(err => next(err));
}

function view_all_incen_By_m(req, res, next) {
    incentiveService.getM(req.params)
        .then(data => res.json(data))
        .catch(err => next(err));
}

function view_all_incentive(req, res, next) {
    incentiveService.getAllIncentive()
        .then(data => res.json(data))
        .catch(err => next(err));
}