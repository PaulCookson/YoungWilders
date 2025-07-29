
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="programme">

        <div class="container">
            <div class="row">

                <%@include  file="includes/leftnav.jsp" %>

                <div id="centre-content"  class="col-md-4 content-first">
                    <p>We run events on our youth-led nature recovery projects across the UK. we also run a number of creative programmes and events centred on up-skilling and energising the next generation of environmental stewards under 'Overgrowth'.
                    </p>

                    <div class="button_group">
                        <a type="button" class="btn btn-general" href="programme.jsp">Upcoming</a>
                        <a type="button" class="btn btn-general" href="programme.jsp">Past</a>
                    </div>
                </div>
                <div id="right-content" class="col-md-6">
                    
                    <div id="programmes">
                        
                        
                    </div>
                    <%--
                    <ul class="faq-list" style="list-style-type:none;padding-left: 0">

                        <li class="programme-item">
                        <div class="row">
                            <div class="programme-item-col" style="width:200px;">
                                Rye Meadow 
                                
                            </div>
                            <div class="programme-item-col" style="width:200px;">

                                Rye, East Sussex
                                
                            </div>
                            <div class="programme-item-col" style="width:170px;">
                                10.02.2024
                                
                            </div>
                            
                            <div data-bs-toggle="collapse" class="programme-item-col collapsed question" href="#faq1" style="width:10px">+<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                            <div id="faq1" class="collapse row" data-bs-parent=".faq-list" style="margin-top:10px">

                                <div class="col-md-6">
                                    <p>
                                        OVERVIEW: Beginning in 2020, Rye Meadow marked our first ever project. It involves the creation of 2 acres of native wildflower meadow that should see its first major bloom in Spring 2023. 
                                        Rye Meadow's status as our first ever project has ensured it a special place in our collective heart. It's also situated in a phenomenally beautiful part of the country, the High Weald, and is framed by vineyards and old hedgerows. The Sussex Lund Grant Program has supported our work throughout, and helped us conduct the necessary mowing and sowing, as well as provided guidance on seed mixes for the local area.

                                    </p>
                                </div>
                                <div  class="col-md-6">
                                    <img style="width:100%" src="./assets/programme.png">   
                                </div>

                            </div>
                        </div>
                        </li>

                        


                    </ul>
                    --%>
                </div>
            </div>


        </div>    

      

             <script>
            var container;
            var PRODUCT_CONTENT_TYPE_ID;
            var contentfulClient;
            
            function renderProgrammes(programmes) {
                return '' +
                        '<ul class="faq-list" style="list-style-type:none;padding-left: 0">' +
                        programmes.map(renderSingleProgramme).join('\n') +
                        '</ul>';
                
                
                
            }
            function renderSingleProgramme(programme, index)
            {
                var fields = programme.fields
                return '<li class="programme-item">' +
                        '<div class="row">' +
                            '<div class="programme-item-col" style="width:300px;">' + 
                                fields.programmeName + 
                                
                            '</div>' +
                            '<div class="programme-item-col" style="width:240px;">' +

                                fields.programmeLocation +
                                
                            '</div>' +
                            '<div class="programme-item-col" style="width:70px;">' +
                                 '' + new Date(Date.parse(fields.programmeStartDate)).toLocaleDateString('en-us') +
                                
                            '</div>' +

                            '<div data-bs-toggle="collapse" class="programme-item-col question collapsed" href="#faq' + index + '" style="width:10px" aria-expanded="false">+<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>' +
                            '<div id="faq' + index + '" class="programme-item-detail row collapse" data-bs-parent=".faq-list" style="margin-top: 10px;">' +

                             '   <div class="col-md-6">' +
                             
                                 documentToHtmlString(fields.programmeOverview) +

                              
                                '</div>' +
                                '<div class="col-md-6">' +
                                '    <img style="width:100%" src="./assets/programme.png">   ' +
                                '</div>' +

                            '</div>' +
                        '</div>' +
                        '</li>'
                
            }
            $(document).ready()
            {


                contentfulClient = contentful.createClient({
                    accessToken: 'ytygcE-zI6VEYycBoRzvYvtXW_VcXAYfldZSnmDFNhs',
                    space: 'y0hkcnou78kd'
                });

                PRODUCT_CONTENT_TYPE_ID = 'programme';

                container = $('#programmes'); 

                renderContent(contentfulClient, PRODUCT_CONTENT_TYPE_ID, null,null,null, renderProgrammes)


            }
            
            </script>
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>


    </body>
</html>
