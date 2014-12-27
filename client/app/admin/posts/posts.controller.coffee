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

.controller 'AdminPostEditCtrl', ($scope, $location, $http, $stateParams, Post) ->
  $id = $stateParams.postId
  $scope.post = Post.get id: $id
  $scope.updatePost = (form) ->
    if form.$valid
      $http.put "/api/posts/#{$id}/update", $scope.post
      .success (data) ->
        $location.path '/admin/posts'

  $scope.isActive = (route) ->
    if $location.path().indexOf(route) == -1
      return false
    true

.directive "ckEditor", [->
  require: "?ngModel"
  link: ($scope, elm, attr, ngModel) ->
    ck = CKEDITOR.replace(elm[0])
    ck.on "pasteState", ->
      $scope.$apply ->
        ngModel.$setViewValue ck.getData()

    ngModel.$render = (value) ->
      ck.setData ngModel.$modelValue
]