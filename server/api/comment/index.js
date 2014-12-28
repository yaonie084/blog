'use strict'

var express = require('express');
var controller = require('./comment.controller');
var router = express.Router();

router.get('/:postId', controller.index);
router.post('/:postId', controller.create);

module.exports = router;