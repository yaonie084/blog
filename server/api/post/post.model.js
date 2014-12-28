'use strict';

var mongoose = require('mongoose'),
  Schema = mongoose.Schema;

var PostSchema = new Schema({
  title: String,
  summary: String,
  author: {type: {}, ref: 'User'},
  description: String,
  created_at: {type: Date,'default': Date.now},
  tags: [String],
  active: Boolean,
  comments : [{ type: Schema.Types.ObjectId, ref: 'Comment' }]
});

module.exports = mongoose.model('Post', PostSchema);
