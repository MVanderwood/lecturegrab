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

    $scope.toggleTagForm = function() {
      $scope.showTagForm = !$scope.showTagForm;
    };

    $scope.addTag = function(inputTitle) {
      var newTag = {"title": titleCase(inputTitle), "user_id": $scope.user.id};
      var lectureId = parseInt(window.location.pathname.split("/")[2]);
      var url = "/api/lectures/" + lectureId + "/tags/create";
      $http.post(url, newTag).then(function(response) {
        $scope.tags.push(response.data);
        $scope.toggleTagForm();
      }, function(error) {
        $scope.errors = error.data.errors;
      });
    };

    $scope.confirmTag = function(tag) {
      if ($scope.user.role === "administrator") {
        var lectureId = parseInt(window.location.pathname.split("/")[2]);
        var url = "/api/lectures/" + lectureId + "/tags/" + tag.tagId;
        $http.patch(url).then(function(response) {
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
        var lectureId = parseInt(window.location.pathname.split("/")[2]);
        var url = "/api/lectures/" + lectureId + "/tags/" + tag.tagId;
        $http.delete(url).then(function(response) {
          console.log(response);
          $scope.tags.splice(index, 1);  //Not working currently
        }, function(error) {
          console.log(error.data.errors);
        });
      }
    };

    var titleCase = function(str) {
      return str.replace(/\w\S*/g, function(txt) {
        return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
      });
    };


    window.$scope = $scope;
  });
})();