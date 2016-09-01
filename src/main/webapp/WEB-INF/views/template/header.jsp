<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhangHuan
  Date: 18/08/2016
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="icon" type="image/png" href="images/favicon.png">
    <title>ChildSafe</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <!-- Mobile Specific Metas
    ================================================== -->
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Template CSS Files
    ================================================== -->
    <!-- Twitter Bootstrs CSS -->
    <%--<link rel="stylesheet" href="css/bootstrap.min.css">--%>
    <link href="<c:url value="/resources/timer/css/bootstrap.min.css" />" rel="stylesheet">
    <!-- Ionicons Fonts Css -->
    <link href="<c:url value="/resources/timer/css/ionicons.min.css" />" rel="stylesheet">
    <%--<link rel="stylesheet" href="css/ionicons.min.css">--%>
    <!-- animate css -->
    <%--<link rel="stylesheet" href="css/animate.css">--%>
    <link href="<c:url value="/resources/timer/css/animate.css" />" rel="stylesheet">
    <!-- Hero area slider css-->
    <%--<link rel="stylesheet" href="css/slider.css">--%>
    <link href="<c:url value="/resources/timer/css/slider.css" />" rel="stylesheet">
    <!-- owl craousel css -->
    <%--<link rel="stylesheet" href="css/owl.carousel.css">--%>
    <link href="<c:url value="/resources/timer/css/owl.carousel.css" />" rel="stylesheet">
    <%--<link rel="stylesheet" href="css/owl.theme.css">--%>
    <link href="<c:url value="/resources/timer/css/owl.theme.css" />" rel="stylesheet">
    <%--<link rel="stylesheet" href="css/jquery.fancybox.css">--%>
    <link href="<c:url value="/resources/timer/css/jquery.fancybox.css" />" rel="stylesheet">
    <!-- template main css file -->
    <%--<link rel="stylesheet" href="css/main.css">--%>
    <link href="<c:url value="/resources/timer/css/main.css" />" rel="stylesheet">
    <!-- responsive css -->
    <%--<link rel="stylesheet" href="css/responsive.css">--%>

    <link href="<c:url value="/resources/timer/css/glyphicons.css" />" rel="stylesheet">

    <link href="<c:url value="/resources/css/jquery-ui.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/jquery-ui.theme.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">


    <!-- Template Javascript Files
    ================================================== -->
    <!-- modernizr js -->
    <%--<script src="js/vendor/modernizr-2.6.2.min.js"></script>--%>
    <script src="<c:url value="/resources/timer/js/vendor/modernizr-2.6.2.min.js" />"></script>
    <!-- jquery -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <!-- owl carouserl js -->
    <%--<script src="js/owl.carousel.min.js"></script>--%>
    <script src="<c:url value="/resources/timer/js/owl.carousel.min.js" />"></script>
    <!-- bootstrap js -->

    <%--<script src="js/bootstrap.min.js"></script>--%>
    <script src="<c:url value="/resources/timer/js/bootstrap.min.js" />"></script>
    <!-- wow js -->
    <%--<script src="js/wow.min.js"></script>--%>
    <script src="<c:url value="/resources/timer/js/wow.min.js" />"></script>
    <!-- slider js -->
    <%--<script src="js/slider.js"></script>--%>
    <script src="<c:url value="/resources/timer/js/slider.js" />"></script>
    <%--<script src="js/jquery.fancybox.js"></script>--%>
    <script src="<c:url value="/resources/timer/js/jquery.fancybox.js" />"></script>
    <!-- template main js -->
    <%--<script src="js/main.js"></script>--%>
    <script src="<c:url value="/resources/timer/js/main.js" />"></script>
    <%--listjs--%>
    <script src="<c:url value="/resources/js/list.js" />"></script>
    <%--<script src="http://listjs.com/no-cdn/list.js"></script>--%>
    <!-- Angular JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js" > </script>
    <%--jQueryjs--%>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

    <script src="<c:url value="/resources/js/controller.js" />"></script>

</head>
<body>
<!--
==================================================
Header Section Start
================================================== -->
<header id="top-bar" class="navbar-fixed-top animated-header" style="padding:10px 0;">
    <div class="container">
        <div class="navbar-header" >
            <!-- responsive nav button -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- /responsive nav button -->

            <!-- logo -->
            <div class="navbar-brand">
                <a href="<c:url value="/"/>" >
                    <img src="<c:url value="/resources/images/newFont.png" />" alt="" style="height: 100%;">
                </a>
            </div>
            <!-- /logo -->
        </div>
        <!-- main menu -->
        <nav class="collapse navbar-collapse navbar-right" role="navigation">
            <div class="main-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="<c:url value="/"/>" >Home</a>
                    </li>
                    <li><a href="<c:url value="/analysis"  />">My Environment</a></li>
                    <li><a href="<c:url value="/map"  />">My Map</a></li>
                </ul>
            </div>
        </nav>
        <!-- /main nav -->
    </div>
</header>