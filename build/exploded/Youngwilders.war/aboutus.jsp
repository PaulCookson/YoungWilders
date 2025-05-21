
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %> 
        <script nonce="" src="js/aboutus.js"></script>
        
        
        <script
      src="https://cdn.jsdelivr.net/npm/contentful@7.0.5/dist/contentful.browser.min.js"
      charset="utf-8"
    ></script>
    <script>
      var exports = {}; // quick fix because 'exports' is not defined in rich-text bundle below
    </script>
    <script
      src="https://cdn.jsdelivr.net/npm/@contentful/rich-text-html-renderer@12.0.0/dist/rich-text-html-renderer.es5.min.js"
      charset="utf-8"
    ></script>
        
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <%@include  file="includes/leftnav.jsp" %>
                </div>
                <div class="col-md-4 content-first">
                    <p>Youndwilders started in 2020 as the passion project of a group of friends hellbent on helping nature recovery.</p>

                    <a href="aboutus.jsp?colleagueType=Core"><button>Core Team</button></a>
                    <a href="aboutus.jsp?colleagueType=Collaborator"><button>Key Collaborators Team</button></a>
                        <a href="aboutus.jsp?colleagueType=Advisor"><button>Advisors</button></a>


                </div>
                <div class="col-md-6">
                    <div id="colleagues">

                    </div>
                    <%--
                    <div style='width:150px'>
                        <img class="image-first" src="assets/1.jpg">
                        Noah has a background...
                    </div>
                    <div style='width:150px'>
                        <img class="image-first" src="assets/1.jpg">
                        Jack studied at
                    </div>
                    <div style='width:150px'>
                        <img class="image-first" src="assets/1.jpg">
                        Layla Mapemba-Taylor
                    </div>
                    <div style='width:150px'>
                        <img class="image-first" src="assets/1.jpg">
                        Molly Easton
                    </div>
                    --%>
                </div>
            </div>


        </div>    

        <%--
        <div class="d-flex" id="wrapper">
            
          
            
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">Action</a>
                                        <a class="dropdown-item" href="#!">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">Something else here</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid content-first">
                    
                    <p>Youth-led nature recovery in the UK. </p>
                    <p>
                        We accelerate UK nature recovery and centre young people in the process and the movement.
                        
                    </p>
                    <p>
                        In the next three years, we want every young person in England and Wales within an hour of a youth-led nature recovery project.
                    </p>
                </div>
                <div class="container-fluid ">
                    
                    <p>Youth-led nature recovery in the UK. </p>
                    <p>
                        We accelerate UK nature recovery and centre young people in the process and the movement.
                        
                    </p>
                    <p>
                        In the next three years, we want every young person in England and Wales within an hour of a youth-led nature recovery project.
                    </p>
                </div>
            </div>
        </div>
        --%>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

        <script>
            var container;
            var PRODUCT_CONTENT_TYPE_ID;
            var contentfulClient;
            $(document).ready()
            {


                contentfulClient = contentful.createClient({
                    accessToken: 'ytygcE-zI6VEYycBoRzvYvtXW_VcXAYfldZSnmDFNhs',
                    space: 'y0hkcnou78kd'
                });

                PRODUCT_CONTENT_TYPE_ID = 'colleague';

                container = $('#colleagues'); 



            }


            contentfulClient.getEntries({
                content_type: PRODUCT_CONTENT_TYPE_ID,
                'fields.colleagueType': '${empty param.colleagueType ? 'Core' : param.colleagueType}',
                order:'fields.ranking'
            })
                    .then(function (entries) {
                        console.log(entries);
                        container.html(renderColleagues(entries.items));
                    })


            function renderColleagues(colleagues) {
                return '<h1>Colleagues</h1>' +
                        '<div class="colleagues">' +
                        colleagues.map(renderSingleColleague).join('\n') +
                        '</div>'
            }

            function renderSingleColleague(colleague) {
                var fields = colleague.fields
                console.log(fields)
                return '<div class="colleague">' +
                        '<div class="colleague-image">' +
                        renderImage(fields.picture) +
                        '</div>' +
                        '<div class="colleague-details">' +
                        renderColleagueDetails(fields) +
                        '</div>' +
                        '</div>'
            }

            function renderColleagueDetails(fields) {
                return  '<p>' + fields.name + '</p>' + renderProductHeader(fields) 
                       
            }

            function renderProductHeader(fields) {
                return '<div class="colleague-info">' +
                        '<p>' +
                        
                        documentToHtmlString(fields.background) +
                        
                        '</p>' +
                        
                        '</div>'
            }

            function renderImage(image) {
                if (image && image.fields.file) {
                    return '<a href="product/' + 'slug' + '">' +
                            '<img src="' + image.fields.file.url + '" width="150" height="150" />' +
                            '</a>'
                } else {
                    return ''
                }
            }

        </script>    
    </body>
</html>
