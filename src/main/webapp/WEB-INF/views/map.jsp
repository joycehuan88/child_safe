<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="<c:url value="/resources/css/map.css" />" rel="stylesheet">

<html ng-app="angular-google-maps-example">

<head>
    <meta charset="UTF-8">
    <title>angular-google-maps example page</title>
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
<body ng-controller="ExampleController">
<div class="places" >
    <%--<p>location:{{lat}},{{lng}}</p>--%>
    <select id="dropdown" ng-model="orderProp" >
        <option ng-repeat="cats in categories" value="{{cats}}">{{cats}}</option>
    </select>
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


<%--<script src="http://maps.googleapis.com/maps/api/js?sensor=false&language=en"></script>--%>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8zo3N7n6jDM9Mf8Rq_TvEmif_-wt62lk"
        type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.5/angular.js"></script>
<%--<script src="lib/google-maps.js"></script>--%>
<%--<script src="js/map.js"></script>--%>
<script src="<c:url value="/resources/map/map.js" />"></script>
<script src="<c:url value="/resources/map/google-maps.js" />"></script>



<script>

</script>


</body>
</html>