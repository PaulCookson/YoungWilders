
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="proj">

        <div class="container">
            <div class="row">

                <%@include  file="includes/leftnav.jsp" %>

                <div id="centre-content"  class="col-lg-4 content-first">
                    <div id="content">
                    
                    </div>
                    <div style="margin-left:30px;margin-top:30px">
                        <a type="button" class="btn btn-general" href="projects.jsp">List View</a>
                        <a type="button" class="btn btn-general" href="projectmap.jsp">Map View</a>

                    </div>  

                </div>
                <div id="right-content" class="col-lg-6">
                    <div id="map"></div>

                </div>
            </div>


        </div>    





        <!-- prettier-ignore -->
        <script></script>

        <script>
            // Initialize and add the map





            let map;
            var container;
            var PRODUCT_CONTENT_TYPE_ID;
            var contentfulClient;
            $(document).ready()
            {




            }





            async function initMap() {
                // The location of Uluru
                const position = {lat: 52.9962192, lng: -1.133586};

                // Request needed libraries.
                //@ts-ignore
                const {Map} = await google.maps.importLibrary("maps");
                const {AdvancedMarkerElement} = await google.maps.importLibrary("marker");

                // The map, centered at Uluru
                map = new Map(document.getElementById("map"), {
                    zoom: 5,
                    center: position,
                    mapId: "9ce55e254766827ef36bbc9f",
                });


                contentfulClient = contentful.createClient({
                    accessToken: 'ytygcE-zI6VEYycBoRzvYvtXW_VcXAYfldZSnmDFNhs',
                    space: 'y0hkcnou78kd'
                });

                PRODUCT_CONTENT_TYPE_ID = 'project';

                container = $('#projects');





                renderContent(contentfulClient, PRODUCT_CONTENT_TYPE_ID, null, null, null, renderProjects)

                renderID(contentfulClient, '74IVrpw1ZyaXW9QmJ5DgtC',$('#content'), renderer);


            }
            function renderer(entry)
            {

                return documentToHtmlString(entry.fields.pageContent)

            }

            function renderProjects(data)
            {

                // var locations = [
                //     ['Bondi Beach', -33.890542, 151.274856, 4],
                //     ['Coogee Beach', -33.923036, 151.259052, 5],
                //     ['Cronulla Beach', -34.028249, 151.157507, 3],
                //     ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
                //     ['Maroubra Beach', -33.950198, 151.259302, 1]
                // ];

                let mapOptions = {
                    center: new google.maps.LatLng(52.9962192, -1.13358),
                    zoom: 6,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    mapId: '9ce55e254766827ef36bbc9f'
                }

                // Moved this line up here
                this.map = new google.maps.Map(document.getElementById('map'), mapOptions); // changed the "native element" to a standard DOM element for the sake of this example

                var infowindow = new google.maps.InfoWindow();

                var marker, i;

                for (i = 0; i < data.length; i++) {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(data[i].fields.lattitude, data[i].fields.longitude),
                        map: this.map // You are using this.map here so it needs to be created before
                    });

                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                        return function () {
                            infowindow.setContent(documentToHtmlString(data[i].fields.popUp));
                            infowindow.open(Map, marker);
                        }
                    })(marker, i));
                }



            }



            function csvToArr(stringValue) {
                const formattedString = stringValue.trim().replace('\r', '').split('\n');

                const [keys, ...rest] = stringValue.trim().split('\n').map((item) => item.split(','));


                console.log('CSV keys: ', keys);
                console.log('CSV values: ', rest);

                const formedArr = rest.map((item) => {
                    const object = {};
                    keys.forEach((key, index) => (object[key] = item.at(index)));
                    return object;
                });

                return formedArr;


            }


            function doSomethingWithData(data) {




                var locations = csvToArr(data);



                // var locations = [
                //     ['Bondi Beach', -33.890542, 151.274856, 4],
                //     ['Coogee Beach', -33.923036, 151.259052, 5],
                //     ['Cronulla Beach', -34.028249, 151.157507, 3],
                //     ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
                //     ['Maroubra Beach', -33.950198, 151.259302, 1]
                // ];

                let mapOptions = {
                    center: new google.maps.LatLng(52.9962192, -1.13358),
                    zoom: 8,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }

                // Moved this line up here
                this.map = new google.maps.Map(document.getElementById('map'), mapOptions); // changed the "native element" to a standard DOM element for the sake of this example

                var infowindow = new google.maps.InfoWindow();

                var marker, i;

                for (i = 0; i < locations.length; i++) {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(locations[i].Lattitude, locations[i].Longitude),
                        map: this.map // You are using this.map here so it needs to be created before
                    });

                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                        return function () {
                            infowindow.setContent(documentToHtmlString(locations[i].popUp));
                            infowindow.open(Map, marker);
                        }
                    })(marker, i));
                }
            }




            function parseResult(result, table) {

                var resultArray = [];
                result.split(/(?:\r\n|\r|\n)/g).forEach(function (row) {
                    var rowArray = [];
                    var newRow = table.insertRow();
                    row.split(",").forEach(function (cell) {
                        var newCell = newRow.insertCell();
                        var newText = document.createTextNode(cell);
                        newCell.appendChild(newText);
                        //    rowArray.push(cell);

                    });
                    //resultArray.push(rowArray);
                    //alert(rowArray);
                });
                //return resultArray;
            }



        </script>  
        <script async
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBxol2BCz3gtSPa1Ig5Zs0sx23kmq2Qfnw&loading=async&callback=initMap">
        </script>


        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

    </body>
</html>
