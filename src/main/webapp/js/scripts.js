/*!
* Start Bootstrap - Simple Sidebar v6.0.6 (https://startbootstrap.com/template/simple-sidebar)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-simple-sidebar/blob/master/LICENSE)
*/
// 
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});
function renderID(client,  id,container, renderer)
{
    
    client.getEntry(id)
            .then(function (entry) {
                console.log(entry);
                
                container.html(renderer(entry));
            });

}


function renderContent(client, contenttype, queryfield,queryvalue,order, renderer)
{
    
    const query = {};
    query.content_type=contenttype;
    
    if(order!=null)
    {
        query.order =  order;
    }
    if(queryfield!=null)
    {
        query['fields.' + queryfield] = queryvalue;
    }
    client.getEntries(
        query
        //content_type:contenttype
        //#'fields.colleagueType': '${empty param.colleagueType ? 'Core' : param.colleagueType}',
        //order: 'fields.ranking'
    )
            .then(function (entries) {
                console.log(entries);
                container.html(renderer(entries.items));
            })

}
function basicRenderer(entry)
{

    return documentToHtmlString(entry.fields.pageContent)

}
 function getClient(contentful)
 {
     return contentful.createClient({
                    accessToken: 'ytygcE-zI6VEYycBoRzvYvtXW_VcXAYfldZSnmDFNhs',
                    space: 'y0hkcnou78kd'
                });
     
 } 
