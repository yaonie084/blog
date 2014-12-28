'use strict';

var mongoose = require('mongoose'),
  Schema = mongoose.Schema;

var CommentSchema = new Schema({
  name: { type: String, require : true },
  email: { type: String, require : true },
  content: { type: String, require : true },
  _post : { type: Schema.Types.ObjectId, ref: 'Post', require : true },
  created_at: {type: Date, 'default': Date.now}
});

module.exports = mongoose.model('Comment', CommentSchema);
