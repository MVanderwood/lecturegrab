/* global angular */

(function() {
  "use strict";
  angular.module("app").controller("tagController", function($scope, $http) {

    $scope.lectureSetup = function() {
      var lectureId = window.location.pathname.charAt(window.location.pathname.length - 1);
      var url = "/lectures/" + id + "/tags.json";
      console.log(url);
      // $http.get(url).then(function(response) {
        $scope.tags = response.data.tags;
        $scope
      });
    };

    window.$scope = $scope;
  });
})();