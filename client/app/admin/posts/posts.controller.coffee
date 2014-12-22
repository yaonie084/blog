'use strict'

angular.module 'myblogApp'
.controller 'AdminPostsCtrl', ($scope, $location, $http, Auth, User) ->

#  $http.get '/api/users'
#  .success (users) ->
#    $scope.users = users

#  $scope.delete = (user) ->
#    User.remove id: user._id
#    _.remove $scope.users, user

  $scope.isActive = (route) ->
    route is $location.path()
