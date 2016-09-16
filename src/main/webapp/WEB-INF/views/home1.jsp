
<%@include file="/WEB-INF/views/template/header.jsp" %>

<!--
==================================================
Slider Section Start
================================================== -->
<section id="hero-area" >
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="block wow fadeInUp" data-wow-delay=".3s">

                    <!-- Slider -->
                    <section class="cd-intro">
                        <h1 class="wow fadeInUp animated cd-headline slide" data-wow-delay=".4s" >
                            <span> IS YOUR CHILD SAFE OUTSIDE ? </span><br>
                            <span class="cd-words-wrapper">
                                    <b class="is-visible">YES ?</b>
                                    <b>NO ?</b>
                                </span>
                        </h1>
                    </section> <!-- cd-intro -->
                    <!-- /.slider -->
                    <h2 class="wow fadeInUp animated" data-wow-delay=".6s" style="color: #0f0f0f">
                        Approximately 260 children die and 58,000 are hospitalised every year due to unintentional injury in Australia.
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

<section id="about">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">

                <div id="users">
                    <!-- start feedwind code --><script type="text/javascript">
                    document.write('\x3Cscript type="text/javascript" src="' + ('https:' == document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/js/rssmikle.js">\x3C/script>');</script>
                    <script type="text/javascript">(function() {var params = {rssmikle_url: "http://www.abc.net.au/news/feed/1770/rss.xml",rssmikle_frame_width: "500",rssmikle_frame_height: "400",frame_height_by_article: "5",rssmikle_target: "_blank",rssmikle_font: "Arial, Helvetica, sans-serif",rssmikle_font_size: "12",rssmikle_border: "off",responsive: "off",rssmikle_css_url: "",text_align: "left",text_align2: "left",corner: "off",scrollbar: "on",autoscroll: "on",scrolldirection: "up",scrollstep: "3",mcspeed: "20",sort: "Off",rssmikle_title: "on",rssmikle_title_sentence: "",rssmikle_title_link: "",rssmikle_title_bgcolor: "#0066FF",rssmikle_title_color: "#FFFFFF",rssmikle_title_bgimage: "",rssmikle_item_bgcolor: "#FFFFFF",rssmikle_item_bgimage: "",rssmikle_item_title_length: "55",rssmikle_item_title_color: "#B8373B",rssmikle_item_border_bottom: "on",rssmikle_item_description: "on",item_link: "off",rssmikle_item_description_length: "150",rssmikle_item_description_color: "#666666",rssmikle_item_date: "gl1",rssmikle_timezone: "Etc/GMT",datetime_format: "%b %e, %Y %l:%M %p",item_description_style: "text+tn",item_thumbnail: "full",item_thumbnail_selection: "media_thumbnail",article_num: "15",rssmikle_item_podcast: "off",keyword_inc: "",keyword_exc: ""};feedwind_show_widget_iframe(params);})();</script>
                    <div style="font-size:10px; text-align:center; width:500px;"><a href="http://feed.mikle.com/" target="_blank" style="color:#CCCCCC;">RSS Feed Widget</a><!--Please display the above link in your web page according to Terms of Service.--></div><!--  end  feedwind code -->

                    <input class="search form-control" placeholder="Please search a suburb by name or postcode " />
                    <ul class="list">
                        <c:forEach items="${suburbs}" var="suburb">

                            <li class="dropdown" style="display: block">
                                <h3 class="name">${suburb.suburbName} </h3>
                                <p class="suburb" >${suburb.postCode}</p>

                                <c:forEach items="${suburb.infoList}" var="info">
                                    <p class="born" >${info.toString()}</p>
                                </c:forEach>


                            </li>

                        </c:forEach>

                    </ul>

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