'use strict'

angular.module 'myblogApp'
.controller 'AdminPostsCtrl', ($scope, $location, $http, Auth, User) ->

  $http.get '/api/posts'
  .success (posts) ->
    $scope.posts = posts

#  $scope.delete = (user) ->
#    User.remove id: user._id
#    _.remove $scope.users, user

  $scope.isActive = (route) ->
    route is $location.path()

.controller 'PostDetailCtrl', ($scope, $location, $http) ->
  $scope.foo = 'bar'
