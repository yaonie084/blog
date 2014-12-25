'use strict'

angular.module 'myblogApp'
.factory 'Post', ($location, $http, User, $cookieStore, $resource) ->
  currentUser = if $cookieStore.get 'token' then User.get() else {}
  $resource '/api/posts/:id/:controller',
    id: '@_id'