/**
 * Created by ZhangHuan on 26/08/2016.
 */


(function () {

    "use strict";

    function floatEqual (f1, f2) {
        return (Math.abs(f1 - f2) < 0.000001);
    }

    /*
     * Create the model in a self-contained class where map-specific logic is
     * done. This model will be used in the directive.
     */

    var MapModel = (function () {

        var _defaults = {
            zoom: 12,
            draggable: false,
            container: null
        };


        function PrivateMapModel(opts) {

            var _instance = null,
                _markers = [],  // caches the instances of google.maps.Marker
                _handlers = [], // event handlers
                _windows = [],  // InfoWindow objects
                o = angular.extend({}, _defaults, opts),
                that = this,
                currentInfoWindow = null;

            this.center = opts.center;
            this.zoom = o.zoom;
            this.draggable = o.draggable;
            this.dragging = false;
            this.selector = o.container;
            this.markers = [];
            this.options = o.options;




            this.draw = function () {

                if (that.center == null) {
                    // TODO log error
                    return;
                }

                if (_instance == null) {

                    // Create a new map instance

                    _instance = new google.maps.Map(that.selector, angular.extend(that.options, {
                        center: that.center,
                        current:that.center,
                        zoom: that.zoom,
                        draggable: that.draggable,
                        mapTypeId : google.maps.MapTypeId.ROADMAP
                    }));

                    //this.addMarker(_instance.current.lat(), _instance.current.lng(), 'http://maps.google.com/mapfiles/kml/pal2/icon55.png', 'This is your current location');
                   // console.log(_instance.center.lat()+'  '+ _instance.center.lng());

                    google.maps.event.addListener(_instance, "dragstart",

                        function () {
                            that.dragging = true;
                        }
                    );

                    google.maps.event.addListener(_instance, "idle",

                        function () {
                            that.dragging = false;
                        }
                    );

                    google.maps.event.addListener(_instance, "drag",

                        function () {
                            that.dragging = true;
                        }
                    );

                    google.maps.event.addListener(_instance, "zoom_changed",

                        function () {
                            that.zoom = _instance.getZoom();
                            that.center = _instance.getCenter();
                        }
                    );

                    google.maps.event.addListener(_instance, "center_changed",

                        function () {
                            that.center = _instance.getCenter();
                        }
                    );

                    // Attach additional event listeners if needed
                    if (_handlers.length) {

                        angular.forEach(_handlers, function (h, i) {

                            google.maps.event.addListener(_instance,
                                h.on, h.handler);
                        });
                    }
                }
                else {

                    // Refresh the existing instance
                    google.maps.event.trigger(_instance, "resize");

                    var instanceCenter = _instance.getCenter();

                    if (!floatEqual(instanceCenter.lat(), that.center.lat())
                        || !floatEqual(instanceCenter.lng(), that.center.lng())) {
                        _instance.setCenter(that.center);
                    }

                    if (_instance.getZoom() != that.zoom) {
                        _instance.setZoom(that.zoom);
                    }

                    //this.addMarker(_instance.current.lat(), _instance.current.lng(), 'http://maps.google.com/mapfiles/kml/pal2/icon55.png', 'This is your current location');
                }
            };

            this.fit = function () {
                if (_instance && _markers.length) {

                    var bounds = new google.maps.LatLngBounds();

                    angular.forEach(_markers, function (m, i) {
                        bounds.extend(m.getPosition());
                    });

                    _instance.fitBounds(bounds);
                }
            };

            this.on = function(event, handler) {
                _handlers.push({
                    "on": event,
                    "handler": handler
                });
            };

            this.addMarker = function (lat, lng, icon,park_name,Suburb,Street,facilitaties,Car_Parking,Toddlers,Sun_shade,BBQ,Toilets,Bikepath,Fenced) {

                if (that.findMarker(lat, lng) != null) {
                    return;
                }
                var contentString = '';
                if(park_name != null){
                    contentString = contentString + '<p>Name :' + park_name+'</p>'
                }
                if(Suburb != null){
                    contentString = contentString + '<p>Suburb :' + Suburb+'</p>'
                }

                if(Street != null){
                    contentString = contentString + '<p>Street :' + Street+'</p>'
                }

                if(facilitaties != null){
                    contentString = contentString + '<p>Recreation_facilitaties :' + facilitaties+'</p>'
                }

                if(Car_Parking != null){
                    contentString = contentString + '<p>Car_Parking :' + Car_Parking+'</p>'
                }

                if(Toddlers != null){
                    contentString = contentString + '<p>Toddlers :' + Toddlers+'</p>'
                }

                if(Sun_shade != null){
                    contentString = contentString + '<p>Sun_shade :' + Sun_shade+'</p>'
                }

                if(BBQ != null){
                    contentString = contentString + '<p>BBQ :' + BBQ+'</p>'
                }
                if(Toilets != null){
                    contentString = contentString + '<p>Toilets :' + Toilets+'</p>'
                }

                if(Bikepath != null){
                    contentString = contentString + '<p>Bikepath :' + Bikepath+'</p>'
                }

                if(Fenced != null){
                    contentString = contentString + '<p>Fenced :' + Fenced+'</p>'
                }


                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(lat, lng),
                    map: _instance,
                    icon: icon

                });

                if (park_name != null) {
                    var infoWindow = new google.maps.InfoWindow({
                        content: contentString
                    });

                    google.maps.event.addListener(marker, 'click', function() {
                        if (currentInfoWindow != null) {
                            currentInfoWindow.close();
                        }
                        infoWindow.open(_instance, marker);
                        currentInfoWindow = infoWindow;
                    });
                }

                // Cache marker
                _markers.unshift(marker);

                // Cache instance of our marker for scope purposes
                that.markers.unshift({
                    "lat": lat,
                    "lng": lng,
                    "draggable": false,
                    "icon": icon,
                    "infoWindowContent": contentString
                    // "label": label,
                    // "url": url,
                    // "thumbnail": thumbnail
                });

                // Return marker instance
                return marker;
            };


            this.triggerOpenInfoWindow= function(index) {
                var length = _markers.length;
                google.maps.event.trigger(_markers.sort()[length-index-1], 'click');
            };

            this.findMarker = function (lat, lng) {
                for (var i = 0; i < _markers.length; i++) {
                    var pos = _markers[i].getPosition();

                    if (floatEqual(pos.lat(), lat) && floatEqual(pos.lng(), lng)) {
                        return _markers[i];
                    }
                }

                return null;
            };

            this.findMarkerIndex = function (lat, lng) {
                for (var i = 0; i < _markers.length; i++) {
                    var pos = _markers[i].getPosition();

                    if (floatEqual(pos.lat(), lat) && floatEqual(pos.lng(), lng)) {
                        return i;
                    }
                }

                return -1;
            };

            this.addInfoWindow = function (lat, lng, html) {
                var win = new google.maps.InfoWindow({
                    content: html,
                    position: new google.maps.LatLng(lat, lng)
                });

                _windows.push(win);

                return win;
            };

            this.hasMarker = function (lat, lng) {
                return that.findMarker(lat, lng) !== null;
            };

            this.getMarkerInstances = function () {
                return _markers;
            };

            this.removeMarkers = function (markerInstances) {

                var s = this;

                angular.forEach(markerInstances, function (v, i) {
                    var pos = v.getPosition(),
                        lat = pos.lat(),
                        lng = pos.lng(),
                        index = s.findMarkerIndex(lat, lng);

                    // Remove from local arrays
                    _markers.splice(index, 1);
                    s.markers.splice(index, 1);

                    // Remove from map
                    v.setMap(null);
                });
            };
        }

        // Done
        return PrivateMapModel;
    }());

    // End model

    // Start Angular directive

    var googleMapsModule = angular.module("google-maps", []);

    /**
     * Map directive
     */
    googleMapsModule.directive("googleMap", ["$log", "$timeout", "$filter", function ($log, $timeout) {


        var controller = function ($scope, $element) {


            var _m = $scope.map;

            self.addInfoWindow = function (lat, lng, content) {
                _m.addInfoWindow(lat, lng, content);
            };



        };

        controller.$inject = ['$scope', '$element'];

        return {
            restrict: "EC",
            priority: 100,
            transclude: true,
            template: "<div class='angular-google-map' ng-transclude></div>",
            replace: false,
            scope: {
                center: "=center", // required
                markers: "=markers", // optional
                latitude: "=latitude", // required
                longitude: "=longitude", // required
                zoom: "=zoom", // required
                refresh: "&refresh", // optional
                windows: "=windows", // optional"
                index : "=index"

            },
            controller: controller,
            link: function (scope, element, attrs) {


                if (!angular.isDefined(scope.center) ||
                    (!angular.isDefined(scope.center.lat) ||
                    !angular.isDefined(scope.center.lng))) {

                    $log.error("angular-google-maps: ould not find a valid center property");
                    return;
                }

                if (!angular.isDefined(scope.zoom)) {
                    $log.error("angular-google-maps: map zoom property not set");
                    return;
                }



                angular.element(element).addClass("angular-google-map");

                // Parse options
                var opts = {options: {}};
                if (attrs.options) {
                    opts.options = angular.fromJson(attrs.options);
                }

                // Create our model
                var _m = new MapModel(angular.extend(opts, {
                    container: element[0],
                    center: new google.maps.LatLng(scope.center.lat, scope.center.lng),
                    draggable: attrs.draggable == "true",
                    zoom: scope.zoom
                }));



                _m.on("drag", function () {

                    var c = _m.center;

                    $timeout(function () {

                        scope.$apply(function (s) {
                            scope.center.lat = c.lat();
                            scope.center.lng = c.lng();
                        });
                    });
                });

                _m.on("zoom_changed", function () {

                    if (scope.zoom != _m.zoom) {

                        $timeout(function () {

                            scope.$apply(function (s) {
                                scope.zoom = _m.zoom;
                            });
                        });
                    }
                });

                _m.on("center_changed", function () {
                    var c = _m.center;

                    $timeout(function () {

                        scope.$apply(function (s) {

                            if (!_m.dragging) {
                                scope.center.lat = c.lat();
                                scope.center.lng = c.lng();
                            }
                        });
                    });
                });

                // _m.on("openInfoWindowIndex", function (newValue) {
                //
                //     _m.triggerOpenInfoWindow(newValue);
                //     //  alert(newValue);
                //
                //
                //
                //     // google.maps.event.trigger(markers[newValue], 'click');
                //
                // });
                if (attrs.markClick == "true") {
                    (function () {
                        var cm = null;

                        _m.on("click", function (e) {
                            if (cm == null) {

                                cm = {
                                    latitude: e.latLng.lat(),
                                    longitude: e.latLng.lng()
                                };

                                scope.markers.push(cm);
                            }
                            else {
                                cm.latitude = e.latLng.lat();
                                cm.longitude = e.latLng.lng();
                            }


                            $timeout(function () {
                                scope.latitude = cm.latitude;
                                scope.longitude = cm.longitude;
                                scope.$apply();
                            });
                        });
                    }());
                }

                // Put the map into the scope
                scope.map = _m;


                // Check if we need to refresh the map
                if (angular.isUndefined(scope.refresh())) {
                    // No refresh property given; draw the map immediately
                    _m.draw();
                }
                else {
                    scope.$watch("refresh()", function (newValue, oldValue) {
                        if (newValue && !oldValue) {
                            _m.draw();
                        }
                    });
                }

                scope.$watch("index" , function(newValue, oldValue) {
                    if (newValue === oldValue) {
                        return;
                    }
                     _m.triggerOpenInfoWindow(newValue);
                    console.log(newValue);
                });


                // Markers
                scope.$watch("markers", function (newValue, oldValue) {


                    $timeout(function () {

                        newValue.sort(function(a, b){

                            //compare two values
                            if(a.park_name.toLowerCase() < b.park_name.toLowerCase()) return -1;
                            if(a.park_name.toLowerCase() > b.park_name.toLowerCase()) return 1;
                            return 0;

                        });

                        angular.forEach(newValue, function (v, i) {
                            if (!_m.hasMarker(v.latitude, v.longitude)) {

                                    _m.addMarker(v.latitude, v.longitude, './resources/images/icon4.png', v.park_name,v.suburb,v.street,v.facility,v.car_parking,v.toddler,v.sun_shade,v.bbq,v.toilet,v.bikepath,v.fenced);

                            }
                        });

                        // http://maps.google.com/mapfiles/kml/pal2/icon4.png

                       // Clear orphaned markers
                        var orphaned = [];

                        angular.forEach(_m.getMarkerInstances(), function (v, i) {
                            // Check our scope if a marker with equal latitude and longitude.
                            // If not found, then that marker has been removed form the scope.

                            var pos = v.getPosition(),
                                lat = pos.lat(),
                                lng = pos.lng(),
                                found = false;

                            // Test against each marker in the scope
                            for (var si = 0; si < scope.markers.length; si++) {

                                var sm = scope.markers[si];

                                if (floatEqual(sm.latitude, lat) && floatEqual(sm.longitude, lng)) {
                                    // Map marker is present in scope too, don't remove
                                    found = true;
                                }
                            }

                            // Marker in map has not been found in scope. Remove.
                            if (!found) {
                                orphaned.push(v);
                            }
                        });

                        orphaned.length && _m.removeMarkers(orphaned);

                        // Fit map when there are more than one marker.
                        // This will change the map center coordinates
                        if (attrs.fit == "true" && newValue.length > 1) {
                            _m.fit();
                        }
                    });

                }, true);


                // Update map when center coordinates change
                scope.$watch("center", function (newValue, oldValue) {
                    if (newValue === oldValue) {
                        return;
                    }

                    if (!_m.dragging) {
                          _m.center = new google.maps.LatLng(newValue.lat,newValue.lng);
                        _m.draw();

                    }
                }, true);

                scope.$watch("zoom", function (newValue, oldValue) {
                    if (newValue === oldValue) {
                        return;
                    }

                    _m.zoom = newValue;
                    _m.draw();
                });


            }
        };
    }]);
}());