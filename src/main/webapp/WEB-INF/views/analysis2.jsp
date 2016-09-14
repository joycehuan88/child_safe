
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

        <form name="myForm" ng-controller="requestCtrl" ng-init="initPage()" id="formController">
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
                                <label for="abduction" class="btn btn-info">Abduction Rate<input
                                        ng-model="checkboxModel.value6" type="checkbox" id="abduction" class="badgebox"><span
                                        class="badge">&check;</span></label>
                                <label for="immu" class="btn btn-info">Vaccination Rate<input
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
                                <label for="bully" class="btn btn-info">Bullying Rate<input
                                        ng-model="checkboxModel.value1" type="checkbox" id="bully"
                                        class="badgebox"><span class="badge">&check;</span></label>
                                <label for="abuse" class="btn btn-info">Abuse Rate<input ng-model="checkboxModel.value2"
                                                                                         type="checkbox" id="abuse"
                                                                                         class="badgebox"><span
                                        class="badge">&check;</span></label>

                                <label for="sexual" class="btn btn-info">Sexual Offense<input
                                        ng-model="checkboxModel.value8" type="checkbox" id="sexual"
                                        class="badgebox"><span class="badge">&check;</span></label>
                            </div>
                        </div>


                    </div>

                </div>

            </div>


            <div class="container">

                <div class="row">

                    <div class="col-lg-12"  ng-show="checkboxModel.value6">
                        <div class="col-md-6">
                            <h2 >
                                Abduction Data
                            </h2>
                            <h3 >(Number of recorded Abduction and related offense)</h3>
                            <h3> Abduction Rate: {{council1.abduction_rated}}</h3>
                            <h3 >Average Rate Across Melbourne:{{council2.abduction_rated}}</h3>
                            <h3>Council(s) with the lowest Abduction
                                Rate:{{abductioncouncil}}</h3>
                            <p>**Data from Vic Gov</p>

                            <div id="chart1" style="height: 300px; width: 90%;">

                            </div>
                        </div>
                        <div class="col-md-6" style="padding-top: 20px">
                            <h3>Tips your child should know</h3>
                            <p>
                                Never say they are alone if they answer the phone. They can offer to take a message or say their
                                parents will phone back.</p>
                            <p>Never answer the door if they are alone.</p>
                            <p>Not invite anyone in the house without the permission of a parent or babysitter.</p>
                            <p>Not go into people's houses without letting anyone know where they are.</p>
                            <p>Never get into anyone's car without permission.</p>
                            <p>Not take candy or other gifts from strangers or anyone else without asking a parent first.</p>
                            <p>Never play in deserted buildings or isolated areas.c</p>
                            <p>Scream and scatter books and belongings if they are forced towards a building or car.</p>
                            <p>Move away from a car that pulls up beside them if they do not know the driver.</p>
                            <p>Be taught that it's all right to say 'no' to an adult if the person wants them to do something you've taught them is wrong.</p>
                            <p>Know that no one has the right to touch any part of their bodies that a bathing suit would cover.</p>
                            <p>Tell you, school authorities or a police officer about anyone who exposes private parts.</p>
                            <p>Tell you if someone has asked them to keep a secret from you.</p>
                            <p>Go to the nearest cashier if lost or separated from you in a store or mall.</p>
                            <a href="http://www.pregnancy.org/article/30-ways-help-prevent-your-child-being-abducted">http://www.pregnancy.org/article/30-ways-help-prevent-your-child-being-abducted
                            </a>
                        </div>




                    </div>

                    <div class="col-lg-12"  ng-show="checkboxModel.value3" style="padding-top: 20px">
                        <div class="col-md-6">
                            <h2 >
                                Children Vaccination Rate
                            </h2>
                            <h3 >
                                (Percentage of Children being Vaccinised in the area)
                            </h3>
                            <h3 > Immunzation Rate: {{council1.vacc_rate}}%</h3>
                            <h3 >Average Rate Across Melbourne:{{council2.vacc_rate}}%</h3>
                            <h3 >Council(s) with the highest Immunization
                                Rate:{{immucouncil}} {{immucouncil.vacc_rate}}</h3>

                            <p >**Data from Vic Gov</p>

                            <div id="chart4" style="height: 300px; width: 90%;">

                            </div>
                        </div>
                        <div class="col-md-6" style="padding-top: 20px">
                            <h3>Tips your child should know</h3>
                            <p>
                                Immunisation is the most significant public health intervention in the last 200 years, providing a
                                safe and efficient way to prevent the spread of many diseases that cause hospitalisation, serious
                                ongoing health conditions and sometimes death. It is one of the best ways to protect yourself, your
                                children and safeguard the health of future generations.</p>
                            <p>Immunisation is a simple, safe and effective way of protecting a child from diseases that can cause
                                serious illness and sometimes death. If most children are vaccinated, this indirectly protects people
                                who are still susceptible to the disease as they are less likely to come into contact with someone
                                who is carrying the pathogens – a concept known as herd immunity. Herd immunity can protect
                                those who are too young to be vaccinated or cannot be vaccinated because of medical conditions
                                (e.g. receiving chemotherapy), and those who do not respond adequately to immunisation. The
                                more people who vaccinate their children, the greater our ability to control serious vaccine
                                preventable diseases.</p>

                            <a href="http://www.immunise.health.gov.au">http://www.immunise.health.gov.au
                            </a>
                        </div>


                    </div>

                    <div class="col-lg-12"  ng-show="checkboxModel.value4" style="padding-top: 20px">
                        <div class="col-md-6">
                            <h2 >
                                Crime Rate Data
                            </h2>
                            <h3 >(Percentage of recorded offenses in every 100,000 residents)</h3>
                            <h3 > Crime Rate: {{council1.crime_rate}}%</h3>
                            <h3 >Average Rate Across Melbourne:{{council2.crime_rate}}%</h3>
                            <h3>Council(s) with the lowest crime Rate:{{crimecouncil}}</h3>

                            <p >**Data from Vic Gov</p>

                            <div id="chart3" style="height: 300px; width: 90%;">

                            </div>
                        </div>
                        <div class="col-md-6" style="padding-top: 20px">
                            <h3>Other than staying at home, here are several tips you can do to help reducing crime
                                rates.</h3>
                            <p>Create and distribute a list of local organisations that can provide counselling, job
                                training,
                                guidance, and other services that could benefit people in the community.</p>
                            <p>Refuse to turn a blind eye to crime in your community.</p>
                            <p>Help to connect school services to outside networks of community services that can help
                                students
                                and their families cope with domestic or financial problems.</p>
                            <p>Set up a Neighbourhood Watch or a community patrol that works in collaboration with local
                                police.
                                A trusted neighbour who keeps a vigilant eye on your home is one of the best crime
                                deterrents
                                there is.</p>
                            <p>Work with schools in your area to establish (and enforce) drug-free, gun-free zones. You
                                can also
                                collaborate with recreation officials to do the same for parks.</p>
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

                    <div class="col-lg-12"  ng-show="checkboxModel.value1" style="padding-top:30px">
                        <div class="col-md-6">
                            <h2 >
                                BULLYING RATES
                            </h2>
                            <h3 >
                                (Percentage of Children being Bullied)
                            </h3>
                            <h3> Bullying Rate: {{council1.bullying_rate}}%</h3>
                            <h3>Average Bullying Rate Across
                                Melbourne:{{council2.bullying_rate}}%</h3>
                            <h3 >Council(s) with the lowest Bullying Rate:{{bullycouncil}}</h3>
                            <p>*Data from Vic Gov</p>

                            <div id="chart5" style="height: 300px; width: 90%;">

                            </div>
                        </div>
                        <div class="col-md-6" style="padding-top: 20px">
                            <h3>What is bullying?</h3>
                            <p>A repeated pattern of intentional aggressive behaviour between two children when there is a power
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

                    <div class="col-lg-12"  ng-show="checkboxModel.value2" style="padding-top: 20px">
                        <div class="col-md-6">
                            <h2 >
                                ABUSE RATES
                            </h2>
                            <h3 >
                                (Percentage of Children being Abused)
                            </h3>
                            <h3> Abuse Rate: {{council1.abuse_rate}}%</h3>
                            <h3 >Average Bullying Rate Across
                                Melbourne:{{council2.abuse_rate}}%</h3>
                            <h3>Council(s) with the lowest Abuse Rate:{{abusecouncil}}</h3>

                            <p >**Data from Vic Gov</p>

                            <div id="chart6" style="height: 300px; width: 90%;">

                            </div>
                        </div>
                        <div class="col-md-6" style="padding-top: 20px">

                            <p>Child abuse is any action by another person – adult or child – that causes significant harm to a
                                child. It can be physical, sexual or emotional, but can just as often be about a lack of love, care and
                                attention. We know that neglect, whatever form it takes, can be just as damaging to a child as
                                physical abuse.</p>
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
                            <a href="https://www.communities.qld.gov.au/childsafety/protecting-children/what-is-child-abuse">https://www.communities.qld.gov.au/childsafety/protecting-children/what-is-child-abuse </a>
                        </div>


                    </div>


                    <div class="col-lg-12" ng-show="checkboxModel.value8" style="padding-top: 20px">
                        <div class="col-md-6">
                            <h2 >
                                Sexual Offence Rates
                            </h2>
                            <h3 >(Number of recorded sexual offenses)</h3>
                            <h3> Rate: {{council1.sexual_offense}}</h3>
                            <h3 >Average Rate Across Melbourne:{{council2.sexual_offense}}</h3>
                            <h3>Council(s) with the lowest Abduction
                                Rate:{{sexualcouncil}}</h3>

                            <p >**Data from Vic Gov</p>

                            <div id="chart2" style="height: 300px; width: 90%;">

                            </div>
                        </div>
                        <div class="col-md-6" style="padding-top: 20px">
                             <h3>Identifying sexual offences:</h3>
                            <p>Sexual harassment is unwelcome conduct of a sexual nature which makes a person feel offended,
                                humiliated and/or intimidated where that reaction is reasonable in the circumstances.</p>
                            <h3>Help and protect your child:</h3>
                            <p>1. be suspicious if an adult wants to spend time alone with your child</p>
                            <p>2. be wary of people who are overly affectionate or generous with gifts to your child</p>
                            <p>3. be careful about the company your children keep. Watch children’s behaviour for signs of stress
                                — their reactions to certain individuals may tell you something</p>
                            <p>4. teach children about being safe in a way that does not frighten them</p>
                            <p>5. teach children that the parts of their bodies covered by underwear are private</p>
                            <p>6. teach children anatomical names for body parts, such as penis or vagina</p>
                            <p>7. encourage children to tell someone they trust if anyone tries to touch their private parts</p>
                            <p>8. carefully consider who else you might want your children to tell if you are not available — let
                                your children know these contact options.</p>
                            <p>9. speak to children who are under school age about personal safety in simple language and
                                repeat the same rules often — play ‘what if’ games to reinforce the message</p>
                            <p>10. teach children of primary school age basic family safety rules and how to apply them in
                                potentially dangerous situations</p>
                            <p>11. assist adolescents to think independently, and to develop decision-making and assertiveness
                                skills</p>
                            <p>12. know who is supervising your children when they are away from home</p>
                            <p>13. listen to your children and trust what they say, even if it shocks you — children rarely make up
                                stories about sexual abuse.</p>


                            <a href="https://www.humanrights.gov.au/our-work/sex-discrimination/publications/effectively-preventing-and-responding-sexual-harassment">https://www.humanrights.gov.au/our-work/sex-discrimination/publications/effectively-preventing-and-responding-sexual-harassment
                            </a>
                            <a href="https://www.communities.qld.gov.au/childsafety/protecting-children/what-is-child-abuse/child-sexual-abuse">https://www.communities.qld.gov.au/childsafety/protecting-children/what-is-child-abuse/child-sexual-abuse
                            </a>

                        </div>


                    </div>
                </div>
            </div>

            <%--<ui>--%>

            <%--<li ng-show= "checkboxModel.value1" >Bullying Rate:{{council1.bullying_rate}}</li>--%>
            <%--<li ng-show= "checkboxModel.value2" >Abuse Rate:{{council1.abuse_rate}}</li>--%>
            <%--<li ng-show= "checkboxModel.value3" >Immunisation Rate:{{council1.vacc_rate}}</li>--%>
            <%--<li ng-show= "checkboxModel.value4" >Crime Rate:{{council1.crime_rate}}</li>--%>
            <%--<li ng-show= "checkboxModel.value5" >Drug Dealing Rate:{{council1.drug_dealing}}</li>--%>
            <%--<li ng-show= "checkboxModel.value6" >Abduction Rate:{{council1.abduction_rated}}</li>--%>
            <%--<li ng-show= "checkboxModel.value7" >blackmail_extortion Rate:{{council1.blackmail_extortion}}</li>--%>
            <%--<li ng-show= "checkboxModel.value8" >Sexual Offense Rate:{{council1.sexual_offense}}</li>--%>


            <%--</ui>--%>
            <%--</div>--%>
            <%--<div class="row" data-wow-duration="500ms" data-wow-delay=".5s">--%>
            <%--<h2 class="item_title">--%>
            <%--Average Rates in Melbourne--%>
            <%--</h2>--%>
            <%--<ui>--%>

            <%--<li ng-show= "checkboxModel.value1" >Bullying Rate:{{council2.bullying_rate}}</li>--%>
            <%--<li ng-show= "checkboxModel.value2" >Abuse Rate:{{council2.abuse_rate}}</li>--%>
            <%--<li ng-show= "checkboxModel.value3" >Immunisation Rate:{{council2.vacc_rate}}</li>--%>
            <%--<li ng-show= "checkboxModel.value4" >Crime Rate:{{council2.crime_rate}}</li>--%>
            <%--<li ng-show= "checkboxModel.value5" >Drug Dealing Rate:{{council2.drug_dealing}}</li>--%>
            <%--<li ng-show= "checkboxModel.value6" >Abduction Rate:{{council2.abduction_rated}}</li>--%>
            <%--<li ng-show= "checkboxModel.value7" >blackmail_extortion Rate:{{council2.blackmail_extortion}}</li>--%>
            <%--<li ng-show= "checkboxModel.value8" >Sexual Offense Rate:{{council2.sexual_offense}}</li>--%>


            <%--</ui>--%>
            <%--</div>--%>
            <%--<div class="row" data-wow-duration="500ms" data-wow-delay=".7s">--%>
            <%--<h2 class="item_title">--%>
            <%--Councils with the lowest Rates--%>
            <%--</h2>--%>
            <%--<ui>--%>

            <%--<li ng-show= "checkboxModel.value1" >Lowest Bullying Rate:{{bullycouncil}}</li>--%>
            <%--<li ng-show= "checkboxModel.value2" >Lowest Abuse Rate:{{abusecouncil}}</li>--%>
            <%--<li ng-show= "checkboxModel.value3" >Highest Immunisation Rate:{{immucouncil}}</li>--%>
            <%--<li ng-show= "checkboxModel.value4" >Lowest Crime Rate:{{crimecouncil}}</li>--%>
            <%--<li ng-show= "checkboxModel.value5" >Lowest Drug Dealing Rate:{{drugcouncil}}</li>--%>
            <%--<li ng-show= "checkboxModel.value6" >Lowest Abduction Rate:{{abductioncouncil}}</li>--%>
            <%--<li ng-show= "checkboxModel.value7" >Lowest blackmail_extortion Rate:{{blackmailcouncil}}</li>--%>
            <%--<li ng-show= "checkboxModel.value8" >Lowest Sexual Offense Rate:{{sexualcouncil}}</li>--%>


            <%--</ui>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>

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


<%--<section id="clients">--%>
    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<div class="col-md-12">--%>
                <%--<h2 class="subtitle text-center wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".3s">What Next</h2>--%>
                <%--<p class="subtitle-des text-center wow fadeInDown" data-wow-duration="500ms" data-wow-delay=".5s">Our Developers are working very hard to bring more useful features for you as a parent.This includes a map with information about public parks and toilets.--%>

                    <%--We'd also love to hear your feed back. Let us know the features you'd love to see,what you think would be useful to you as a parent.</p>--%>

            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</section>--%>

<script src="<c:url value="/resources/js/controller.js" /> "></script>

<script type="text/javascript" src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>

<%@include file="/WEB-INF/views/template/footer.jsp" %>
