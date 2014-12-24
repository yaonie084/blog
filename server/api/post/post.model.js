'use strict';

var mongoose = require('mongoose'),
  Schema = mongoose.Schema;

var PostSchema = new Schema({
  title: String,
  author: {type: {}, ref: 'User'},
  description: String,
  created_at: {type: Date,'default': Date.now},
  tags: [String],
  active: Boolean
});

module.exports = mongoose.model('Post', PostSchema);
