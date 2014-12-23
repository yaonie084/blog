'use strict';
var _ = require('lodash');
var Post = require('./post.model');

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
    return res.json(post);
  });
};

function handleError(res, err) {
  return res.send(500, err);
}