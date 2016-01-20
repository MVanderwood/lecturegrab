/* global angular */

(function() {
  "use strict";
  angular.module("app").controller("optionsController", function($scope, $http) {

    $scope.setup = function() {
      var userHandle = window.location.pathname.split("/")[2];
      var url = "/api/users/" + userHandle + "/options.json";
      $http.get(url).then(function(response) {
        $scope.options = response.data.options;
        $scope.user = {"id": response.data.currentUser.id, "handle": userHandle, "subjects": response.data.currentUser.subjects};
        $scope.showEditForm = [];
      });
    };

    $scope.toggleEditForm = function(index, option) {
      if ($scope.showEditForm[index]) {
        $scope.showEditForm[index] = false;
      } else {
        for (var i = 0; i < $scope.options.length; i++) {
          $scope.showEditForm[i] = false;
        }
        console.log(option.deliveryHour);
        $scope.updatedSubject = option.subject;
        $scope.updatedDay = option.deliveryDay;
        $scope.updatedHour = $scope.unClockTime(option.deliveryHour);
        $scope.updatedInterval = option.deliveryInterval;
        $scope.updatedDelivery = option.deliveryMethod;
        $scope.showEditForm[index] = true;
      }
    };

    $scope.addOption = function() {
      var userHandle = window.location.pathname.split("/")[2];
      var url = "/api/users/" + userHandle + "/options/create";
      var newOption = {"user_id": $scope.user.id , "subject": $scope.newSubject, "day": $scope.newDay, "time": $scope.clockTime($scope.newHour), "delivery_interval": $scope.newInterval, "delivery_method": $scope.newDelivery};
      $http.post(url, newOption).then(function(response) {
        $scope.options.push(response.data.option);
        $scope.newSubject = "";
        $scope.newDay = "";
        $scope.newHour = "";
        $scope.newInterval = "";
        $scope.newDelivery = "";
      }, function(error) {
        console.log(error);
      });
    };

    $scope.editOption = function(option, index) {
      var userHandle = window.location.pathname.split("/")[2];
      var url = "/api/users/" + userHandle + "/options/" + option.id;
      console.log('teh url is', url);
      var updatedOption = {"option_id": option.id, "subject": $scope.updatedSubject, "day": $scope.updatedDay, "time": $scope.clockTime($scope.updatedHour), "delivery_interval": $scope.updatedInterval, "delivery_method": $scope.updatedDelivery};
      $http.patch(url, updatedOption).then(function(response) {
        console.log('teh response is', response);
        $scope.options[index] = response.data.option;
        console.log(response);
      }, function(error) {
        console.log(error);
      });
      $scope.showEditForm[index] = false;
    };

    $scope.deleteOption = function(option, index) {
      var userHandle = window.location.pathname.split("/")[2];
      var url = "/api/users/" + userHandle + "/options/" + option.id;
      $http.delete(url, {"option_id": option.id}).then(function(response) {
        console.log(response);
      }, function(error) {
        console.log(error);
      });
      $scope.options.splice(index, 1);
    };

    $scope.clockTime = function(uglyTime) {
      if (typeof uglyTime === "string") {
        return uglyTime;
      } else if (parseInt(uglyTime.getHours()) > 12) {
        return (parseInt(uglyTime.getHours()) - 12) + ":" + uglyTime.getMinutes() + " PM";
      } else {
        return parseInt(uglyTime.getHours()) + ":" + uglyTime.getMinutes() + " AM";
      }
    };

    $scope.unClockTime = function(prettyTime) {
      var hour = parseInt(prettyTime.split(":")[0]);
      var minutes = parseInt(prettyTime.split(":")[1].split(" ")[0]);
      var m = prettyTime.split(":")[1].split(" ")[1];
      if (m === "PM") {
        return new Date(0, 0, 0, hour + 12, minutes);
      } else {
        return new Date(0, 0, 0, hour, minutes);
      }
    };

    $scope.changeSubject = function(value) {
      console.log('changed?', value);
      $scope.updatedSubject = value;
    };

    $scope.changeDay = function(value) {
      console.log('changed?', value);
      $scope.updatedDay = value;
    };

    $scope.changeHour = function(value) {
      console.log('changed?', value);
      $scope.updatedHour = value;
    };

    $scope.changeInterval = function(value) {
      console.log('changed?', value);
      $scope.updatedInterval = value;
    };

    $scope.changeDelivery = function(value) {
      console.log('changed?', value);
      $scope.updatedDelivery = value;
    };

    window.$scope = $scope;
  });
})();