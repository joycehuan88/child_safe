/**
 * Created by ZhangHuan on 26/08/2016.
 */

(function () {
    var module = angular.module("angular-google-map", ['google-maps'])
        ;


}());

function Controller ($scope, $http, $filter, $window) {


    //
    // $window.navigator.geolocation.getCurrentPosition(function(position){
    //     var lat = position.coords.latitude;
    //     var lng = position.coords.longitude;
    //     console.log(lat+' '+lng)
    //     $scope.$apply(function () {
    //         $scope.lat = lat;
    //         $scope.lng = lng;
    //         $scope.centerProperty = {
    //             lat: $scope.lat ,
    //             lng: $scope.lng
    //         };
    //
    //     });
    // });
    $scope.checkboxModel = {
        value1 : 'N',
        value2 : 'N',
        value3 : 'N',
        value4 : 'N',
        value5 : 'N'
    };

    $scope.radiusdata = {
        singleSelect: '20000'
    };
    $scope.showToilets = {
        value1:'N'
    }

    $scope.showToilets = function(){

        if($scope.showToilets.value1 =='Y'){

            $scope.filteredToilets = $filter('filter')($scope.toilets, $scope.currentSuburb);
            $scope.filteredMarkersProperty =   $scope.filteredToilets;
            calcFocus();
        }else{
            $scope.filteredMarkersProperty =  $scope.places;
        }

    }

    $scope.search = function () {
        $http.get('/childsafe/map/'+$scope.centerProperty.lat+'/'+$scope.centerProperty.lng+'/'+$scope.checkboxModel.value1+'/'+$scope.checkboxModel.value2+'/'+$scope.checkboxModel.value3+'/'+$scope.checkboxModel.value4+'/'+$scope.checkboxModel.value5+'/'+ $scope.radiusdata.singleSelect).success(function (data) {



            $scope.orderProp ="0";
            $scope.filteredParks = data;
            $scope.filteredMarkersProperty = $scope.filteredParks;
            $scope.zoomProperty = 9;
            console.log($scope.filteredMarkersProperty);
            $scope.centerProperty.lat = $scope.lat;
            $scope.centerProperty.lng = $scope.lng;
            calcFocus();
        });
    };
    $scope.updateSuburb = function () {

            $scope.filteredMarkersProperty = $filter('filter')($scope.markersProperty, $scope.orderProp);
            $scope.zoomProperty = 11;
            calcFocus();


    }

    $http.get('resources/data/parks.json').success(function(data) {
        $scope.places = data;
        $scope.markersProperty = data;
        $scope.filteredMarkersProperty = $scope.markersProperty;
        //console.log( $scope.filteredMarkersProperty.length);


        var cats = [];
        for (var i = 0; i < data.length; i++){

                cats[i] = data[i].Council;


        }

        var sorted_cats = cats.sort();

        $scope.categories = [];
        for (var i = 0; i < cats.length; i++){
            if (sorted_cats[i+1] != sorted_cats[i]){
                $scope.categories.push(sorted_cats[i]);
            }
        }


    });

    $http.get('resources/data/parks_toilets.json').success(function(data) {
        $scope.toilets = data;

        console.log($scope.toilets.length);



    });

    //End Data Grab
    //Start Extra Functions for Controller

    // $scope.$watch( 'orderProp', function ( val ) {
    //     $scope.filteredMarkersProperty = $filter('filter')($scope.markersProperty, val);
    //     $scope.zoomProperty = 11;
    //     calcFocus();
    // });

    $scope.showAll = function($event){
        // $scope.orderProp ="0";
        // $scope.filteredMarkersProperty = $scope.places;
        // $scope.zoomProperty = 9;
        // calcFocus();

        $window.navigator.geolocation.getCurrentPosition(function(position){
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;
            $scope.$apply(function () {
                $scope.lat = lat;
                $scope.lng = lng;
                $scope.centerProperty.lat = lat;
                $scope.centerProperty.lng = lng;
            });


        });
        $scope.filteredMarkersProperty = $scope.places;
        calcFocus();
    }

    $scope.select = function($event){
        var theName = $event.name;
        var lat = $event.latitude;
        var lng = $event.longitude;
        $scope.filteredMarkersProperty = [$event];
        $scope.centerProperty.lat = lat;
        $scope.centerProperty.lng = lng;
        $scope.zoomProperty = 14;
        calcFocus();

    }
    function calcFocus(){
        var lats = [], longs = [], counter = [];

        for(i=0; i<$scope.filteredMarkersProperty.length; i++)
        {
            lats[i] = $scope.filteredMarkersProperty[i].latitude;
            longs[i] = $scope.filteredMarkersProperty[i].longitude;
        }

        var latCount = 0;
        var longCount = 0;

        for (i=0; i<lats.length; i++){
            latCount += lats[i];
            longCount += longs[i];
        }


        latCount = latCount / lats.length;
        longCount = longCount / longs.length;
         $scope.centerProperty.lat = latCount;
         $scope.centerProperty.lng = longCount;
    };

    $scope.initPage = function () {
        $window.navigator.geolocation.getCurrentPosition(function(position){
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;
            $scope.$apply(function () {
            $scope.lat = lat;
            $scope.lng = lng;
            $scope.centerProperty.lat = lat;
            $scope.centerProperty.lng = lng;
            });


            var GEOCODING = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + lat+ ',' + lng + '&language=en';

            //console.log($scope.centerProperty.lat+' '+ $scope.centerProperty.lng);

            $.getJSON(GEOCODING).done(function(location) {

                $scope.currentSuburb= location.results[0].address_components[2].long_name;
                // console.log($scope.currentSuburb);
            })


        });




    };


    angular.extend($scope, {


        centerProperty: {
            lat: -37.8136,
            lng: 144.9631
        },

        /** the initial zoom level of the map */
        zoomProperty: 11,

        /** list of markers to put in the map */

        markersProperty : [],
        toilets:[],

        // These 2 properties will be set when clicking on the map - click event
        clickedLatitudeProperty: null,
        clickedLongitudeProperty: null

    });


}
