'use strict';

var mongoose = require('mongoose'),
  Schema = mongoose.Schema;

var PostSchema = new Schema({
  title: String,
  author: {type: String, ref: 'User'},
  desciption: String,
  created_at: {type: Date,'default': Date.now},
  tags: [String],
  active: Boolean
});

module.exports = mongoose.model('Post', PostSchema);
