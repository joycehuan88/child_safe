<%--
  Created by IntelliJ IDEA.
  User: ZhangHuan
  Date: 18/08/2016
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/WEB-INF/views/template/header.jsp" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

==================================================
Global Page Section Start
================================================== -->
<section class="global-page-header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block">
                    <h2>Know your Neighbourhood</h2>
                    <%--<ol class="breadcrumb">--%>
                        <%--<li>--%>
                            <%--<a href="index.html">--%>
                                <%--<i class="ion-ios-home"></i>--%>
                                <%--Home--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li class="active">About</li>--%>
                    <%--</ol>--%>
                </div>
            </div>
        </div>
    </div>
</section>
<!--
==================================================
Company Description Section Start
================================================== -->
<section class="company-description">

    <div class="container" ng-app="suburbApp" id="main">

        <form name="myForm" ng-controller="requestCtrl" ng-init="initPage()">
            <div class="row">


                <div class="col-md-20">
                    <div class="block">
                        <h3 align="center" class="subtitle wow fadeInUp" data-wow-delay=".3s" data-wow-duration="500ms">
                            Please Choose Whats Important to you, you can leave all the options checked </h3>
                        <p class="wow fadeInUp" data-wow-delay=".5s" data-wow-duration="500ms">
                        <div class="row" style="padding-left: 30%">

                            <div class="form-group">
                                <div class="col-sm-1 col-md-6 col-lg-6">
                                    <div class="ui-widget">
                                        <input type="search" align="center" class="form-control" id="search"
                                               ng-model = "suburb"
                                               placeholder="Enter Suburb Name">
                                    </div>


                                </div>
                                <button type="submit" class="btn btn-primary" ng-click="search()">Search</button>
                            </div>
                        </div>


                        <div class="row text-center" style="padding-left: 20%">
                            <div class="col-sm-1 col-md-6 col-lg-9">
                                <label for="bully" class="btn btn-info">Bullying Rate<input
                                        ng-model="checkboxModel.value1" type="checkbox" id="bully"
                                        class="badgebox"><span class="badge">&check;</span></label>
                                <label for="abuse" class="btn btn-info">Abuse Rate<input ng-model="checkboxModel.value2"
                                                                                         type="checkbox" id="abuse"
                                                                                         class="badgebox"><span
                                        class="badge">&check;</span></label>
                                <label for="immu" class="btn btn-info">Immunization Rate<input
                                        ng-model="checkboxModel.value3" type="checkbox" id="immu" class="badgebox"><span
                                        class="badge">&check;</span></label>
                                <label for="crime" class="btn btn-info">Crime Rate<input ng-model="checkboxModel.value4"
                                                                                         type="checkbox" id="crime"
                                                                                         class="badgebox"><span
                                        class="badge">&check;</span></label>
                            </div>
                        </div>
                        <br>
                        <div class="row text-center" style="padding-left: 20%">
                            <div class="col-sm-1 col-md-6 col-lg-9">
                                <label for="drug" class="btn btn-info">Drug Dealing<input
                                        ng-model="checkboxModel.value5" type="checkbox" id="drug" class="badgebox"><span
                                        class="badge">&check;</span></label>
                                <label for="abduction" class="btn btn-info">Abduction Rate<input
                                        ng-model="checkboxModel.value6" type="checkbox" id="abduction" class="badgebox"><span
                                        class="badge">&check;</span></label>
                                <label for="balckmail" class="btn btn-info">Blackmail Extortion<input
                                        ng-model="checkboxModel.value7" type="checkbox" id="balckmail" class="badgebox"><span
                                        class="badge">&check;</span></label>
                                <label for="sexual" class="btn btn-info">Sexual Offense<input
                                        ng-model="checkboxModel.value8" type="checkbox" id="sexual"
                                        class="badgebox"><span class="badge">&check;</span></label>
                            </div>
                        </div>


                    </div>

                </div>

            </div>

            <section class="about-feature clearfix">
                <div class="container" >

                    <div class="row">
                        <div class="block about-feature-1 wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".3s">
                            <h2>
                                Current Statistics Rates in your area
                            </h2>
                            <ui>

                                <li ng-show= "checkboxModel.value1" >Bullying Rate:{{council1.bullying_rate}}</li>
                                <li ng-show= "checkboxModel.value2" >Abuse Rate:{{council1.abuse_rate}}</li>
                                <li ng-show= "checkboxModel.value3" >Immunisation Rate:{{council1.vacc_rate}}</li>
                                <li ng-show= "checkboxModel.value4" >Crime Rate:{{council1.crime_rate}}</li>
                                <li ng-show= "checkboxModel.value5" >Drug Dealing Rate:{{council1.drug_dealing}}</li>
                                <li ng-show= "checkboxModel.value6" >Abduction Rate:{{council1.abduction_rated}}</li>
                                <li ng-show= "checkboxModel.value7" >blackmail_extortion Rate:{{council1.blackmail_extortion}}</li>
                                <li ng-show= "checkboxModel.value8" >Sexual Offense Rate:{{council1.sexual_offense}}</li>


                            </ui>
                        </div>
                        <div class="block about-feature-2 wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".5s">
                            <h2 class="item_title">
                                Average Rates in Melbourne
                            </h2>
                            <ui>

                                <li ng-show= "checkboxModel.value1" >Bullying Rate:{{council2.bullying_rate}}</li>
                                <li ng-show= "checkboxModel.value2" >Abuse Rate:{{council2.abuse_rate}}</li>
                                <li ng-show= "checkboxModel.value3" >Immunisation Rate:{{council2.vacc_rate}}</li>
                                <li ng-show= "checkboxModel.value4" >Crime Rate:{{council2.crime_rate}}</li>
                                <li ng-show= "checkboxModel.value5" >Drug Dealing Rate:{{council2.drug_dealing}}</li>
                                <li ng-show= "checkboxModel.value6" >Abduction Rate:{{council2.abduction_rated}}</li>
                                <li ng-show= "checkboxModel.value7" >blackmail_extortion Rate:{{council2.blackmail_extortion}}</li>
                                <li ng-show= "checkboxModel.value8" >Sexual Offense Rate:{{council2.sexual_offense}}</li>


                            </ui>
                        </div>
                        <div class="block about-feature-3 wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".7s">
                            <h2 class="item_title">
                                Councils with the lowest Rates
                            </h2>
                            <ui>

                            <li ng-show= "checkboxModel.value1" >Lowest Bullying Rate:{{bullycouncil}}</li>
                            <li ng-show= "checkboxModel.value2" >Lowest Abuse Rate:{{abusecouncil}}</li>
                            <li ng-show= "checkboxModel.value3" >Highest Immunisation Rate:{{immucouncil}}</li>
                            <li ng-show= "checkboxModel.value4" >Lowest Crime Rate:{{crimecouncil}}</li>
                            <li ng-show= "checkboxModel.value5" >Lowest Drug Dealing Rate:{{drugcouncil}}</li>
                            <li ng-show= "checkboxModel.value6" >Lowest Abduction Rate:{{abductioncouncil}}</li>
                            <li ng-show= "checkboxModel.value7" >Lowest blackmail_extortion Rate:{{blackmailcouncil}}</li>
                            <li ng-show= "checkboxModel.value8" >Lowest Sexual Offense Rate:{{sexualcouncil}}</li>


                        </ui>
                        </div>
                    </div>
                </div>
            </section>
        </form>
    </div>
