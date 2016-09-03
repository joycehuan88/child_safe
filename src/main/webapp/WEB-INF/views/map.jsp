<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="<c:url value="/resources/css/map.css" />" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>

<%--<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/angular_material/1.1.0/angular-material.min.css">--%>


<html ng-app="angular-google-map">

<head>
    <meta charset="UTF-8">
    <title>My parks</title>
    <%--<link rel="stylesheet" href="css/app.css">--%>
    <%--<link rel="stylesheet" href="css/bootstrap.css">--%>

    <style>
        .name{
            color:rgb(106,182,200);
            font-weight:bold;
            cursor:pointer;
        }

        .places{float:left;}

        .places li{
            list-style:none;
        }

        #showHide{display:block; margin:2em 0;}
    </style>
</head>
<body ng-controller="Controller" ng-init ="initPage()">

<div class="places" >
    <%--<p>location:{{lat}},{{lng}}</p>--%>
        <select id="dropdown" ng-model="orderProp">
            <option ng-repeat="cats in categories" value="{{cats}}">{{cats}}</option>
        </select>
        <div class="form-group">
            <div class="checkbox">
                <label>
                    <input type="checkbox" ng-model="checkboxModel.value1" ng-true-value="Y" ng-false-value="N"> Toilet
                </label>
                <label>
                    <input type="checkbox" ng-model="checkboxModel.value2"ng-true-value="Y" ng-false-value="N"> Car parking
                </label>
                <label>
                    <input type="checkbox" ng-model="checkboxModel.value3"ng-true-value="Y" ng-false-value="N"> Suitable for Toddlers
                </label>
                <label>
                    <input type="checkbox" ng-model="checkboxModel.value4"ng-true-value="Y" ng-false-value="N"> Fenced
                </label>
                <label>
                    <input type="checkbox" ng-model="checkboxModel.value5"ng-true-value="Y" ng-false-value="N"> Bikepath
                </label>

                <select  name="singleSelect" id="singleSelect" ng-model="data.singleSelect">

                    <option value="">---Please select---</option>
                    <option value="1000">1Km</option>
                    <option value="3000">3Km</option>
                    <option value="5000">5Km</option>
                    <option value="10000">10Km</option>
                    <option value="15000">15Km</option>

                </select>
                <button type="submit" class="btn btn-primary" ng-click="search()">Search</button>

            </div>
        </div>



    <button id="showHide" ng-click="showAll($event)" >Show all results</button>

    <%--<ul>--%>
        <%--<li ng-repeat="place in places | filter:orderProp" ng-init="liVisible" ng-hide="liVisible == false">--%>
            <%--<p class="name" ng-click="select(place)">{{place.name}}</p>--%>

        <%--</li>--%>
    <%--</ul>--%>
</div>
<div class="google-map"
     center="centerProperty"
     zoom="zoomProperty"
     markers="filteredMarkersProperty"
     latitude="clickedLatitudeProperty"
     longitude="clickedLongitudeProperty"
     mark-click="false"
     draggable="true"
     style="height: 500px; width: 80%; float:right">
</div>



<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8zo3N7n6jDM9Mf8Rq_TvEmif_-wt62lk"
        type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.5/angular.js"></script>

<script src="<c:url value="/resources/map/map.js" />"></script>
<script src="<c:url value="/resources/map/google-maps.js" />"></script>



</body>
</html>