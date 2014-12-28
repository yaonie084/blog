'use strict'

var express = require('express');
var auth = require('../../auth/auth.service');
var controller = require('./post.controller');

var router = express.Router();

router.use("/comments", require('../comment'));

router.get('/', controller.index);
router.get('/:id', controller.show);
router.post('/', auth.isAuthenticated(), controller.create);
router.put('/:id/update', auth.isAuthenticated(), controller.update);
router.delete('/:id', auth.isAuthenticated(), controller.destroy);

module.exports = router;