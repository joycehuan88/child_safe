/**
 * Created by ZhangHuan on 21/08/2016.
 */

var suburbApp = angular.module("suburbApp", []);

suburbApp.controller("requestCtrl", function ($scope, $http) {

    this.suburb = "";


    $scope.checkboxModel = {
        value1: false, //bully
        value2: false, //abuse
        value3: false,//immu
        value4: false,//crime
        value5: false,//drug delete
        value6: false,//abduction
        value7: false,//balckmail delete
        value8: false //sexual
    };


    $scope.search = function () {
        var target = angular.element('#search').val();
        //alert($scope.user.suburb);
        $http.get('/childsafe/analysis/' + target).success(function (data) {
            $scope.council1 = data[0];
            $scope.council2 = data[1];

        });

        $http.get('/childsafe/analysis/stat/' + target).success(function (data) {
            $scope.historyData = data;
            var json1 = $scope.historyData[0];  //abduction
            var json2 = $scope.historyData[1];  //sexual
            var json3 = $scope.historyData[2];   //crime
            var json4 = $scope.historyData[3];   //bully

            var json5 = $scope.historyData[4];
            var json6 = $scope.historyData[5];
            var json7 = $scope.historyData[6];
            var json8 = $scope.historyData[7];
            $scope.dataPoints1 = [];
            $scope.dataPoints2 = [];
            $scope.dataPoints3 = [];
            $scope.dataPoints4 = [];
            $scope.dataPointsAveAbdction = [];
            $scope.dataPointsAveSexual = [];
            $scope.dataPointsAveCrime = [];
            $scope.dataPointsAveBully = [];
            for (key in json1) {
                $scope.dataPoints1.push({label: key, y: json1[key]});
            }

            for (key in json2) {
                $scope.dataPoints2.push({label: key, y: json2[key]});
            }
            for (key in json3) {
                $scope.dataPoints3.push({label: key, y: json3[key]});
            }

            for (key in json4) {
                $scope.dataPoints4.push({label: key, y: json4[key]});
            }


            for (key in json5) {
                $scope.dataPointsAveAbdction.push({label: key, y: json5[key]});
            }
            for (key in json6) {
                $scope.dataPointsAveSexual.push({label: key, y: json6[key]});
            }
            for (key in json7) {
                $scope.dataPointsAveCrime.push({label: key, y: json7[key]});
            }
            for (key in json8) {
                $scope.dataPointsAveBully.push({label: key, y: json8[key]});
            }


            $scope.chart1 = new CanvasJS.Chart("chart1", {
                animationEnabled: true,

                title: {
                    text: "Abduction Trend",
                    fontSize: 22,
                },
                data: [
                    {
                        type: "line", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        legendText: "Suburb abduction rate",
                        label: "Abduction rate",
                        dataPoints: $scope.dataPoints1
                    },
                    {
                        type: "line",
                        showInLegend: true,
                        legendText: "Abduction Average rate",
                        label: " Average Abduction rate",
                        dataPoints: $scope.dataPointsAveAbdction
                    }
                ]
            });

            $scope.chart1.render();
            $scope.chart2 = new CanvasJS.Chart("chart2", {
                animationEnabled: true,

                title: {
                    text: " Sexual offence cases recorded",
                    fontSize: 22,
                },
                data: [
                    {
                        type: "line", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        legendText: "Rate of sexual offence",
                        label: "sexual offence",
                        dataPoints: $scope.dataPoints2

                    },
                    {
                        type: "line", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        legendText: "Average sexual offence",
                        label: "Average sexual offence",
                        dataPoints: $scope.dataPointsAveSexual

                    }
                ]
            });

            $scope.chart2.render();

            $scope.chart3 = new CanvasJS.Chart("chart3", {
                animationEnabled: true,

                title: {
                    text: "The crime rate",
                    fontSize: 22
                },
                data: [
                    {
                        type: "line", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        legendText: "Crime rate",
                        label: "Crime rate",
                        dataPoints: $scope.dataPoints3

                    },
                    {
                        type: "line", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        legendText: "Average Crime rate",
                        label: "Average Crime rate",
                        dataPoints: $scope.dataPointsAveCrime

                    }
                ]
            });

            $scope.chart3.render();

            $scope.chart5 = new CanvasJS.Chart("chart5", {
                animationEnabled: true,

                title: {
                    text: "Bulliying Rate",
                    fontSize: 22
                },
                data: [
                    {
                        type: "line", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        legendText: "bullying rate",
                        label: "Bullying Rates",
                        dataPoints: $scope.dataPoints4

                    },
                    {
                        type: "line", //change type to bar, line, area, pie, etc
                        showInLegend: true,
                        legendText: "Average bullying rate",
                        label: "Average bullying rate",
                        dataPoints: $scope.dataPointsAveBully

                    }
                ]
            });

            $scope.chart5.render();


            $scope.chart4 = new CanvasJS.Chart("chart4", {
                animationEnabled: true,

                title: {
                    text: "The Vaccination coverage rates across Melbourne",
                    fontSize: 22,
                },
                axisY: {
                    minimum: 0.5,
                },
                legend: {
                    verticalAlign: "bottom",
                    horizontalAlign: "center"
                },
                data: [
                    {
                        type: "column",
                        showInLegend: true,
                        legendMarkerColor: "grey",
                        legendText: "vaccination rate",
                        dataPoints: [
                            {y: $scope.council1.vacc_rate, label: "suburb"},
                            {y: $scope.council2.vacc_rate,  label: "average" },
                            {y: parseFloat($scope.highestVaccRate),  label: "highest rate"}
                        ]
                    }
                ]
            });

            $scope.chart4.render();

            $scope.chart6 = new CanvasJS.Chart("chart6", {
                animationEnabled: true,

                title: {
                    text: "Abuse Rate Trend",
                    fontSize: 22,
                },
                legend: {
                    verticalAlign: "bottom",
                    horizontalAlign: "center"
                },
                data: [
                    {
                        type: "column",
                        showInLegend: true,
                        legendMarkerColor: "grey",
                        legendText: "Abuse rate",
                        dataPoints: [
                            {y: $scope.council1.abuse_rate, label: "suburb"},
                            {y: $scope.council2.abuse_rate,  label: "average" },
                            {y: parseFloat($scope.lowestAbuseRate),  label: "lowest rate"}
                        ]
                    }
                ]
            });

            $scope.chart6.render();

        });

    };

    $scope.initPage = function () {
        $http.get('/childsafe/analysis/init').success(function (data) {
            $scope.bullycouncil = data[0];
            $scope.abusecouncil = data[1];
            $scope.immucouncil = data[2];
            $scope.crimecouncil = data[3];
            // $scope.drugcouncil = data[4];
            $scope.abductioncouncil = data[4];
            // $scope.blackmailcouncil = data[6];
            $scope.sexualcouncil = data[5];

            $scope.lowestBullyRate = data[6];
            $scope.lowestAbuseRate = data[7];
            $scope.highestVaccRate = data[8];
            $scope.lowestCrimeRate = data[9];
            $scope.lowestAbductionRate = data[10];
            $scope.lowestSexualRate = data[11];


            var jsonimmu = {
                "BANYULE": 0.92,
                "BAYSIDE": 0.92,
                "BOROONDARA": 0.92,
                "BRIMBANK": 0.93,
                "CARDINIA": 0.91,
                "CASEY": 0.94,
                "DAREBIN": 0.91,
                "FRANKSTON": 0.92,
                "GLEN EIRA": 0.93,
                "GREATER DANDENONG": 0.91,
                "HOBSONS BAY": 0.93,
                "HUME": 0.93,
                "KINGSTON": 0.93,
                "KNOX": 0.93,
                "MANNINGHAM": 0.91,
                "MARIBYRNONG": 0.91,
                "MAROONDAH": 0.91,
                "MELBOURNE": 0.85,
                "MELTON": 0.94,
                "MONASH": 0.9,
                "MOONEE VALLEY": 0.93,
                "MORELAND": 0.91,
                "MORNINGTON PENINSULA": 0.93,
                "NILLUMBIK": 0.93,
                "PORT PHILLIP": 0.87,
                "STONNINGTON": 0.91,
                "WHITEHORSE": 0.93,
                "WHITTLESEA": 0.94,
                "WYNDHAM": 0.93,
                "YARRA": 0.92,
                "YARRA RANGES": 0.92
            };

            var jsonabuse = {
                "BANYULE": 5.86,
                "BAYSIDE": 2.14,
                "BOROONDARA": 1.8,
                "BRIMBANK": 6.69,
                "CARDINIA": 6.34,
                "CASEY": 7.33,
                "DAREBIN": 6.78,
                "FRANKSTON": 12.4,
                "GLEN EIRA": 2.22,
                "GREATER DANDENONG": 11.04,
                "HOBSONS BAY": 5.12,
                "HUME": 5.96,
                "KINGSTON": 3.88,
                "KNOX": 6.43,
                "MANNINGHAM": 2.97,
                "MARIBYRNONG": 5.88,
                "MAROONDAH": 6.05,
                "MELBOURNE": 5.78,
                "MELTON": 5,
                "MONASH": 5.19,
                "MOONEE VALLEY": 2.53,
                "MORELAND": 4.63,
                "MORNINGTON PENINSULA": 8.71,
                "NILLUMBIK": 1.56,
                "PORT PHILLIP": 4.06,
                "STONNINGTON": 2.38,
                "WHITEHORSE": 3.58,
                "WHITTLESEA": 5.42,
                "WYNDHAM": 5.68,
                "YARRA": 7.73,
                "YARRA RANGES": 5.26

            };

            $scope.dataPointsImmu = [];
            // $scope.dataPointsBully = [];
            $scope.dataPointsAbuse = [];

            for (key in jsonimmu) {
                $scope.dataPointsImmu.push({label: key, y: jsonimmu[key]});

            }
            for (key in jsonabuse) {
                $scope.dataPointsAbuse.push({label: key, y: jsonabuse[key]});

            }
            //
            // $scope.chart4 = new CanvasJS.Chart("chart4", {
            //     animationEnabled: true,
            //
            //     title: {
            //         text: "The Vaccination coverage rates across Melbourne",
            //         fontSize: 22,
            //     },
            //     // axisY: {
            //     //     minimum: 0.8,
            //     // },
            //     // axisX: {
            //     //     labelWrap: true,   // change it to false
            //     //     interval: 1,
            //     //     labelFontSize: 8
            //     // },
            //     data: [
            //         // {
            //         //     type: "area", //change type to bar, line, area, pie, etc
            //         //     showInLegend: true,
            //         //     legendText: "Vaccination Rate",
            //         //     label: "Vaccination rates",
            //         //     dataPoints: $scope.dataPointsImmu
            //         //
            //         // }
            //         {
            //             type: "column",
            //             showInLegend: true,
            //             legendMarkerColor: "grey",
            //             legendText: "MMbbl = one million barrels",
            //             dataPoints: [
            //                 {y: $scope.council1.abduction_rated, label: "suburb"},
            //                 {y: $scope.council2.abduction_rated,  label: "average" },
            //                 {y: $scope.highestVaccRate,  label: "highest rate"}
            //             ]
            //         }
            //     ]
            // });

            // $scope.chart4.render();

            // $scope.chart5 = new CanvasJS.Chart("chart5", {
            //     animationEnabled: true,
            //
            //     title: {
            //         text: "Bulliying Rates",
            //         fontSize: 22,
            //     },
            //     axisX: {
            //         labelWrap: true,   // change it to false
            //         interval: 1,
            //         labelFontSize: 8
            //     },
            //     data: [
            //         {
            //             type: "area", //change type to bar, line, area, pie, etc
            //             showInLegend: true,
            //             legendText: "bullying rate",
            //             label: "Bullying Rates",
            //             dataPoints: $scope.dataPointsBully
            //
            //         }
            //     ]
            // });
            //
            // $scope.chart5.render();

            // $scope.chart6 = new CanvasJS.Chart("chart6", {
            //     animationEnabled: true,
            //
            //     title: {
            //         text: "Abuse Rates",
            //         fontSize: 22,
            //     },
            //     axisX: {
            //         labelWrap: true,   // change it to false
            //         interval: 1,
            //         labelFontSize: 8
            //     },
            //     data: [
            //         {
            //             type: "area", //change type to bar, line, area, pie, etc
            //             showInLegend: true,
            //             legendText: "Abuse rate",
            //             label: "Abuse Rates",
            //             dataPoints: $scope.dataPointsAbuse
            //
            //         }
            //     ]
            // });
            //
            // $scope.chart6.render();

        });


    };


});

