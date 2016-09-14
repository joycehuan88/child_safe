<%@include file="/WEB-INF/views/template/header.jsp" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link href="<c:url value="/resources/css/map.css" />" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>

<link href="<c:url value="/resources/css/bootstrap-select.min.css" />" rel="stylesheet">

<script src="<c:url value="/resources/js/bootstrap-select.min.js" />"></script>

==================================================
Global Page Section Start
================================================== -->
<section class="global-page-header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block">
                    <h2>Search Playgrounds near you </h2>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="company-description">
    <div class="container" ng-app="angular-google-map">
        <div class="row">
            <div ng-controller="Controller" ng-init="initPage()">
                <div class="col-md-12">

                        <div class="col-sm-1 col-md-6 col-lg-12">
                            <label class="btn btn-info">Toilet
                                <input type="checkbox" ng-model="checkboxModel.value1" ng-true-value="Y"
                                       ng-false-value="N" class="badgebox"><span class="badge">&check;</span>

                            </label>
                            <label class="btn btn-info">Car parking
                                <input type="checkbox" ng-model="checkboxModel.value2" ng-true-value="Y"
                                       ng-false-value="N" class="badgebox"><span class="badge">&check;</span>
                            </label >
                            <label class="btn btn-info">Suitable for Toddlers
                                <input type="checkbox" ng-model="checkboxModel.value3" ng-true-value="Y"
                                       ng-false-value="N" class="badgebox"><span class="badge">&check;</span>
                            </label>
                            <label class="btn btn-info">Fenced
                                <input type="checkbox" ng-model="checkboxModel.value4" ng-true-value="Y"
                                       ng-false-value="N" class="badgebox"><span class="badge">&check;</span>
                            </label>
                            <label class="btn btn-info">Bike path
                                <input type="checkbox" ng-model="checkboxModel.value5" ng-true-value="Y"
                                       ng-false-value="N" class="badgebox"><span class="badge">&check;</span>
                            </label>

                            <select  ng-model="singleSelect" class="selectpicker show-tick">

                                <option value="1000">1 Km</option>
                                <option value="3000">3 Km</option>
                                <option value="5000">5 Km</option>
                                <option value="10000">10 Km</option>
                                    <%--<option ng-repeat="drop in radiusDrop" value="{{drop.value}}">{{drop.name}}</option>--%>
                            </select>

                            <button type="submit" class="btn btn-primary" ng-click="searchForPark()">Search for playgrounds</button>
                        </div>




                    <div class="col-sm-1 col-md-6 col-lg-12" style="padding-top: 20px">

                            <select ng-model="orderProp" ng-change="updateSuburb()"  class="selectpicker show-tick">
                                <option ng-repeat="cats in categories" value="{{cats}}">{{cats}}</option>
                            </select>


                        <label class="btn btn-info">Show public Toilet near me
                            <input type="checkbox" ng-model="showToilets.value1" ng-true-value="Y" ng-false-value="N"
                                   ng-change="showToilets()" class="badgebox"><span class="badge">&check;</span>
                        </label>
                        <%--<input type="checkbox" ng-model="showToilets.value1" ng-true-value="Y" ng-false-value="N"--%>
                               <%--ng-change="showToilets()"> Show public Toilet near me--%>

                        <button id="showHide"class="btn btn-primary" ng-click="showAll($event)">Show all playgrounds</button>

                    </div>




                </div>
                <div class="col-md-12" style="padding-top: 30px">
                    <div class="google-map"
                         center="centerProperty"
                         zoom="zoomProperty"
                         markers="filteredMarkersProperty"
                         latitude="clickedLatitudeProperty"
                         longitude="clickedLongitudeProperty"
                         mark-click="false"
                         draggable="true"
                         style="height: 500px; width: 100%;">
                    </div>
                </div>

            </div>
        </div>

    </div>
</section>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8zo3N7n6jDM9Mf8Rq_TvEmif_-wt62lk"
        type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.5/angular.js"></script>

<script src="<c:url value="/resources/map/map.js" />"></script>
<script src="<c:url value="/resources/map/google-maps.js" />"></script>

<%@include file="/WEB-INF/views/template/footer.jsp" %>
