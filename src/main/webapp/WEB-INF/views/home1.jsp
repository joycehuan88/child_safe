
<%@include file="/WEB-INF/views/template/header.jsp" %>

<!--
==================================================
Slider Section Start
================================================== -->
<section id="hero-area" >
    <div class="container" ng-app="suburbApp">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="block wow fadeInUp" data-wow-delay=".3s">

                    <!-- Slider -->
                    <section class="cd-intro">
                        <h1 class="wow fadeInUp animated cd-headline slide" data-wow-delay=".4s" >
                            <span> IS YOUR CHILD SAFE OUTSIDE ? </span><br>
                            <span class="cd-words-wrapper">
                                    <b class="is-visible">YES ?</b>
                                    <%--<b>NO ?</b>--%>
                            </span>
                        </h1>
                    </section>

                    <%--<form name="myForm" ng-controller="requestCtrl" ng-init="initPage()" id="formController">--%>
                        <%--<div class="form-group">--%>
                            <%--<div class="col-sm-1 col-md-6 col-lg-6">--%>
                                <%--<div class="ui-widget">--%>
                                    <%--<input type="search" align="center" class="form-control" id="search"--%>
                                           <%--ng-model="suburb" ng-click="search()"--%>
                                           <%--placeholder="Enter Suburb Name" size="10">--%>
                                <%--</div>--%>


                            <%--</div>--%>
                            <%--<button type="submit" class="btn btn-primary" ng-click="search()">Search</button>--%>
                        <%--</div>--%>
                    <%--</form>--%>

                    <!-- cd-intro -->
                    <!-- /.slider -->
                    <h2 class="wow fadeInUp animated" data-wow-delay=".6s" style="color: #0f0f0f">
                        <%--Approximately 260 children die and 58,000 are hospitalised every year due to unintentional injury in Australia.--%>
                    </h2>
                    <%--<a class="btn-lines dark light wow fadeInUp animated smooth-scroll btn btn-default btn-green" data-wow-delay=".9s" href="<c:url value="/analysis" />">FIND OUT MORE</a>--%>
                    <a  class="btn-lines dark light wow fadeInUp animated btn btn-default btn-green" href="<c:url value="/analysis"  />">FIND OUT MORE</a>

                </div>
            </div>
        </div>
    </div>
</section><!--/#main-slider-->
<!--
==================================================
Slider Section Start
================================================== -->

