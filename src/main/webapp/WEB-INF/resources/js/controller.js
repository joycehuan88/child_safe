/**
 * Created by ZhangHuan on 21/08/2016.
 */

var suburbApp = angular.module ("suburbApp", []);

suburbApp.controller("requestCtrl", function ($scope, $http){

    this.suburb = "";


    $scope.checkboxModel = {
        value1 : false, //bully
        value2 : false, //abuse
        value3 : false,//immu
        value4 : false,//crime
        value5 : false,//drug delete
        value6 : false,//abduction
        value7 : false,//balckmail delete
        value8 : false //sexual
    };


    $scope.search = function () {
        var target = angular.element('#search').val();
        //alert($scope.user.suburb);
        $http.get('/childsafe/analysis/'+target+'/'+$scope.checkboxModel.value1+'/'+$scope.checkboxModel.value2+'/'+$scope.checkboxModel.value3+'/'+$scope.checkboxModel.value4+'/'+$scope.checkboxModel.value5+'/'+$scope.checkboxModel.value6+'/'+$scope.checkboxModel.value7+'/'+$scope.checkboxModel.value8).success(function (data) {
             $scope.council1=data[0];
            $scope.council2=data[1];

        });

        $http.get('/childsafe/analysis/stat/'+target).success(function(data) {
            $scope.historyData = data;
            var json1 = $scope.historyData[0];
            var json2 = $scope.historyData[1];
            var json3 = $scope.historyData[2];
            $scope.dataPoints1 = [];
            $scope.dataPoints2 = [];
            $scope.dataPoints3 = [];
            for(key in json1){
                $scope.dataPoints1.push({label: key, y: json1[key]});
            }

            for(key in json2)
            {
                $scope.dataPoints2.push({label: key, y: json2[key]});
            }
            for(key in json3)
            {
                $scope.dataPoints3.push({label: key, y: json3[key]});
            }
            console.log( $scope.dataPoints3)

            $scope.chart1 = new CanvasJS.Chart("chart1", {
                animationEnabled: true,

                title:{
                    text: " The Abduction Rate"
                },
                data: [
                    {
                        type: "line", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        label:"Abduction rate",
                        dataPoints:$scope.dataPoints1
                    }
                ]
            });

            $scope.chart1.render();
            $scope.chart2 = new CanvasJS.Chart("chart2", {
                animationEnabled: true,

                title:{
                    text: " The sexual offence rate"
                },
                data: [
                    {
                        type: "line", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        label:"sexual offence",
                        dataPoints:$scope.dataPoints2

                    }
                ]
            });

            $scope.chart2.render();

            $scope.chart3 = new CanvasJS.Chart("chart3", {
                animationEnabled: true,

                title:{
                    text: "The crime rate"
                },
                data: [
                    {
                        type: "line", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        label:"Crime rate",
                        dataPoints:$scope.dataPoints3

                    }
                ]
            });

            $scope.chart3.render();

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

