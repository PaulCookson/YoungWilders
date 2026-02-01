
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id='donate'>
        <%@include  file="includes/google.jsp" %> 
         <%@include  file="includes/container.jsp" %>
            <div class="row">

                <%@include  file="includes/leftnav.jsp" %>

                <div id="centre-content" class="col-lg-4 content-first">
                    <div id="content">

                        <div id="content_sub">

                        </div>

                        <div class="button_group" >

                            <a type="button" class="btn btn-general" href="javascript:donate(1);">Donate Once</a>


                            <a type="button" class="btn btn-general" href="javascript:donate(0);">Donate Monthly</a>   


                        </div>     

                    </div>


                </div>
                <div id='right-content' class="col-lg-6">

                    <div id="once" style='width:400px;height:598px;background-image:url(assets/images/donate1.jpg);background-repeat:no-repeat;
                         background-size:contain;'> <div class='scrapentry' style='height:300px'>

                            <h5 class="" style="font-size:42px; line-height:0.5em; text-align:center;">
                                <span style="font-size:42px;width:100%" class="wixui-rich-text__text">
                                    <a href="https://youngwilders.enthuse.com/donateonce" target="_blank" rel="noreferrer noopener" class="wixui-rich-text__text">
                                        <br class="wixui-rich-text__text">
                                        <span class="color_36 wixui-rich-text__text">Donate Once</span>
                                    </a>

                                </span>
                                <br><br>
                                <p class="font_7 wixui-rich-text__text" style="margin-left:10px;margin-right:10px;font-size:14px; text-align:center;"><a href="https://youngwilders.enthuse.com/donateonce" target="_blank" rel="noreferrer noopener" class="wixui-rich-text__text"><span style="font-size:14px;" class="wixui-rich-text__text"><span class="color_36 wixui-rich-text__text">Help us fight climate change, reverse ecological decline, and educate and energise a new generation of environmentalists.&nbsp;</span></span></a></p>
                                <br>
                                <br>

                                <span style="font-size:17px;" class="wixui-rich-text__text"><span style="font-weight:bold;" class="wixui-rich-text__text"><span class="color_36 wixui-rich-text__text">CLICK <span style="text-decoration:underline;" class="wixui-rich-text__text"><a href="https://youngwilders.enthuse.com/donateonce" target="_blank" rel="noreferrer noopener" class="wixui-rich-text__text">HERE</a></span> TO DONATE ONCE</span></span></span></h5>

                        </div></div>

                    <div id="monthly" style='display:none;width:400px;height:598px;background-image:url(assets/images/donate2.jpg);background-repeat:no-repeat;background-position: center;
                         background-size:cover;'> <div class='scrapentry' style='height:300px'>

                            <h5 class="" style="font-size:42px; line-height:0.5em; text-align:center;">
                                <span style="font-size:42px;width:100%" class="wixui-rich-text__text">
                                    <a href="https://youngwilders.enthuse.com/becomeayoungwilder#!" target="_blank" rel="noreferrer noopener" class="wixui-rich-text__text">
                                        <br class="wixui-rich-text__text">
                                        <span class="color_36 wixui-rich-text__text">Donate Monthly</span>
                                    </a>

                                </span>
                                <br><br>
                                <p class="font_7 wixui-rich-text__text" style="margin-left:10px;margin-right:10px;font-size:14px; text-align:center;"><a href="https://youngwilders.enthuse.com/becomeayoungwilder#!" target="_blank" rel="noreferrer noopener" class="wixui-rich-text__text"><span style="font-size:14px;" class="wixui-rich-text__text"><span class="color_36 wixui-rich-text__text">Regular donations are an indispensable part of our work and long-term vision. Become a Youngwilder and give monthy!</span></span></a></p>
                                <br>
                                <br>

                                <span style="font-size:17px;" class="wixui-rich-text__text"><span style="font-weight:bold;" class="wixui-rich-text__text"><span class="color_36 wixui-rich-text__text">CLICK <span style="text-decoration:underline;" class="wixui-rich-text__text"><a href="https://youngwilders.enthuse.com/becomeayoungwilder#!" target="_blank" rel="noreferrer noopener" class="wixui-rich-text__text">HERE</a></span> TO DONATE MONTHLY</span></span></span></h5>

                        </div>
                    </div>


                </div>
            </div>


        </div>    


        <script>


            function donate(donate)
            {
                if (donate == 1)
                {
                    $('#once').show();
                    $('#monthly').hide();
                } else
                {
                    $('#once').hide();
                    $('#monthly').show();
                }
            }



            $(document).ready()
            {

                contentfulClient = getClient(contentful);


                renderID(contentfulClient, '3OhCnFCVCoC8FXADOi2imI', $('#content_sub'), basicRenderer);

            }


        </script>    


        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>


    </body>
</html>

