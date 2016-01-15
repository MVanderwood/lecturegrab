/* global angular */

(function() {
  "use strict";
  angular.module("app").controller("optionsController", function($scope,$http) {

    $scope.setup = function() {
      var userHandle = window.location.pathname.split("/")[2];
      var url = "/api/users/" + userHandle + "/options.json";
      $http.get(url).then(function(response) {
        $scope.options = response.data.options;
        $scope.user = {"id": response.data.currentUser.id, "handle": userHandle};
      });
    };

    window.$scope = $scope;
  });
})();