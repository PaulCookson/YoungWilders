<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="proj">
<%@include  file="includes/google.jsp" %> 
        <div class="container">
            <div class="row">

                <%@include  file="includes/leftnav.jsp" %>

                <div id="centre-content" class="col-lg-4 content-first">
                    <div id="content">
                    
                    </div>
                    <div class="button_group" >
                        <a type="button" class="btn btn-general" href="projects.jsp">List View</a>
                        <a type="button" class="btn btn-general" href="projectmap.jsp">Map View</a>

                    </div>           
                </div>
                <div id="right-content" class="col-lg-6" style="min-height: 600px">

                    <div class="row">

                        <div id="projects" class="col-lg-4" style="margin-top:30px;">
                            <!--<p><a class="link-opacity-100" href="vacancies.jsp?type=other">Pounce Hall</a></p>
                            <p><a class="link-opacity-100" href="vacancies.jsp?type=other">123</a></p>
                            -->
                        </div>
                        <div id="projectdetail" class="col-lg-8" style="margin-top:30px;">
                            
                            <div>
                                
                                
                            </div>
                            
                        </div>


                    </div>

                </div>
            </div>


        </div>    
        <script>
            
            var projects;
            
            
            
            function renderDetail(index)
            {
                
                var fields =projects[index].fields;
                
                var images;
        
                if(fields.projectImages && fields.projectImages.map)
                    images = fields.projectImages.map(renderImage).join('<br>');        
                
                
                
                $('#projectdetail').html('<div>' +
                        '<div id="projectdetailmap" style="width:100%;height:200px"></div>'        
                +
                
                '<table><tr><td width="40%"><p>PROJECT START<br>' + new Date(Date.parse(fields.projectDate)).getFullYear() +'<br><br>'
                 + 'ACREAGE<br>' +  fields.acreage + '<br><br>WILD STEWARDS<br>' 
                 + renderArray(fields.wildStewards) + '<br><br>ECOLOGICAL WORK</p>' +
                
                (fields.ecologicalWork ? documentToHtmlString(fields.ecologicalWork) : '') + 
                
                '</td><td>' + (fields.location? fields.location:'') + '<br><br><br>' +
                documentToHtmlString(fields.factSheet)  +
                '</td></tr></table>' 
                + '<div id="projectImages">' + images + '</div>'
                + '</div>');
                
                var src='https://test.nottinghambackgammon.org/' + fields.mapFile ;
                map = new google.maps.Map(document.getElementById('projectdetailmap'), {
    center: {lat: fields.lattitude, lng: fields.longitude },  
    zoom: 7,
    mapTypeId: 'satellite',
    disableDefaultUI: true
  });
                
var customStyled = [
  {
    featureType: "all",
    elementType: "labels",
    stylers: [
      { visibility: "off" }
    ]
  }
]
map.set('styles',customStyled);
                
                

                 var kmlLayer = new google.maps.KmlLayer(src, {
                        suppressInfoWindows: true,
                        preserveViewport: false,
                        map: map
                      });
                
                
            }
            
            function renderProjects(data)
            {
                projects = data;
                return data.map(renderSingleProject).join('\n');
                        

            }
            function renderSingleProject(project, index) {
                var fields = project.fields;
                console.log(fields)
                return '<p><a class="link-opacity-100" href="#" onclick="renderDetail(' + index + ');return false;">' + fields.projectName + '</a></p>';
                
            
            }
            
            function renderProjectDetails(fields) {
                return  '<p>' + fields.projectName + '</p>';

            }
            var container;
            var PRODUCT_CONTENT_TYPE_ID;
            var contentfulClient;
            let map;
            $(document).ready()
            {


                contentfulClient = getClient(contentful);

                PRODUCT_CONTENT_TYPE_ID = 'project';




                renderContent(contentfulClient,$('#projects'), PRODUCT_CONTENT_TYPE_ID, null, null, null, renderProjects)
                renderID(contentfulClient, '74IVrpw1ZyaXW9QmJ5DgtC',$('#content'), basicRenderer);
                


            }
            async function initMap() {
                // The location of Uluru
                const position = {lat: 52.9962192, lng: -1.133586};

                // Request needed libraries.
                //@ts-ignore
                const {Map} = await google.maps.importLibrary("maps");
                const {AdvancedMarkerElement} = await google.maps.importLibrary("marker");

                // The map, centered at Uluru
               



            }


        </script>    


 <script async
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBxol2BCz3gtSPa1Ig5Zs0sx23kmq2Qfnw&loading=async&callback=initMap">
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->



    </body>
</html>
