
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id='home'>
        
        <div class="container">
            <div class="row">
        
          <%@include  file="includes/leftnav.jsp" %>
        
        <div id="centre-content" class="col-lg-4 content-first">
            <div id="content">
                    
                    </div>
            
            
        </div>
        <div id='right-content' class="col-lg-6">
            <img class="image-first" src="assets/1.jpg">
            <img class="image-second" src="assets/2.jpg">
            <img class="image-third" src="assets/3.png">
            <img class="image-forth" src="assets/4.png">
            <img class="image-fifth" src="assets/5.png">
            <div style="width:200px;display:inline">
                <img class="image-sixth" src="assets/8.png">
            <img class="image-seventh" src="assets/7.png">
            </div>
            
            <img class="image-eighth" src="assets/6.png">
            
            
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
         <script>
            
            
            
            
            
            var contentfulClient;
            $(document).ready()
            {


                contentfulClient = contentful.createClient({
                    accessToken: 'ytygcE-zI6VEYycBoRzvYvtXW_VcXAYfldZSnmDFNhs',
                    space: 'y0hkcnou78kd'
                });

                renderID(contentfulClient, '5H6xbZFo4zJXfhmTIEeyLL',$('#content'), basicRenderer);
                


            }


        </script>    
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
        
    </body>
</html>
