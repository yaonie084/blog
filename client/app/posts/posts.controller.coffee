'use strict'

angular.module 'myblogApp'
.controller 'PostDetailCtrl', ($scope, $http, $stateParams) ->
  $scope.postID = $stateParams.postId
  $http.get("/api/posts/#{$stateParams.postId}").success (post) ->
    $scope.post = post