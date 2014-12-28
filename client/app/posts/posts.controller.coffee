'use strict'

angular.module 'myblogApp'
.controller 'PostDetailCtrl', ($scope, $http, $stateParams) ->
  $scope.postID = $stateParams.postId
  $http.get("/api/posts/#{$stateParams.postId}").success (post) ->
    $scope.post = post

  $scope.createComment = (form) ->
    comment = $scope.comment
    $http.post("/api/posts/comments/#{$stateParams.postId}", comment).success (post) ->
      $scope.post = post
      $scope.comment = {}