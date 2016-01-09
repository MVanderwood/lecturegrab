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

    $scope.tagClick = function() {
      console.log("click");
    };

    $scope.unconfirmedTagDisplay = function(tag) {
      if (tag.confirmed === false && $scope.user.role === "administrator") {
        return true;
      }
    };

    window.$scope = $scope;
  });
})();