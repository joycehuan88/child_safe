/**
 * Created by ZhangHuan on 21/08/2016.
 */

var suburbApp = angular.module ("suburbApp", []);

suburbApp.controller("requestCtrl", function ($scope, $http){

    this.suburb = "";


    $scope.checkboxModel = {
        value1 : true,
        value2 : true,
        value3 : true,
        value4 : true,
        value5 : true,
        value6 : true,
        value7 : true,
        value8 : true
    };


    $scope.search = function () {
        var target = angular.element('#search').val();
        //alert($scope.user.suburb);
        $http.get('/childsafe/analysis/'+target+'/'+$scope.checkboxModel.value1+'/'+$scope.checkboxModel.value2+'/'+$scope.checkboxModel.value3+'/'+$scope.checkboxModel.value4+'/'+$scope.checkboxModel.value5+'/'+$scope.checkboxModel.value6+'/'+$scope.checkboxModel.value7+'/'+$scope.checkboxModel.value8).success(function (data) {
             $scope.council1=data[0];
            $scope.council2=data[1];

        });
    };

    $scope.initPage = function () {
        $http.get('/childsafe/analysis/init').success(function (data) {
            $scope.bullycouncil=data[0];
            $scope.abusecouncil=data[1];
            $scope.immucouncil=data[2];
            $scope.crimecouncil=data[3];
            $scope.drugcouncil=data[4];
            $scope.abductioncouncil=data[5];
            $scope.blackmailcouncil=data[6];
            $scope.sexualcouncil=data[7];

        });

    };


});

