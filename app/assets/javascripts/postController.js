/* global angular */

(function() {
  "use strict";
  angular.module("app").controller("postController", function($scope, $http) {

    $scope.setup = function() {
      var discussionId = parseInt(window.location.pathname.split("/")[2]);
      var url = "/api/discussions/" + discussionId + "/posts.json";
      $http.get(url).then(function(response) {
        $scope.discussion = response.data.discussion;
        $scope.posts = response.data.posts;
        $scope.discussionId = discussionId;
        $scope.user = response.data.currentUser;
        $scope.showEditForm = [];
      });
    };



    $scope.togglePostForm = function() {
      $scope.showPostForm = !$scope.showPostForm;
    };

    $scope.toggleEditForm = function(index) {
      if ($scope.user.id === $scope.posts[index].userId) {
        if ($scope.showEditForm[index]) {
          $scope.showEditForm[index] = false;
        } else {
          for (var i = 0; i < $scope.posts.length; i++) {
            $scope.showEditForm[i] = false;
          }
          $scope.showEditForm[index] = true;
        }
      }
    };

    $scope.addPost = function(newContent) {
      var content = newContent;
      var newPost = {"content": content, "userId": $scope.user.id};
      var discussionId = parseInt(window.location.pathname.split("/")[2]);
      var url = "/api/discussions/" + discussionId + "/posts/create";
      $http.post(url, newPost).then(function(response) {
        console.log(response);
        $scope.posts.push(response.data);
      }, function(error) {
        $scope.errors = error.data.errors;
      });
    };

    $scope.editPost = function(post, index, edittedContent) {
      var discussionId = parseInt(window.location.pathname.split("/")[2]);
      var url = "/api/discussions/" + discussionId + "/posts/" + post.id;
      var updatedPost = {"user_id": post.userId, "content": edittedContent};
      $http.patch(url, updatedPost).then(function(response) {
        post["content"] = response.data.content;
        console.log(index);
        $scope.showEditForm[index] = false;
      }, function(error) {
        $scope.errors = error.data.errors;
      });
    };

    window.$scope = $scope;
  });
})();