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
                    text: " Number of Abductions "
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
                    text: " Number of Sexual Offences Recorded"
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
                    text: "Number of Recorded Crimes"
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

            var jsonimmu = {"BANYULE":92, "BAYSIDE":92, "BOROONDARA":92, "BRIMBANK":93, "CARDINIA":91, "CASEY":94, "DAREBIN":91, "FRANKSTON":92, "GLEN EIRA":93, "GREATER DANDENONG":91, "HOBSONS BAY":93, "HUME":93, "KINGSTON":93, "KNOX":93, "MANNINGHAM":91, "MARIBYRNONG":91, "MAROONDAH":91, "MELBOURNE":85, "MELTON":94, "MONASH":90, "MOONEE VALLEY":93, "MORELAND":91, "MORNINGTON PENINSULA":93, "NILLUMBIK":93, "PORT PHILLIP":87, "STONNINGTON":91, "WHITEHORSE":93, "WHITTLESEA":94, "WYNDHAM":93, "YARRA":92, "YARRA RANGES":92
            };
            var jsonbullying = {"BANYULE":8, "BAYSIDE":11, "BOROONDARA":11, "BRIMBANK":11, "CARDINIA":15, "CASEY":15, "DAREBIN":12, "FRANKSTON":17, "GLEN EIRA":12, "GREATER DANDENONG":11, "HOBSONS BAY":13, "HUME":14, "KINGSTON":11, "KNOX":16, "MANNINGHAM":11, "MARIBYRNONG":11, "MAROONDAH":11, "MELBOURNE":6, "MELTON":16, "MONASH":12, "MOONEE VALLEY":1, "MORELAND":15, "MORNINGTON PENINSULA":15, "NILLUMBIK":11, "PORT PHILLIP":14, "STONNINGTON":9, "WHITEHORSE":1, "WHITTLESEA":14, "WYNDHAM":18, "YARRA":12, "YARRA RANGES":16

            };
            var jsonabuse = {"BANYULE":5.86, "BAYSIDE":2.14, "BOROONDARA":1.8, "BRIMBANK":6.69, "CARDINIA":6.34, "CASEY":7.33, "DAREBIN":6.78, "FRANKSTON":12.4, "GLEN EIRA":2.22, "GREATER DANDENONG":11.04, "HOBSONS BAY":5.12, "HUME":5.96, "KINGSTON":3.88, "KNOX":6.43, "MANNINGHAM":2.97, "MARIBYRNONG":5.88, "MAROONDAH":6.05, "MELBOURNE":5.78, "MELTON":5, "MONASH":5.19, "MOONEE VALLEY":2.53, "MORELAND":4.63, "MORNINGTON PENINSULA":8.71, "NILLUMBIK":1.56, "PORT PHILLIP":4.06, "STONNINGTON":2.38, "WHITEHORSE":3.58, "WHITTLESEA":5.42, "WYNDHAM":5.68, "YARRA":7.73, "YARRA RANGES":5.26

            };

            $scope.dataPointsImmu = [];
            $scope.dataPointsBully = [];
            $scope.dataPointsAbuse = [];

            for(key in jsonimmu){
                $scope.dataPointsImmu.push({label: key, y: jsonimmu[key]});

            }
            for(key in jsonbullying){
                $scope.dataPointsBully.push({label: key, y: jsonbullying[key]});

            }
            for(key in jsonabuse){
                $scope.dataPointsAbuse.push({label: key, y: jsonabuse[key]});

            }

            $scope.chart4 = new CanvasJS.Chart("chart4", {
                animationEnabled: true,

                title:{
                    text: "The Vaccination rates across Melbourne"
                },
                data: [
                    {
                        type: "area", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        label:"Vaccination rates",
                        dataPoints:$scope.dataPointsImmu

                    }
                ]
            });

            $scope.chart4.render();

            $scope.chart5 = new CanvasJS.Chart("chart5", {
                animationEnabled: true,

                title:{
                    text: "Bulliying Rates"
                },
                data: [
                    {
                        type: "area", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        label:"Bullying Rates",
                        dataPoints:$scope.dataPointsBully

                    }
                ]
            });

            $scope.chart5.render();

            $scope.chart6 = new CanvasJS.Chart("chart6", {
                animationEnabled: true,

                title:{
                    text: "Abuse Rates"
                },
                data: [
                    {
                        type: "area", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        label:"Abuse Rates",
                        dataPoints:$scope.dataPointsAbuse

                    }
                ]
            });

            $scope.chart6.render();

        });



    };


});

