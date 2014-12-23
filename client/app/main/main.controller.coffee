'use strict'

angular.module 'myblogApp'
.controller 'MainCtrl', ($scope, $http, socket) ->
  $scope.awesomeThings = []
  $scope.posts = []

  $http.get('/api/things').success (awesomeThings) ->
    $scope.awesomeThings = awesomeThings
    socket.syncUpdates 'thing', $scope.awesomeThings

  $http.get('/api/posts').success (posts) ->
    $scope.posts = posts

  $scope.addThing = ->
    return if $scope.newThing is ''
    $http.post '/api/things',
      name: $scope.newThing

    $scope.newThing = ''

  $scope.deleteThing = (thing) ->
    $http.delete '/api/things/' + thing._id

  $scope.$on '$destroy', ->
    socket.unsyncUpdates 'thing'
