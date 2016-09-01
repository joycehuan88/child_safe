
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
                        Approximately 260 children die and 58,000 are hospitalised every year due to unintentional injury in Australia. This means that more Australian children die of injury than die of cancer, asthma and infectious diseases combined.
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



<section id="call-to-action">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block">
                    <%--<h2 class="title wow fadeInDown" data-wow-delay=".3s" data-wow-duration="500ms">SO WHAT YOU THINK ?</h2>--%>
                        <p class="wow fadeInDown" data-wow-delay=".5s" data-wow-duration="500ms">Crime Rate: Percentage of recorded offenses in every 100,000 residents</p>
                        <p class="wow fadeInDown" data-wow-delay=".7s" data-wow-duration="500ms">Abuse rate: Percentage of children form year 5-6 in schools who claimed to be abused on survey</p>
                        <p class="wow fadeInDown" data-wow-delay=".12s" data-wow-duration="500ms">Bullying rate: Percentage of children form year 5-6 in schools who claimed to be bullied on survey</p>
                        <p class="wow fadeInDown" data-wow-delay=".5s" data-wow-duration="500ms">Abduction: Number of recorded Abduction and related offense happened in the pervious</p>
                        <p class="wow fadeInDown" data-wow-delay=".8s" data-wow-duration="500ms">Drug dealing: Number of recorded drug dealing and related offense happened in the pervious</p>
                        <p class="wow fadeInDown" data-wow-delay=".9s" data-wow-duration="500ms">Blackmail: Number of recorded blackmail or extortion and related offense happened in the pervious</p>
                        <p class="wow fadeInDown" data-wow-delay=".10s" data-wow-duration="500ms">Sexual offense: Number of recorded sexual offense and related offense happened in the pervious</p>
                        <%--<a href="contact.html" class="btn btn-default btn-contact wow fadeInDown" data-wow-delay=".7s" data-wow-duration="500ms">Contact With Me</a>--%>
                </div>
            </div>

        </div>
    </div>
</section>

<%@include file="/WEB-INF/views/template/footer.jsp" %>