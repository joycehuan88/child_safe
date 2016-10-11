<%--
  Created by IntelliJ IDEA.
  User: ZhangHuan
  Date: 11/10/2016
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>

<%@include file="/WEB-INF/views/template/header.jsp" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


    <%--<title>SB Admin 2 - Bootstrap Admin Theme</title>--%>

    <!-- Bootstrap Core CSS -->
    <%--<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- MetisMenu CSS -->
    <%--<link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">--%>

    <!-- Custom CSS -->
    <%--<link href="../dist/css/sb-admin-2.css" rel="stylesheet">--%>
<link href="<c:url value="/resources/analysis/sb-admin-2.css" />" rel="stylesheet">
<script src="<c:url value="/resources/timer/js/main.js" />"></script>
<script src="<c:url value="/resources/js/controller.js" /> "></script>

<script type="text/javascript" src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>

    <!-- Morris Charts CSS -->
    <%--<link href="../vendor/morrisjs/morris.css" rel="stylesheet">--%>

    <!-- Custom Fonts -->
      <link href="<c:url value="/resources/analysis/font-awesome.css" />" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->




    <section class="global-page-header">
        <div class="row">

            <div class="block">
                <h2>Know your Neighbourhood</h2>
            </div>

        </div>
    </section>


<div class="container" id="wrapper" ng-app="suburbApp">

    <div id="page-wrapper">

        <form name="myForm" ng-controller="requestCtrl" ng-init="initPage()" id="formController">

            <div class="row" style="margin: 20px auto">


                <%--<h3 align="center" class="subtitle wow fadeInUp" data-wow-delay=".3s" data-wow-duration="500ms">--%>
                <%--Please Choose Whats Important to you, We will get the stats for you </h3>--%>
                <%--<p class="wow fadeInUp" data-wow-delay=".5s" data-wow-duration="500ms">--%>
                <div class="col-md-6 col-md-offset-3">


                    <div class="form-group">

                        <div class="ui-widget">
                            <input type="search" class="form-control" id="search"
                                   ng-model="suburb" ng-keyup="keyPress($event.keyCode)"
                                   placeholder="Enter Suburb Name" size="5">
                            <%--<button type="submit" class="btn btn-primary" ng-click="search()">Search--%>
                            <%--</button>--%>
                        </div>


                    </div>


                </div>

                <%--<div class="col-md-6 col-md-offset-3">--%>
                <%--<form class="form-inline">--%>

                <%--<div class="form-group">--%>

                <%--<input class="form-control" id="search" placeholder="Enter Suburb Name" ng-model="suburb" ng-click="search()">--%>
                <%--</div>--%>

                <%--<button type="submit" class="btn btn-primary" ng-click="search()">Search--%>
                <%--</button>--%>

                <%--</form>--%>
                <%--</div>--%>


                <div class="row text-center">
                    <div class="col-sm-3 col-md-6 col-lg-12">
                        <label for="abduction" class="btn btn-info">Abduction<input
                                ng-model="checkboxModel.value6" type="checkbox" id="abduction"
                                class="badgebox"><span
                                class="badge">&check;</span></label>
                        <label for="immu" class="btn btn-info">Vaccination<input
                                ng-model="checkboxModel.value3" type="checkbox" id="immu" class="badgebox"><span
                                class="badge">&check;</span></label>
                        <label for="crime" class="btn btn-info">Crime<input ng-model="checkboxModel.value4"
                                                                            type="checkbox" id="crime"
                                                                            class="badgebox"><span
                                class="badge">&check;</span></label>
                        <label for="bully" class="btn btn-info">Bullying<input
                                ng-model="checkboxModel.value1" type="checkbox" id="bully"
                                class="badgebox"><span class="badge">&check;</span></label>
                        <label for="abuse" class="btn btn-info">Abuse<input ng-model="checkboxModel.value2"
                                                                            type="checkbox" id="abuse"
                                                                            class="badgebox"><span
                                class="badge">&check;</span></label>

                        <label for="sexual" class="btn btn-info">Sexual Offense<input
                                ng-model="checkboxModel.value8" type="checkbox" id="sexual"
                                class="badgebox"><span class="badge">&check;</span></label>
                    </div>
                </div>


            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12" ng-show="checkboxModel.value6" style="height: 600px">

                    <div class="col-lg-7" style="height: inherit; ">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i>Abduction in
                                    {{suburbname}}</h3>
                                <div class="pull-right">
                                    <div class="btn-group">
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <p>(Number of recorded Abduction and related offense)</p>
                                <p> Abduction Incidents: {{council1.abduction_rated}}</p>
                                <p>Average Across Melbourne:{{council2.abduction_rated}}</p>
                                <p>Council(s) with the lowest Abduction
                                    Rate:{{abductioncouncil}} with average incidents
                                    {{lowestAbductionRate}}</p>
                                <p>**Data from Vic Gov</p>

                                <div id="chart1" style="height: 300px; width: 100%;">

                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-lg-5" style="height: inherit; overflow: hidden;  ">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Tips</h3>
                            </div>
                            <div class="panel-body" style="height: inherit;overflow: auto;">
                                <h3>Tips your child should know</h3>
                                <p>
                                    Never say they are alone if they answer the phone. They can offer to take a
                                    message
                                    or
                                    say their
                                    parents will phone back.</p>
                                <p>Never answer the door if they are alone.</p>
                                <p>Not invite anyone in the house without the permission of a parent or
                                    babysitter.</p>
                                <p>Not go into people's houses without letting anyone know where they are.</p>
                                <p>Never get into anyone's car without permission.</p>
                                <p>Not take candy or other gifts from strangers or anyone else without asking a
                                    parent
                                    first.</p>
                                <p>Never play in deserted buildings or isolated areas.</p>
                                <p>Scream and scatter books and belongings if they are forced towards a building or
                                    car.</p>
                                <p>Move away from a car that pulls up beside them if they do not know the
                                    driver.</p>
                                <p>Be taught that it's all right to say 'no' to an adult if the person wants them to do
                                    something you've taught them is wrong.</p>
                                <p>Know that no one has the right to touch any part of their bodies that a bathing suit
                                    would cover.</p>
                                <p>Tell you, school authorities or a police officer about anyone who exposes private
                                    parts.</p>
                                <a href="http://www.pregnancy.org/article/30-ways-help-prevent-your-child-being-abducted">http://www.pregnancy.org/article/30-ways-help-prevent-your-child-being-abducted
                                </a>
                            </div>
                        </div>

                    </div>
                </div>


            </div>

            <div class="row">
                <div class="col-lg-12" ng-show="checkboxModel.value3" style="height: 600px">

                    <div class="col-lg-7" style="height: inherit; ">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Children Vaccination
                                    Rate in {{suburbname}}</h3>
                                <div class="pull-right">
                                    <div class="btn-group">
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <p> (Percentage of Children being Vaccinised in the area)</p>
                                <p> Immunzation Rate: {{council1.vacc_rate}}%</p>
                                <p>Average Rate Across Melbourne:{{council2.vacc_rate}}%</p>
                                <p>Council(s) with the highest Immunization
                                    Rate:{{immucouncil}} with rate {{highestVaccRate}}% </p>

                                <p>**Data from Vic Gov</p>

                                <div id="chart4" style="height: 300px; width: 100%;">

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5" style="height: inherit;text-overflow: ellipsis; overflow: hidden;  ">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Tips</h3>
                            </div>
                            <div class="panel-body" style="overflow: auto;">
                                <h3>Tips your child should know</h3>
                                <p>
                                    Immunisation is the most significant public health intervention in the last 200
                                    years,
                                    providing a
                                    safe and efficient way to prevent the spread of many diseases that cause
                                    hospitalisation, serious
                                    ongoing health conditions and sometimes death. It is one of the best ways to protect
                                    yourself, your
                                    children and safeguard the health of future generations.</p>
                                <p>Immunisation is a simple, safe and effective way of protecting a child from diseases that
                                can cause
                                serious illness and sometimes death. If most children are vaccinated, this indirectly
                                protects people
                                who are still susceptible to the disease as they are less likely to come into contact
                                with someone
                                who is carrying the pathogens – a concept known as herd immunity. Herd immunity can
                                protect
                                those who are too young to be vaccinated or cannot be vaccinated because of medical
                                conditions
                                (e.g. receiving chemotherapy), and those who do not respond adequately to immunisation.
                                The
                                more people who vaccinate their children, the greater our ability to control serious
                                vaccine
                                preventable diseases.</p>

                                <a href="http://www.immunise.health.gov.au">http://www.immunise.health.gov.au
                                </a>
                            </div>
                        </div>

                    </div>
                </div>


            </div>

            <div class="row">
                <div class="col-lg-12" ng-show="checkboxModel.value4" style="height: 600px">

                    <div class="col-lg-7" style="height: inherit; ">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Crime Rate in
                                    {{suburbname}}</h3>
                                <div class="pull-right">
                                    <div class="btn-group">
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <p>(Percentage of recorded offenses in every 100,000 residents)</p>
                                <p> Crime Rate: {{council1.crime_rate}}%</p>
                                <p>Average Rate Across Melbourne:{{council2.crime_rate}}%</p>
                                <p>Council(s) with the lowest crime Rate:{{crimecouncil}} with rate:
                                    {{lowestCrimeRate}}%</p>

                                <p>**Data from Vic Gov</p>

                                <div id="chart3" style="height: 300px; width: 100%;">

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5" style="height: inherit;text-overflow: ellipsis; overflow: hidden;  ">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Tips</h3>
                            </div>
                            <div class="panel-body" style="overflow: auto;">
                                <h3>Tips your child should know</h3>
                                <p>Create and distribute a list of local organisations that can provide counselling, job
                                    training,
                                    guidance, and other services that could benefit people in the community.</p>
                                <p>Refuse to turn a blind eye to crime in your community.</p>
                                <p>Help to connect school services to outside networks of community services that can
                                    help
                                    students
                                    and their families cope with domestic or financial problems.</p>
                                <p>Set up a Neighbourhood Watch or a community patrol that works in collaboration with
                                    local
                                    police.
                                    A trusted neighbour who keeps a vigilant eye on your home is one of the best crime
                                    deterrents
                                    there is.</p>
                                <p>Learn your state and local laws on firearms. Insist that these laws be enforced
                                    vigorously but fairly.
                                    Support police, prosecutors, judges, and other local officials who enforce laws designed
                                    to prevent
                                    gun violence.</p>
                                <p>Join with school and law enforcement in creating and sustaining safe corridors for
                                    students
                                    traveling to and from school. Help with efforts to identify and eliminate neighborhood
                                    trouble spots.</p>
                                <a href="https://www.instantcheckmate.com/crimewire/2013/07/09/15-easy-ways-to-strengthen-yourcommunity-and-prevent-crime/">https://www.instantcheckmate.com/crimewire/2013/07/09/15-easy-ways-to-strengthen-yourcommunity-
                                    and-prevent-crime/
                                </a>
                            </div>
                        </div>

                    </div>
                </div>


            </div>


            <div class="row">
                <div class="col-lg-12" ng-show="checkboxModel.value1" style="height: 600px">

                    <div class="col-lg-7" style="height: inherit; ">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i>  Bullying Rate in {{suburbname}}</h3>
                                <div class="pull-right">
                                    <div class="btn-group">
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <p>(Percentage of Children being Bullied)</p>
                                <p> Bullying Rate: {{council1.bullying_rate}}%</p>
                                <p>Average Bullying Rate Across
                                    Melbourne:{{council2.bullying_rate}}%</p>
                                <p>Council(s) with the lowest Bullying Rate:{{bullycouncil}} with rate: {{lowestBullyRate}}%</p>

                                <p>**Data from Vic Gov</p>

                                <div id="chart5" style="height: 300px; width: 100%;">

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5" style="height: inherit;text-overflow: ellipsis; overflow: hidden;  ">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Tips</h3>
                            </div>
                            <div class="panel-body" style="overflow: auto;">
                                <h3>What is bullying?</h3>
                                <p>A repeated pattern of intentional aggressive behaviour between two children when there is
                                    a power
                                    imbalance.</p>
                                <h3>What are the signs?</h3>
                                <p>Not wanting to go to school</p>
                                <p>Is missing belongings</p>
                                <p>Has torn clothing</p>
                                <p>Seems to have become fearful and anxious</p>
                                <p>Seems to have a drop in academic performance</p>
                                <p>Has poorer physical health and changes in sleep habits</p>
                                <p>Has increased negative self-perception.</p>
                                <h3>What you can do?</h3>
                                <p>Stay calm and positive</p>
                                <p>Talk with school</p>
                                <p>Talk with your child</p>


                                <a href="http://www.bullyingnoway.gov.au/parents/being-bullied/index.html">http://www.bullyingnoway.gov.au/parents/being-bullied/index.html
                                </a>
                                <a href="http://kidshealth.org/en/parents/bullies.html#">http://kidshealth.org/en/parents/bullies.html#
                                </a>
                            </div>
                        </div>

                    </div>
                </div>


            </div>

            <div class="row">
                <div class="col-lg-12" ng-show="checkboxModel.value2" style="height: 600px">

                    <div class="col-lg-7" style="height: inherit; ">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Abuse Rate in {{suburbname}}</h3>
                                <div class="pull-right">
                                    <div class="btn-group">
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <p>
                                    (Percentage of Children being Abused)
                                </p>
                                <p> Abuse Rate: {{council1.abuse_rate}}%</p>
                                <p>Average Bullying Rate Across
                                    Melbourne:{{council2.abuse_rate}}%</p>
                                <p>Council(s) with the lowest Abuse Rate:{{abusecouncil}}  with rate: {{lowestAbuseRate}}% </p>

                                <p>**Data from Vic Gov</p>

                                <div id="chart6" style="height: 300px; width: 100%;">

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5" style="height: inherit;text-overflow: ellipsis; overflow: hidden;  ">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Tips</h3>
                            </div>
                            <div class="panel-body" style="overflow: auto;">
                                <p>Child abuse is any action by another person – adult or child – that causes significant
                                    harm to a child. It can be physical, sexual or emotional, but can just as often be about a lack of
                                    love, care and
                                    attention. We know that neglect, whatever form it takes, can be just as damaging to a
                                    child as physical abuse.</p>
                                <h3>Recognising abusive behaviour in yourself</h3>
                                <p>You can’t stop the anger</p>
                                <p>You feel emotionally disconnected from your child</p>
                                <p>Meeting the daily needs of your child seems impossible.</p>
                                <p>Other people have expressed concern.</p>
                                <h3>Tips for changing your reactions</h3>
                                <p>Learn what is age appropriate and what is not</p>
                                <p>Develop new parenting skills</p>
                                <p>Get professional help.</p>
                                <p>Learn how you can get your emotions under control.</p>


                                <a href="http://www.helpguide.org/articles/abuse/child-abuse-and-neglect.htm">http://www.helpguide.org/articles/abuse/child-abuse-and-neglect.htm
                                </a>
                                <a href="http://www.blueknot.org.au/WHAT-WE-DO/Resources/General-Information/Types-of-child-abuse">http://www.blueknot.org.au/WHAT-WE-DO/Resources/General-Information/Types-of-child-abuse
                                </a>
                            </div>
                        </div>

                    </div>
                </div>


            </div>


            <div class="row">
                <div class="col-lg-12" ng-show="checkboxModel.value8" style="height: 600px">

                    <div class="col-lg-7" style="height: inherit; ">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Sexual Offence Data for {{suburbname}}</h3>
                                <div class="pull-right">
                                    <div class="btn-group">
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <p>(Number of recorded sexual offense and related offense)</p>
                                <p> Recorded cases: {{council1.sexual_offense}}</p>
                                <p>Average number Across Melbourne:{{council2.sexual_offense}}</p>
                                <p>Council(s) with the lowest Abduction
                                    Rate:{{sexualcouncil}} with number of recorded offences {{lowestSexualRate}}</p>

                                <p>**Data from Vic Gov</p>

                                <div id="chart2" style="height: 300px; width: 100%;">

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5" style="height: inherit;text-overflow: ellipsis; overflow: hidden;  ">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Tips</h3>
                            </div>
                            <div class="panel-body" style="overflow: auto;">
                                <h3>Identifying sexual offences:</h3>
                                <p>Sexual harassment is unwelcome conduct of a sexual nature which makes a person feel
                                    offended,
                                    humiliated and/or intimidated where that reaction is reasonable in the
                                    circumstances.</p>
                                <h3>Help and protect your child:</h3>
                                <p>1. be suspicious if an adult wants to spend time alone with your child</p>
                                <p>2. be wary of people who are overly affectionate or generous with gifts to your child</p>
                                <p>3. be careful about the company your children keep. Watch children’s behaviour for signs
                                    of stress
                                    — their reactions to certain individuals may tell you something</p>
                                <p>4. teach children about being safe in a way that does not frighten them</p>
                                <a href="https://www.humanrights.gov.au/our-work/sex-discrimination/publications/effectively-preventing-and-responding-sexual-harassment">https://www.humanrights.gov.au/our-work/sex-discrimination/publications/effectively-preventing-and-responding-sexual-harassment
                                </a>
                                <a href="https://www.communities.qld.gov.au/childsafety/protecting-children/what-is-child-abuse/child-sexual-abuse">https://www.communities.qld.gov.au/childsafety/protecting-children/what-is-child-abuse/child-sexual-abuse
                                </a>
                            </div>
                        </div>

                    </div>
                </div>


            </div>


        </form>
    </div>


</div>





<!-- Metis Menu Plugin JavaScript -->
<%--<script src="../vendor/metisMenu/metisMenu.min.js"></script>--%>

<!-- Morris Charts JavaScript -->
<%--<script src="../vendor/raphael/raphael.min.js"></script>--%>
<%--<script src="../vendor/morrisjs/morris.min.js"></script>--%>
<%--<script src="../data/morris-data.js"></script>--%>

<!-- Custom Theme JavaScript -->
<%--<script src="<c:url value="/resources/analysis/jquery.js" /> "></script>--%>

<%--<script src="<c:url value="/resources/analysis/sb-admin-2.js" /> "></script>--%>




<%@include file="/WEB-INF/views/template/footer.jsp" %>



