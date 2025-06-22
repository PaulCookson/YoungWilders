
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
            <p>Youth-led nature recovery in the UK. </p>
             <a type="button" class="btn btn-primary" href="projects.jsp">List View</a>
           <a type="button" class="btn btn-primary" href="projectmap.jsp">Map View</a>
                    <p>
                        We accelerate UK nature recovery and centre young people in the process and the movement.
                        
                    </p>
                    <p>
                        In the next three years, we want every young person in England and Wales within an hour of a youth-led nature recovery project.
                    </p>
            
        </div>
        <div class="col-md-6">
            <div id="map"></div>
            
        </div>
      </div>
            
            
        </div>    
        
       
        

        
        <!-- prettier-ignore -->
        <script>(g => {
                var h, a, k, p = "The Google Maps JavaScript API", c = "google", l = "importLibrary", q = "__ib__", m = document, b = window;
                b = b[c] || (b[c] = {});
                var d = b.maps || (b.maps = {}), r = new Set, e = new URLSearchParams, u = () => h || (h = new Promise(async(f, n) => {
                        await (a = m.createElement("script"));
                        e.set("libraries", [...r] + "");
                        for (k in g)
                            e.set(k.replace(/[A-Z]/g, t => "_" + t[0].toLowerCase()), g[k]);
                        e.set("callback", c + ".maps." + q);
                        a.src = `https://maps.googleapis.com/maps/api/js?` + e;
                        d[q] = f;
                        a.onerror = () => h = n(Error(p + " could not load."));
                        a.nonce = m.querySelector("script[nonce]")?.nonce || "";
                        m.head.append(a)
                    }));
                d[l] ? console.warn(p + " only loads once. Ignoring:", g) : d[l] = (f, ...n) => r.add(f) && u().then(() => d[l](f, ...n))
            })
                    ({key: "AIzaSyBxol2BCz3gtSPa1Ig5Zs0sx23kmq2Qfnw", v: "weekly"});</script>

 <script>
        // Initialize and add the map
                initMap();
        let map;
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
            
          



        async function initMap() {
            // The location of Uluru
            const position = {lat: 52.9962192, lng: -1.133586};
            
            // Request needed libraries.
            //@ts-ignore
            const {Map} = await google.maps.importLibrary("maps");
            const {AdvancedMarkerElement} = await google.maps.importLibrary("marker");

            // The map, centered at Uluru
            map = new Map(document.getElementById("map"), {
                zoom: 4,
                center: position,
                mapId: "DEMO_MAP_ID",
            });

           

            


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
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
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
                        infowindow.setContent(data[i].Popup);
                        infowindow.open(Map, marker);
                    }
                })(marker, i));
            }
        


        }



        function csvToArr(stringValue) {
            const formattedString = stringValue.trim().replace('\r','').split('\n');
            
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
                        infowindow.setContent(locations[i].Popup);
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
    
    
            <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
       
    </body>
</html>
