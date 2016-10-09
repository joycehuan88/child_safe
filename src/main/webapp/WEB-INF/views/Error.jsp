<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-GB">
<%@ page language="java" isErrorPage="true" %>
<head>
    <meta charset="UTF-8">
    <title>404</title>
</head>
<body>
<center>

    <br/><br/><br/>
    <%--<img src="4.png" width=7.5% height=auto alt="4"/>--%>
    <%--<img src="0.png" width=7.5% height=auto alt="0"/>--%>
    <%--<img src="4.png" width=7.5% height=auto alt="4"/> <br/><br/><br/>--%>
    <img src="<c:url value="/resources/images/awkward.png" />" width=50% height=auto alt=“This page has been moved, deleted or never existed."/>
    <h3>Sorry, the page you were looking for was not found</h3>
     Click<a href="/childsafe">Here</a> to go back
</center>
</body>
</html>