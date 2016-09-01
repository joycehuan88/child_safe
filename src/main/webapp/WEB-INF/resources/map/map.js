/**
 * Created by ZhangHuan on 26/08/2016.
 */

(function () {
    var module = angular.module("angular-google-maps-example", ["google-maps"])
        ;


}());

function ExampleController ($scope, $http, $filter, $window) {


    $window.navigator.geolocation.getCurrentPosition(function(position){
        var lat = position.coords.latitude;
        var lng = position.coords.longitude;
        $scope.$apply(function () {
            $scope.lat = lat;
            $scope.lng = lng;
            $scope.centerProperty = {
                lat: $scope.lat ,
                lng: $scope.lng
            };

        });
    });

    $http.get('resources/data/parks_toilets.json').success(function(data) {
        $scope.places = data;
        $scope.markersProperty = data;
        $scope.filteredMarkersProperty = $scope.markersProperty;
        console.log( $scope.filteredMarkersProperty.length);


        var cats = [];
        for (var i = 0; i < data.length; i++){
            if(data.type !='toilet'){
                cats[i] = data[i].Suburb;
            }

        }

        var sorted_cats = cats.sort();

        $scope.categories = [];
        for (var i = 0; i < cats.length; i++){
            if (sorted_cats[i+1] != sorted_cats[i]){
                $scope.categories.push(sorted_cats[i]);
            }
        }


    });

    //End Data Grab
    //Start Extra Functions for Controller

    $scope.$watch( 'orderProp', function ( val ) {
        $scope.filteredMarkersProperty = $filter('filter')($scope.markersProperty, val);
        $scope.zoomProperty = 11;
        calcFocus();
    });

    $scope.showAll = function($event){
        $scope.orderProp ="0";
        $scope.filteredMarkersProperty = $scope.places;
        $scope.zoomProperty = 11;
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
        //calcFocus();

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
