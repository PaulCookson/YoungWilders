
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="vacancy">
        
        <div class="container">
            <div class="row">
        
          <%@include  file="includes/leftnav.jsp" %>
        
        <div id="centre-content" class="col-md-4 content-first">
            <p>Youngwilders is a small but growing team, any job opportunities will be posted on this page. We are always interested in hearing from young people looking to enter the sector and are very happy to chat about future careers. 
                <br><br>
                Please feel free to get in touch here <br><br></p>
                    
            <a type="button" class="btn btn-general" href="vacancies.jsp">Visual Lead</a>
           <a type="button" class="btn btn-general" href="vacancies.jsp?type=wild%20steward">Wild Stewards</a>
        </div>
        <div id="right-content" class="col-md-6">
            <c:choose>
                <c:when test="${not empty param.type }">
                    <p>
                        The Wild Stewards programme places young people into paid, key decision-making roles in active nature recovery projects for one year. Wild Stewards receive seminar and training opportunities as well as operational support, informal mentorship, and regular in-person meet ups.
                    </p>
                    <div>
            <div style="background-color: white;width:260px;height:430px;margin-left:30px">
            
                WILD STEWARDS JOB DESCRIPTION
            </div>
                <p>PDF</p>
            </div>
                    
                </c:when>
                <c:otherwise>
                    
            <p>
                Youngwilders are looking for a Visual Lead to document and share the progress of our youth-led nature recovery projects across England and Wales, and to produce content to engage and empower young people in relation to nature recovery.
                <br><br>
                HOW TO APPLY<br><br>
                To apply for this role please email Noah - noah@youngwilders.uk with a short covering letter (less than one page) explaining why you think you would be a good fit for Youngwilders, and with a link to your portfolio of work. 
 <br><br>
The deadline for applications is the 14th January, and we will be inviting candidates for interviews in the following two weeks. If you have any questions at all please do get in touch. 
<br>
                
            </p>
                  <div>
            <div style="background-color: white;width:260px;height:430px;margin-left:30px">
            
                VISUAL LEAD JOB DESCRIPTION
            </div>
                <p>VIEW PDF</p>
            </div>  
                </c:otherwise>
            </c:choose>
            
            
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
        
        
    </body>
</html>
