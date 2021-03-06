'use strict';
var _ = require('lodash');
var Post = require('./post.model');
var User = require('../user/user.model');

var validationError = function(res, err) {
  return res.json(422, err);
};

exports.index = function(req, res){
  Post.find(function(err, posts){
    if(err) { return handleError(res, err); }
    return res.json(200, posts)
  })
};

exports.show = function(req, res) {
  Post.findById(req.params.id, function (err, post) {
    if(err) { return handleError(res, err); }
    if(!post) { return res.send(404); }
  })
  .populate('comments')
  .exec(function(err, post){
    return res.json(200, post);
  });
};

// Creates a new post in the DB.
exports.create = function(req, res) {

  var userId = req.user._id;
  User.findOne({
    _id: userId
  }, '-salt -hashedPassword', function(err, user) {
    if (err) return next(err);
    if (!user) return res.json(401);
    var post = req.body
    post.author = user
    post.tags = post.tags.split(',')
    Post.create(post, function(err, post) {
      if(err) { return handleError(res, err); }
      return res.json(201, post);
    });
  });
};

exports.update = function(req, res) {
  var postId = req.body._id;
  var post = req.body;
  post.tags = post.tags.split(',')
  delete post._id
  Post.findByIdAndUpdate(postId, post, function (err, post) {
    if (err) return validationError(res, err);
    res.send(200);
   });
};

// Deletes a post from the DB.
exports.destroy = function(req, res) {
  Post.findById(req.params.id, function (err, post) {
    if(err) { return handleError(res, err); }
    if(!post) { return res.send(404); }
    post.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.send(204);
    });
  });
};

function handleError(res, err) {
  return res.send(500, err);
}