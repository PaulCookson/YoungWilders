<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>

        <!-- Include Handlebars from a CDN -->


    </head>
    <body id="scrap">
        
        <script id="imageleft" type="text/>x-handlebars-template">
            <div class="row scrapentry draggable">
                <div class="col-6">{{{renderImages mainMedia}}} </div>
                <div class="col-6">{{{renderHtml mainContent}}}</div>
            </div>
        </script> 
        <script id="imageright" type="text/>x-handlebars-template">
            <div class="row scrapentry draggable" >
                <div class="col-6">{{{renderHtml mainContent}}}</div>
                <div class="col-6">{{{renderImages mainMedia}}} </div>
            </div>
         </script> 
         <script id="fullwidth" type="text/>x-handlebars-template">
            <div class="row scrapentry draggable">        
                <div class="col-12">{{{renderHtml mainContent}}}</div>

            </div>
       </script>     
        <script id="halfwidth" type="text/>x-handlebars-template">
            <div class="row scrapentry draggable    " >
                <div class="col-6">{{{renderHtml mainContent}}}</div>
                <div class="col-6">{{{renderImages mainMedia}}}</div>
            </div>
        </script>       
        
    <%@include  file="includes/google.jsp" %> 
     <%@include  file="includes/container.jsp" %>
        <div class="row">

            <%@include  file="includes/leftnav.jsp" %>
                <%--
                <div id="centre-content" class="col-lg-4 content-first">
                    <div id="content">
                    
                    </div>
                        
                </div>
                --%>
                 <div id="right-content" class="col-lg-10" >

                
                </div>
                
               
            </div>


    </div>    
    <script>

        //window.addEventListener("load", pageFullyLoaded, false);



        var projects;


        var container;
        var PRODUCT_CONTENT_TYPE_ID;
        var contentfulClient;
        let map;

        function image(node)
        {
            if (node.data.target.fields.file.contentType === "image/png")
                return '<img alt="a" class="img-fluid embedded" src="' + node.data.target.fields.file.url + '"/>';
            else if(node.data.target.fields.file.contentType === "application/vnd.openxmlformats-officedocument.wordprocessingml.document")
                return '<a data-testid="linkElement" href="' + node.data.target.fields.file.url + '" target="_blank" class="worddoc"><i class="bi bi-file-word  fs-10"></i></a>';
            return '<img alt="a" class="img-fluid" src="' + node.data.target.fields.file.url + '"/>';
        }
        function completed()
        {
            $("#right-content div.draggable").draggable();
        }
        $(document).ready()
        {


            contentfulClient = getClient(contentful);

            PRODUCT_CONTENT_TYPE_ID = 'scrapbook';


            let options = {
                renderNode: {
                    'embedded-asset-block': (node) =>
                        image(node)


                }
            }
            Handlebars.registerHelper('renderHtml', function (value) {
                return  basicFieldRenderer(value, options);
            });
            Handlebars.registerHelper('renderImages', function (value) {

                if (value && value.map)
                    images = value.map(renderImage).join('<br>');
                return images;
            });





            renderContent(contentfulClient, $("#right-content"), PRODUCT_CONTENT_TYPE_ID, null, null, null, renderScrap, completed)
            //renderID(contentfulClient, '74IVrpw1ZyaXW9QmJ5DgtC',$('#content'), null);



        }

        function renderSingle(data)
        {
            var format = data.fields.contentStyle;

            var html = document.getElementById(format).innerHTML;

            var template = window.Handlebars.compile(html);


            var compiledData = template(data.fields);

            return compiledData;


        }


        function renderScrap(data)
        {


            return data.map(renderSingle).join('<hr>');






        <%--$.get(<c:url value="'js/templates/scrapbook_1.html'"/>, function (data) {
                    
            $("full_content").html(template(data));
        }, 'html');--%>


        }

    </script>    


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Core theme JS-->



</body>
</html>
