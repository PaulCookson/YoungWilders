
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id='home'>
        <%@include  file="includes/google.jsp" %> 
         <%@include  file="includes/container.jsp" %>
            <div class="row">

                <%@include  file="includes/leftnav.jsp" %>

                <div id="centre-content" class="col-lg-4 content-first">
                    <div id="content">

                    </div>


                </div>
                <div id='right-content' class="col-lg-6">


                    <%--<img class="image-first" src="assets/1.jpg">
                    <img class="image-second" src="assets/2.jpg">
                    <img class="image-third" src="assets/3.png">
                    <img class="image-forth" src="assets/4.png">
                    <img class="image-fifth" src="assets/5.png">
                    <div style="width:200px;display:inline">
                        <img class="image-sixth" src="assets/8.png">
                    <img class="image-seventh" src="assets/7.png">
                    </div>
                    
                    <img class="image-eighth" src="assets/6.png">
                    --%>

                </div>
            </div>


        </div>    


        <script>





            var contentfulClient;
            $(document).ready()
            {
                addEventListener("resize", (event) => {
                 redrawSeeds();
                })
                addEventListener('load', (event) => {
                        redrawSeeds();
                });
                contentfulClient = getClient(contentful);

                renderID(contentfulClient, '5H6xbZFo4zJXfhmTIEeyLL', $('#content'), basicRenderer);


                renderContent(contentfulClient, $('#right-content'), "homepageImage", null, null, "fields.row,fields.column", renderImages, rendered);

                //renderAssets(contentfulClient, $('#right-content'), renderImages, rendered);





            }
            function redrawSeeds()
            {
                console.log("resize");
                var img = $('#right-content img');
                var position;

                if (img.length > 0)
                {
                    addSeed(1, 1, $(img[0]).offset(), 0, 0);
                }
                if (img.length > 1)
                {
                    addSeed(2, 2, $(img[1]).offset(), img[1].height - 10, 0);

                }
                if (img.length > 2)
                {
                    addSeed(3, 3, $(img[2]).offset(), 20, -20);
                    position = $(img[2]).offset();
                    //$('#right-content').append("<div id='seed3' class='seed' style='position:absolute;top:" + (position.top + 20) + "px;left:" + (position.left - 20) + "px'><img src='<c:url value="/assets/seeds/SEED"/>3.png'></div>");
                    addSeed(4, 4, $(img[2]).offset(), img[2].height + 20, 40);
                    addSeed(5, 5, $(img[2]).offset(), img[2].height + 30, 200);
                    //$('#right-content').append("<div id='seed4' class='seed' style='position:absolute;top:" + (position.top + img[2].height + 20) + "px;left:" + (position.left + 40) + "px'><img src='<c:url value="/assets/seeds/SEED"/>4.png'></div>");

                    //$('#right-content').append("<div id='seed5' class='seed' style='position:absolute;top:" + (position.top + img[2].height + 30) + "px;left:" + (position.left + 200) + "px'><img src='<c:url value="/assets/seeds/SEED"/>5.png'></div>");
                }
                if (img.length > 6)
                {
                    addSeed(6, 8, $(img[5]).offset(), 10,  img[5].width - 50);
                    //position = $(img[7]).offset();
                    //$('#right-content').append("<div id='seed6' class='seed' style='position:absolute;top:" + (position.top + 20) + "px;left:" + position.left + 100 + "px'><img src='<c:url value="/assets/seeds/SEED"/>7.png'></div>");
                }
                if (img.length > 5)
                {
                    addSeed(7, 7, $(img[4]).offset(), img[4].height + 10,  15);
                    //position = $(img[7]).offset();
                    //$('#right-content').append("<div id='seed6' class='seed' style='position:absolute;top:" + (position.top + 20) + "px;left:" + position.left + 100 + "px'><img src='<c:url value="/assets/seeds/SEED"/>7.png'></div>");
                }
                if (img.length > 4)
                {
                    addSeed(8, 4, $(img[6]).offset(), img[6].height-30,  -20,90);
                    //position = $(img[7]).offset();
                    //$('#right-content').append("<div id='seed6' class='seed' style='position:absolute;top:" + (position.top + 20) + "px;left:" + position.left + 100 + "px'><img src='<c:url value="/assets/seeds/SEED"/>7.png'></div>");
                }
            }
            function renderSingleImage(asset, index)
            {
                return '<div class="col homeimage  draggable col' + index + '">' + renderImage(asset, '') + '</div>';

            }

            function addSeed(index, imagenum, position, offsettop, offsetleft, rotate)
            {

                let css_property =
                        {
                            "position": "absolute",
                            "top": position.top + offsettop + "px",
                            "left": (position.left + offsetleft) + "px"
                            
                        }
                if(rotate)
                    css_property.rotate = rotate + "deg";
                if ($("#seed" + index).length == 0)
                {
                    $('#right-content').append("<div id='seed" + index + "' class='seed draggable' style='display:none'><img src='${pageContext.request.contextPath}/assets/seeds/SEED" + imagenum + ".png'></div>");
                }
                $("#seed" + index).css(css_property);

            }
            function rendered()
            {
                
                
                //$('#right-content').append("<div id='seedcontainer'></div>");
                


                redrawSeeds();
		$("#right-content div.draggable").draggable();
		$("#right-content div.seed").show();

            }
            function renderImages(assets)
            {
                //for each of the assets add to an array of images    
                rows = [];

                for (i = 0; i < assets.length; i++)
                {
                    asset = assets[i];


                    row = asset.fields.row;

                    if (rows.length < row) {
                        images = [];
                        rows.push(images);
                        rows[row - 1].push(asset);
                    } else
                        rows[row - 1].push(asset);
                    console.log(row);
                }

                var divs = '';
                for (i = 0; i < rows.length; i++)
                { //we need to check for columns
                    divs = divs + "<div class='container'><div class='row row" + i + "'>";

                    var multpleColImages = false;
                    var lastCol = 0;

                    var multipleimagesstart = false;
                    var multipleimagesend = false;
                    for (j = 0; j < rows[i].length; j++)
                    {
                        if (j + 1 < rows[i].length && rows[i][j].fields.column && rows[i][j + 1].fields.column === rows[i][j].fields.column)
                        {
                            //same column so add
                            multipleimagesstart = true;
                        } else if (rows[i][j].fields.column && j == rows[i].length - 1)
                        {
                            multipleimagesend = true;
                        }
                        divs = divs + (multipleimagesstart && !multipleimagesend ? "<div class='col homeimage  draggable col" + j + "'>" : "") + renderSingleImage(rows[i][j].fields.image, j)
                                + (multipleimagesend ? "</div>" : "")
                                ;



                    }
                    divs = divs + "</div></div>";

                }

                return divs;
                //return '<div>' + assets.map(renderSingleImage).join('') + '</div>';


            }

        </script>    


        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>


    </body>
</html>

