/* global angular */

(function() {
  "use strict";
  angular.module("app").controller("lectureTagController", function($scope, $http) {

    $scope.setup = function() {
      var lectureId = parseInt(window.location.pathname.split("/")[2]);
      var url = "/api/lectures/" + lectureId + "/tags.json";
      $http.get(url).then(function(response) {
        $scope.tags = response.data.tags;
        $scope.lectureId = lectureId;
        $scope.user = response.data.currentUser;
      });
    };

    $scope.unconfirmedTagDisplay = function(tag) {
      if (tag.confirmed === false && $scope.user.role === "administrator") {
        return true;
      } else {
        return false;
      }
    };

    $scope.toggleConfirmationButtons = function(tag) {
      if ($scope.user.role === "administrator") {
        tag.showButtons = !tag.showButtons;
      }
    };

    // $scope.addTag = function(title) {
    //   var lectureId = parseInt(window.location.pathname.split("/")[2]);
    //   var url = "/api/lectures/" + lectureId + "/tags/create";
    //   $http.post(url, title).then(function(response) {

    //   }, function(error) {

    //   });
    // };

    $scope.confirmTag = function(tag) {
      if ($scope.user.role === "administrator") {
        var lectureId = parseInt(window.location.pathname.split("/")[2]);
        var url = "/api/lectures/" + lectureId + "/tags/" + tag.tagId;
        $http.post(url, tag).then(function(response) {
          console.log(response);
          tag.confirmed = true;
        }, function(error) {
          console.log(error);
          $scope.errors = error.data.errors;
        });
      }
    };

    $scope.rejectTag = function(tag, index) {
      if ($scope.user.role === "administrator") {
        $scope.tags.splice(index, 1);
      }
    };

    window.$scope = $scope;
  });
})();