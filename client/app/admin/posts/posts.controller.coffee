'use strict'

angular.module 'myblogApp'
.controller 'AdminPostsCtrl', ($scope, $location, $http, Auth, User, Post) ->
  $http.get '/api/posts'
  .success (posts) ->
    $scope.posts = posts

  $scope.delete = (post) ->
    Post.remove id: post._id
    _.remove $scope.posts, post

  $scope.isActive = (route) ->
    route is $location.path()

.controller 'AdminPostNewCtrl', ($scope, $location, $http, Post, $q) ->
  $scope.createPost = (form) ->
    if form.$valid
      Post.save $scope.post,
        (data) ->
          $location.path '/admin/posts'
        , (err) ->
          console.log err

  $scope.isActive = (route) ->
    if $location.path().indexOf(route) == -1
      return false
    true
