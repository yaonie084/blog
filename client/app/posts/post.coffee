'use strict'

angular.module 'myblogApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'PostDetail',
    url: "/posts/{postId}"
    templateUrl: 'app/posts/show.html'
    controller: 'PostDetailCtrl'