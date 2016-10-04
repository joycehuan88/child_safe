/**
 * Created by ZhangHuan on 26/08/2016.
 */

(function () {
    var module = angular.module("angular-google-map", ['google-maps'])
        ;


}());

function Controller ($scope, $http, $filter, $window) {

    google.maps.event.addDomListener(window, 'load', function () {
        var places = new google.maps.places.Autocomplete(document.getElementById('txtPlaces'));
        google.maps.event.addListener(places, 'place_changed', function () {
            var place = places.getPlace();
            var address = place.formatted_address;
            var geometry = place.geometry;

            var lat = place.geometry.viewport.f.f
            var lng = place.geometry.viewport.b.b;
            // $scope.lat = lat;
            // $scope.lng = lng;
            $scope.centerProperty.lat = lat;
            $scope.centerProperty.lng = lng;

            var mesg = "Address: " + address;
            mesg += "\nLatitude: " + lat;
            mesg += "\nLongitude: " + lng;
           // alert(mesg);
           //  console.log(place);
        });
    });
    $scope.radius = {
        value:"5000"
    };

    $scope.checkboxModel = {
        value1 : 'N',
        value2 : 'N',
        value3 : 'N',
        value4 : 'N',
        value5 : 'N'
    };


    $scope.selectedRow = null;  // initialize our variable to null

    $scope.openMarker = function (index) {
        $scope.selectedRow = index;  //function that sets the value of selectedRow to current index

        $scope.openInfoWindowIndex = index;
        console.log( $scope.openInfoWindowIndex);

    };


    $scope.searchForPark = function () {
        // $http.get('/childsafe/map/'+$scope.centerProperty.lat+'/'+$scope.centerProperty.lng+'/'+$scope.checkboxModel.value1+'/'+$scope.checkboxModel.value2+'/'+$scope.checkboxModel.value3+'/'+$scope.checkboxModel.value4+'/'+$scope.checkboxModel.value5+'/'+ $scope.radius).success(function (data) {
        //
        //
        //
        //     $scope.orderProp ="0";
        //     $scope.filteredParks = data;
        //     $scope.filteredMarkersProperty = $scope.filteredParks;
        //     $scope.zoomProperty = 9;
        //     console.log($scope.filteredMarkersProperty);
        //     $scope.centerProperty.lat = $scope.lat;
        //     $scope.centerProperty.lng = $scope.lng;
        //     calcFocus();
        // });

        $http.get('/childsafe/map/'+$scope.centerProperty.lat+'/'+$scope.centerProperty.lng+'/'+ $scope.radius.value).success(function (data) {



            if(data === "" || data === null || typeof data === "undefined" || data.length ==0){
              //  $scope.filteredMarkersProperty = $scope.places;
                $scope.zoomProperty = 11;
                calcFocus();
            }else {
                data.sort(function(a, b){

                    //compare two values
                    if(a.park_name.toLowerCase() < b.park_name.toLowerCase()) return -1;
                    if(a.park_name.toLowerCase() > b.park_name.toLowerCase()) return 1;
                    return 0;

                });
                $scope.selectedRow = null;
                $scope.filteredParks = data;
                $scope.filteredMarkersProperty = $scope.filteredParks;
                $scope.zoomProperty = 11;
                console.log($scope.filteredMarkersProperty);
                calcFocus();
            }



        });
    };

    $scope.updateSuburb = function () {

            $scope.filteredMarkersProperty = $filter('filter')($scope.markersProperty, $scope.orderProp);
            $scope.zoomProperty = 11;
            calcFocus();


    }

    // $http.get('resources/data/parks.json').success(function(data) {
    //     $scope.places = data;
    //     $scope.markersProperty = data;
    //     $scope.filteredMarkersProperty = $scope.markersProperty;
    //     //console.log( $scope.filteredMarkersProperty.length);
    //
    //
    //     var cats = [];
    //     for (var i = 0; i < data.length; i++){
    //
    //             cats[i] = data[i].Council;
    //
    //
    //     }
    //
    //     var sorted_cats = cats.sort();
    //
    //     $scope.categories = [];
    //     for (var i = 0; i < cats.length; i++){
    //         if (sorted_cats[i+1] != sorted_cats[i]){
    //             $scope.categories.push(sorted_cats[i]);
    //         }
    //     }
    //
    // });

    // $http.get('resources/data/parks_toilets.json').success(function(data) {
    //     $scope.toilets = data;
    // });

    //End Data Grab
    //Start Extra Functions for Controller

    // $scope.$watch( 'orderProp', function ( val ) {
    //     $scope.filteredMarkersProperty = $filter('filter')($scope.markersProperty, val);
    //     $scope.zoomProperty = 11;
    //     calcFocus();
    // });

    $scope.showAll = function(){
        // $scope.orderProp ="0";
        // $scope.filteredMarkersProperty = $scope.places;
        // $scope.zoomProperty = 9;

        // $window.navigator.geolocation.getCurrentPosition(function(position){
        //     var lat = position.coords.latitude;
        //     var lng = position.coords.longitude;
        //     $scope.$apply(function () {
        //         $scope.lat = lat;
        //         $scope.lng = lng;
        //         $scope.centerProperty.lat = lat;
        //         $scope.centerProperty.lng = lng;
        //     });
        //
        //
        // });
        $scope.selectedRow = null;
        $scope.filteredMarkersProperty = $scope.places;
        $scope.centerProperty.lat = -37.8136;
        $scope.centerProperty.lng = 144.9631;
            //calcFocus();
    };

    $scope.select = function($event){
        var theName = $event.name;
        var lat = $event.latitude;
        var lng = $event.longitude;
        $scope.filteredMarkersProperty = [$event];
        $scope.centerProperty.lat = lat;
        $scope.centerProperty.lng = lng;
        $scope.zoomProperty = 14;
        calcFocus();

    };
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

    $scope.checkBoxChange = function() {
       // alert($scope.checkboxModel.value1);
        $http.get('/childsafe/map/'+$scope.centerProperty.lat+'/'+$scope.centerProperty.lng+'/'+$scope.checkboxModel.value1+'/'+$scope.checkboxModel.value2+'/'+$scope.checkboxModel.value3+'/'+$scope.checkboxModel.value4+'/'+$scope.checkboxModel.value5+'/'+ $scope.radius.value).success(function (data) {



            if(data === "" || data === null || typeof data === "undefined" || data.length ==0){
               // $scope.filteredMarkersProperty = $scope.places;
                $scope.zoomProperty = 11;
                calcFocus();
            }
            else{
                data.sort(function(a, b){

                    //compare two values
                    if(a.park_name.toLowerCase() < b.park_name.toLowerCase()) return -1;
                    if(a.park_name.toLowerCase() > b.park_name.toLowerCase()) return 1;
                    return 0;

                });
                $scope.selectedRow = null;
                $scope.filteredMarkersProperty = data;
                $scope.zoomProperty = 11;
                console.log($scope.filteredMarkersProperty);
                $scope.centerProperty.lat = $scope.lat;
                $scope.centerProperty.lng = $scope.lng;
                calcFocus();

            }


        });
    };

    $scope.initPage = function () {
        // $http.get('resources/data/parks.json').success(function(data) {
        //     $scope.places = data;
        //     $scope.markersProperty = data;
        //     $scope.filteredMarkersProperty = $scope.markersProperty;
        //
        //     console.log($scope.filteredMarkersProperty);
        // });

        $http.get('/childsafe/map/init').success(function (data) {

            data.sort(function(a, b){

                //compare two values
                if(a.park_name.toLowerCase() < b.park_name.toLowerCase()) return -1;
                if(a.park_name.toLowerCase() > b.park_name.toLowerCase()) return 1;
                return 0;

            });

            $scope.places = data;
            $scope.markersProperty = data;
            $scope.filteredMarkersProperty = $scope.markersProperty;

        });


    };



    angular.extend($scope, {
         //openInfoWindowIndex : 0,


        centerProperty: {
            lat: -37.8136,
            lng: 144.9631
        },

        /** the initial zoom level of the map */
        zoomProperty: 11,

        /** list of markers to put in the map */

        markersProperty : [],
        // toilets:[],

        // These 2 properties will be set when clicking on the map - click event
        clickedLatitudeProperty: null,
        clickedLongitudeProperty: null

    });


}