</section>


<!--
==================================================
Company Feature Section Start
================================================== -->
<%--<section class="about-feature clearfix">--%>
    <%--<div class="container" >--%>

            <%--<div class="row">--%>
                <%--<div class="block about-feature-1 wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".3s">--%>
                    <%--<h2>--%>
                        <%--Current Statistics Rates in your area--%>
                    <%--</h2>--%>
                    <%--<ui>--%>
                        <%--<li>{{council.vacc_rate.toString()}}</li>--%>
                        <%--<li>{{council.crime_rate}}</li>--%>
                        <%--<li>{{council.bullying_rate}}</li>--%>
                        <%--<li>{{council.abuse_rate}}</li>--%>

                    <%--</ui>--%>
                <%--</div>--%>
                <%--<div class="block about-feature-2 wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".5s">--%>
                    <%--<h2 class="item_title">--%>
                        <%--Average Rates in Your Suburb--%>
                    <%--</h2>--%>
                <%--</div>--%>
                <%--<div class="block about-feature-3 wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".7s">--%>
                    <%--<h2 class="item_title">--%>
                        <%--Councils with the lowest Rates--%>
                    <%--</h2>--%>
                    <%--<p>--%>
                        <%--Bullying Rates : <br>--%>
                        <%--Abuse Rates: <br>--%>
                    <%--</p>--%>
                <%--</div>--%>
            <%--</div>--%>
    <%--</div>--%>
<%--</section>--%>


<section id="clients">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="subtitle text-center wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".3s">What Next</h2>
                <p class="subtitle-des text-center wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".5s">Our Developers are working very hard to bring more useful features for you as a parent.This includes a map with information about public parks and toilets.

                    We'd also love to hear your feed back. Let us know the features you'd love to see,what you think would be useful to you as a parent.</p>

            </div>
        </div>
    </div>
</section>

<script src="<c:url value="/resources/js/controller.js" /> "></script>

<%@include file="/WEB-INF/views/template/footer.jsp" %>
