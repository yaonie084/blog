'use strict'

angular.module 'myblogApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'admin/users',
    url: '/admin/users'
    templateUrl: 'app/admin/users/index.html'
    controller: 'AdminUsersCtrl'
  .state 'admin/posts',
    url: '/admin/posts'
    templateUrl: 'app/admin/posts/index.html'
    controller: 'AdminPostsCtrl'
  .state 'admin/posts/new',
    url: "/admin/posts/new"
    templateUrl: 'app/admin/posts/new.html'
    controller: 'AdminPostNewCtrl'

