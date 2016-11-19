<%--
  Created by IntelliJ IDEA.
  User: ZhangHuan
  Date: 23/09/2016
  Time: 12:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/WEB-INF/views/template/header.jsp" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link href="<c:url value="/resources/css/map.css" />" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/resources/timer/js/mapAutoComplete.js" />"></script>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyB8zo3N7n6jDM9Mf8Rq_TvEmif_-wt62lk"
        type="text/javascript"></script>
<%--<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>--%>
<%--<script type="text/javascript">--%>
    <%--google.maps.event.addDomListener(window, 'load', function () {--%>
        <%--var places = new google.maps.places.Autocomplete(document.getElementById('txtPlaces'));--%>
        <%--google.maps.event.addListener(places, 'place_changed', function () {--%>
            <%--var place = places.getPlace();--%>
            <%--var address = place.formatted_address;--%>
            <%--var latitude = place.geometry.location.A;--%>
            <%--var longitude = place.geometry.location.F;--%>
            <%--var mesg = "Address: " + address;--%>
            <%--mesg += "\nLatitude: " + latitude;--%>
            <%--mesg += "\nLongitude: " + longitude;--%>
            <%--alert(mesg);--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>

<%--<link href="<c:url value="/resources/css/bootstrap-select.min.css" />" rel="stylesheet">--%>

<%--<script src="<c:url value="/resources/js/bootstrap-select.min.js" />"></script>--%>

==================================================
Global Page Section Start
================================================== -->
<section class="global-page-header" style="padding-top: 70px">

        <div class="row">

                <div class="block">
                    <h2>Search Playgrounds near you </h2>
                </div>

        </div>

</section>


<section class="company-description">
    <div class="container" ng-app="angular-google-map">
        <div class="row">
            <div ng-controller="Controller" ng-init="initPage()">


                    <div class="col-sm-1 col-md-6 col-lg-12">


                        <%--<input type="search" align="center" id="mapsearch"--%>
                        <%--ng-model="suburb"--%>
                        <%--placeholder="Enter Suburb Name">--%>

                        <input type="text" id="txtPlaces" style="width: 250px" placeholder="Enter a location"/>

                        <label>
                            <input type="radio" value="5000" ng-model="radius.value" checked>
                            5km
                        </label>

                        <label>
                            <input type="radio" value="8000" ng-model="radius.value">
                            8km
                        </label>


                        <label>
                            <input type="radio" value="15000" ng-model="radius.value">
                            15km
                        </label>
                        <label>
                            <input type="radio" value="20000" ng-model="radius.value">
                            20km
                        </label>
                        <button type="submit" class="btn btn-primary" ng-click="searchForPark()">Search for
                            playgrounds
                        </button>
                            <button id="showHide" class="btn btn-primary" ng-click="showAll()">Show all playgrounds</button>

                    </div>

                    <div class="col-sm-1 col-md-6 col-lg-12">

                        <label class="btn btn-info">Toilet
                            <input type="checkbox" ng-model="checkboxModel.value1" ng-true-value="Y"
                                   ng-false-value="N" class="badgebox" ng-change="checkBoxChange()"><span
                                    class="badge">&check;</span>

                        </label>
                        <label class="btn btn-info">Car parking
                            <input type="checkbox" ng-model="checkboxModel.value2" ng-true-value="Y"
                                   ng-false-value="N" class="badgebox" ng-change="checkBoxChange()"><span
                                    class="badge">&check;</span>
                        </label>
                        <label class="btn btn-info">Suitable for Toddlers
                            <input type="checkbox" ng-model="checkboxModel.value3" ng-true-value="Y"
                                   ng-false-value="N" class="badgebox" ng-change="checkBoxChange()"><span
                                    class="badge">&check;</span>
                        </label>
                        <label class="btn btn-info">Fenced
                            <input type="checkbox" ng-model="checkboxModel.value4" ng-true-value="Y"
                                   ng-false-value="N" class="badgebox" ng-change="checkBoxChange()"><span
                                    class="badge">&check;</span>
                        </label>
                        <label class="btn btn-info">Bike path
                            <input type="checkbox" ng-model="checkboxModel.value5" ng-true-value="Y"
                                   ng-false-value="N" class="badgebox" ng-change="checkBoxChange()"><span
                                    class="badge">&check;</span>
                        </label>

                    </div>


                    <%--<div class="col-sm-1 col-md-6 col-lg-12">--%>
                    <%--<label class="btn btn-info">Toilet--%>
                    <%--<input type="checkbox" ng-model="checkboxModel.value1" ng-true-value="Y"--%>
                    <%--ng-false-value="N" class="badgebox"><span class="badge">&check;</span>--%>

                    <%--</label>--%>
                    <%--<label class="btn btn-info">Car parking--%>
                    <%--<input type="checkbox" ng-model="checkboxModel.value2" ng-true-value="Y"--%>
                    <%--ng-false-value="N" class="badgebox"><span class="badge">&check;</span>--%>
                    <%--</label >--%>
                    <%--<label class="btn btn-info">Suitable for Toddlers--%>
                    <%--<input type="checkbox" ng-model="checkboxModel.value3" ng-true-value="Y"--%>
                    <%--ng-false-value="N" class="badgebox"><span class="badge">&check;</span>--%>
                    <%--</label>--%>
                    <%--<label class="btn btn-info">Fenced--%>
                    <%--<input type="checkbox" ng-model="checkboxModel.value4" ng-true-value="Y"--%>
                    <%--ng-false-value="N" class="badgebox"><span class="badge">&check;</span>--%>
                    <%--</label>--%>
                    <%--<label class="btn btn-info">Bike path--%>
                    <%--<input type="checkbox" ng-model="checkboxModel.value5" ng-true-value="Y"--%>
                    <%--ng-false-value="N" class="badgebox"><span class="badge">&check;</span>--%>
                    <%--</label>--%>

                    <%--&lt;%&ndash;<select  ng-model="singleSelect" class="selectpicker show-tick">&ndash;%&gt;--%>

                    <%--&lt;%&ndash;<option value="1000">1 Km</option>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<option value="3000">3 Km</option>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<option value="5000">5 Km</option>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<option value="10000">10 Km</option>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;&lt;%&ndash;<option ng-repeat="drop in radiusDrop" value="{{drop.value}}">{{drop.name}}</option>&ndash;%&gt;&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</select>&ndash;%&gt;--%>

                    <%--<div class="form-group">--%>
                    <%--<div class="col-sm-1 col-md-6 col-lg-6">--%>
                    <%--<div class="ui-widget">--%>
                    <%--<input type="search" align="center" class="form-control" id="mapsearch"--%>
                    <%--ng-model="suburb"--%>
                    <%--placeholder="Enter Suburb Name">--%>
                    <%--</div>--%>


                    <%--</div>--%>

                    <%--</div>--%>


                    <%--<button type="submit" class="btn btn-primary" ng-click="searchForPark()">Search for playgrounds</button>--%>
                    <%--</div>--%>


                    <%--<div class="col-sm-1 col-md-6 col-lg-12" style="padding-top: 20px">--%>

                        <%--<select ng-model="orderProp" ng-change="updateSuburb()" class="selectpicker show-tick">--%>
                            <%--<option ng-repeat="cats in categories" value="{{cats}}">{{cats}}</option>--%>
                        <%--</select>--%>


                        <%--<label class="btn btn-info">Show public Toilet near me--%>
                        <%--<input type="checkbox" ng-model="showToilets.value1" ng-true-value="Y" ng-false-value="N"--%>
                        <%--ng-change="showToilets()" class="badgebox"><span class="badge">&check;</span>--%>
                        <%--</label>--%>
                        <%--<input type="checkbox" ng-model="showToilets.value1" ng-true-value="Y" ng-false-value="N"--%>
                        <%--ng-change="showToilets()"> Show public Toilet near me--%>

                        <%--<button id="showHide" class="btn btn-primary" ng-click="showAll()">Show all playgrounds</button>--%>

                    <%--</div>--%>


                    <div class="col-md-12" style="padding-top: 30px">
                        <div style=" width:30%; float: left; max-height: 500px; overflow-y : auto;" >

                            <%--<ul>--%>
                                <%--<li ng-repeat="parks in filteredMarkersProperty">{{parks.Park_Name}}</li>--%>
                            <%--</ul>--%>
                            <ul>
                                <li ng-repeat="parks in filteredMarkersProperty " ng-click="openMarker($index)" ng-class="{'selected':$index == selectedRow}" ><i class="fa fa-map-marker" aria-hidden="true"></i> {{parks.park_name}}</li>
                            </ul>
                        </div>
                        <div style="width:70%; float: right">
                            <div class="google-map"
                                 center="centerProperty"
                                 zoom="zoomProperty"
                                 markers="filteredMarkersProperty"
                                 latitude="clickedLatitudeProperty"
                                 longitude="clickedLongitudeProperty"
                                 mark-click="false"
                                 draggable="true"
                                 index="openInfoWindowIndex"
                                 style="height: 500px; width: 100%;">
                            </div>
                        </div>
                    </div>


                </div>
            </div>

        </div>
</section>



<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--%>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.5/angular.js"></script>

<script src="<c:url value="/resources/map/map.js" />"></script>
<script src="<c:url value="/resources/map/google-maps.js" />"></script>
<script src="<c:url value="/resources/timer/js/jquery.ui.autocomplete.scroll.js" />"></script>


<%@include file="/WEB-INF/views/template/footer.jsp" %>