<section id="about" margin-top:50px>
    <div class="container"  >
        <div class="row">
            <div class="col-md-19 text-center">
                <h1>News that's important to you</h1>
                <div id="users">

                    <!-- start feedwind code --> <script type="text/javascript" src="https://feed.mikle.com/js/fw-loader.js" data-fw-param="?widget_parameter=%7B%22sources%22%3A%5B%7B%22source%22%3A%22http%3A%2F%2Fwww.abc.net.au%2Fnews%2Ffeed%2F1184%2Frss.xml%22%2C%22type%22%3A%22RSS%22%7D%5D%2C%22name%22%3A%22%22%2C%22width%22%3A0%2C%22height%22%3A%22400%22%2C%22height_by_article%22%3A0%2C%22target%22%3A%22_blank%22%2C%22font%22%3A%22Arial%2C%20Helvetica%2C%20sans-serif%22%2C%22title_font_size%22%3A%2216%22%2C%22item_title_font_size%22%3A%2216%22%2C%22item_description_font_size%22%3A%2212%22%2C%22border%22%3A%22on%22%2C%22css_url%22%3A%22%22%2C%22responsive%22%3A%22on%22%2C%22text_direction%22%3A%22left%22%2C%22text_alignment%22%3A%22left%22%2C%22corner%22%3A%22rounded%22%2C%22scroll%22%3A%22on%22%2C%22auto_scroll%22%3A%22off%22%2C%22auto_scroll_direction%22%3A%22up%22%2C%22auto_scroll_step_speed%22%3A%224%22%2C%22auto_scroll_mc_speed%22%3A%2220%22%2C%22sort%22%3A%22new%22%2C%22title%22%3A%22off%22%2C%22title_sentence%22%3A%22%22%2C%22title_link%22%3A%22%22%2C%22title_bgcolor%22%3A%22%23ffffff%22%2C%22title_color%22%3A%22%23505659%22%2C%22title_bgimage%22%3A%22%22%2C%22item_bgcolor%22%3A%22%23ffffff%22%2C%22item_bgimage%22%3A%22%22%2C%22item_title_length%22%3A%2255%22%2C%22item_title_color%22%3A%22%232e7ec8%22%2C%22item_border_bottom%22%3A%22on%22%2C%22item_description%22%3A%22both%22%2C%22item_link%22%3A%22off%22%2C%22item_description_length%22%3A%22100%22%2C%22item_description_color%22%3A%22%23505659%22%2C%22item_date%22%3A%22on%22%2C%22item_date_format%22%3A%22%25b%20%25e%2C%20%25Y%20%25k%3A%25M%22%2C%22item_date_timezone%22%3A%22%22%2C%22item_description_style%22%3A%22thumbnail%22%2C%22item_thumbnail%22%3A%22crop%22%2C%22item_thumbnail_selection%22%3A%22auto%22%2C%22article_num%22%3A%2215%22%2C%22item_player%22%3A%22youtube%22%2C%22keyword_inc%22%3A%22%22%2C%22keyword_exc%22%3A%22%22%7D"></script> <!-- end feedwind code -->

                    <%--<input class="search form-control" placeholder="Please search a suburb by name or postcode " />--%>
                    <%--<ul class="list">--%>
                        <%--<c:forEach items="${suburbs}" var="suburb">--%>

                            <%--<li class="dropdown" style="display: block">--%>
                                <%--<h3 class="name">${suburb.suburbName} </h3>--%>
                                <%--<p class="suburb" >${suburb.postCode}</p>--%>

                                <%--<c:forEach items="${suburb.infoList}" var="info">--%>
                                    <%--<p class="born" >${info.toString()}</p>--%>
                                <%--</c:forEach>--%>


                            <%--</li>--%>

                        <%--</c:forEach>--%>

                    <%--</ul>--%>

                </div>
            </div>
        </div>
    </div>
</section>



<%--<section id="call-to-action">--%>
    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<div class="col-md-12">--%>
                <%--<div class="block">--%>
                    <%--&lt;%&ndash;<h2 class="title wow fadeInDown" data-wow-delay=".3s" data-wow-duration="500ms">SO WHAT YOU THINK ?</h2>&ndash;%&gt;--%>
                        <%--<p class="wow fadeInDown" data-wow-delay=".5s" data-wow-duration="500ms">Crime Rate: Percentage of recorded offenses in every 100,000 residents</p>--%>
                        <%--<p class="wow fadeInDown" data-wow-delay=".7s" data-wow-duration="500ms">Abuse rate: Percentage of children form year 5-6 in schools who claimed to be abused on survey</p>--%>
                        <%--<p class="wow fadeInDown" data-wow-delay=".12s" data-wow-duration="500ms">Bullying rate: Percentage of children form year 5-6 in schools who claimed to be bullied on survey</p>--%>
                        <%--<p class="wow fadeInDown" data-wow-delay=".5s" data-wow-duration="500ms">Abduction: Number of recorded Abduction and related offense happened in the pervious</p>--%>
                        <%--<p class="wow fadeInDown" data-wow-delay=".8s" data-wow-duration="500ms">Drug dealing: Number of recorded drug dealing and related offense happened in the pervious</p>--%>
                        <%--<p class="wow fadeInDown" data-wow-delay=".9s" data-wow-duration="500ms">Blackmail: Number of recorded blackmail or extortion and related offense happened in the pervious</p>--%>
                        <%--<p class="wow fadeInDown" data-wow-delay=".10s" data-wow-duration="500ms">Sexual offense: Number of recorded sexual offense and related offense happened in the pervious</p>--%>
                        <%--&lt;%&ndash;<a href="contact.html" class="btn btn-default btn-contact wow fadeInDown" data-wow-delay=".7s" data-wow-duration="500ms">Contact With Me</a>&ndash;%&gt;--%>
                <%--</div>--%>
            <%--</div>--%>

        <%--</div>--%>
    <%--</div>--%>
<%--</section>--%>

<%@include file="/WEB-INF/views/template/footer.jsp" %>