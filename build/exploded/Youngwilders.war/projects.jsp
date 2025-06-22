
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body>
        
        <div class="container">
            <div class="row">
        <div class="col-md-2">
          <%@include  file="includes/leftnav.jsp" %>
        </div>
        <div class="col-md-4 content-first">
            <p>We work with landowners. </p>
                    
            <a type="button" class="btn btn-primary" href="projects.jsp">List View</a>
           <a type="button" class="btn btn-primary" href="projectmap.jsp">Map View</a>
        </div>
        <div class="col-md-6">
            
            <div id="projects"></div>
        </div>
      </div>
            
            
        </div>    
     <script>
           function renderProjects(data)
            {
                return '<h1>Projects</h1>' +
                        '<div class="colleagues">' +
                        data.map(renderSingleProject).join('\n') +
                        '</div>'
                
            }
         function renderSingleProject(project) {
                var fields = project.fields
                console.log(fields)
                return '<div class="project">' +
                        '<div class="colleague-image">' +
                        renderImage(fields.shapeFile) +
                        '</div>' +
                        '<div class="colleague-details">' +
                        renderProjectDetails(fields) +
                        '</div>' +
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
         function renderProjectDetails(fields) {
                return  '<p>' + fields.projectName + '</p>' 
                       
            }
            var container;
            var PRODUCT_CONTENT_TYPE_ID;
            var contentfulClient;
            $(document).ready()
            {


                contentfulClient = contentful.createClient({
                    accessToken: 'ytygcE-zI6VEYycBoRzvYvtXW_VcXAYfldZSnmDFNhs',
                    space: 'y0hkcnou78kd'
                });

                PRODUCT_CONTENT_TYPE_ID = 'project';

                container = $('#projects'); 




                renderContent(contentfulClient, PRODUCT_CONTENT_TYPE_ID, null, null,null, renderProjects)


            }
            
          
        </script>    
            
   
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
        
    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
    
        
        
    </body>
</html>
