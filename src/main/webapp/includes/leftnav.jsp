<style>
    @media (min-width: 900px) 
    {
        .navbar-collapse 
        {     position: absolute;     width: 100%;     top: 100%; }

    }
    
</style>    
<%--            Then, I add the other following code in the CSS in desktop viewport 992px and up .navbar-collapse {         position: relative;     }
    --%>
<!-- Sidenav -->
<div id="menu" class="col-lg-2" >  
<nav class="sticky-top navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    
        <div class="navbar-nav">
            <div class="row" >

	    <div class="list-group yw_menu">
                    <a class="btn btn-first" href="projectmap">Projects</a>
                    <a class="btn btn-second" href="programme">Programme</a>
                    <a class="btn btn-third" href="involved">Get Involved</a>
                    <a class="btn btn-forth" href="aboutus">About Us</a>
                    
                </div>
            
            <div id="second-menu" class="list-group yw_menu">
                
                
                    
                    <p>Opportunities</p>    
                    <p><a class="link-opacity-100" href="vacancies?type=other">Vacancies</a></p>
                    
                    
                    <p>Research & Reports</p>
                    <p><a class="link-opacity-100" href="annualreport">Annual reports</a></p>
                    <p><a class="link-opacity-100" href="scrapbook">Scrapbook</a></p>
                    <p><a class="link-opacity-100" href="donate">DONATE</a></p>
                    <%--<p><a class="link-opacity-100" href="enquiries">General Enquiries</a></p>--%>
                    <br>
                     
                     <br>
               <a data-testid="linkElement" href="https://www.instagram.com/youngwilders_/?hl=en" target="_blank">
                            <i class="bi bi-instagram" style="color:black"></i></a>
                            <br>
                
                     
                        
            </div>
                    <div style="" >
                    <a href="./index.jsp "><img style="width:80%;max-width:350px;margin-bottom:20px;" src='assets/logo.png' alt="logo"></a><br>
                    </div>
	    	    </div>
      </div>
    </div>
  </div>
</nav>
</div>