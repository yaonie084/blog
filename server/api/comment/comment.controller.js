'use strict';
var _ = require('lodash');
var Comment = require('./comment.model');
var Post = require('../post/post.model');

exports.index = function(req, res){
  Post.findById(req.params.postId)
             .populate('comments')
             .exec(function(err, post){
                return res.json(200, post.comments);
             });
};

exports.create = function(req, res){
  var comment_params = req.body
  Post.findById(req.params.postId, function(err, post){
    comment_params._post = post._id;
    var comment = new Comment(comment_params);
    comment.save(function(err, comment){
      post.comments.push(comment);
      post.save(function(err, post_params){
        Post.findById(post_params._id)
        .populate('comments')
        .exec(function(err, post){
          return res.json(200, post);
        });
      });
    });
  });
};