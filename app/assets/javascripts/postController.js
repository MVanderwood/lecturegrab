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
        console.log("success");
        $scope.response = response;
      });
    };

    $scope.togglePostForm = function() {
      $scope.showPostForm = !$scope.showPostForm;
    };

    $scope.addPost = function(newContent) {
      var newPost = {"content": newContent, "userId": $scope.user.id};
      var discussionId = parseInt(window.location.pathname.split("/")[2]);
      var url = "/api/discussions/" + discussionId + "/posts/create";
      $http.post(url, newPost).then(function(response) {
        console.log(response);
        // $scope.posts.push(response.data);
      }, function(error) {
        $scope.errors = error.data.errors;
      });
    };

    window.$scope = $scope;
  });
})();