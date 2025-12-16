/*!
 * Start Bootstrap - Simple Sidebar v6.0.6 (https://startbootstrap.com/template/simple-sidebar)
 * Copyright 2013-2023 Start Bootstrap
 * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-simple-sidebar/blob/master/LICENSE)
 */
// 
// Scripts
// 
var CACHELENGTH=100000;


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
function renderID(client, id, container, renderer)
{

    entry = getWithExpiry(id);

    if (entry)
        container.html(renderer(entry));
    else
    {

        client.getEntry(id)
                .then(function (entry) {
                    setWithExpiry(id, entry, CACHELENGTH);
                    container.html(renderer(entry));
                })
                .catch((error) => {
                    console.error(error);
                });
    }
}
function setWithExpiry(key, value, ttl) {
    const now = new Date()

    // `item` is an object which contains the original value
    // as well as the time when it's supposed to expire
    const item = {
        value: value,
        expiry: now.getTime() + ttl
    }
    localStorage.setItem(key, JSON.stringify(item))
}
function getWithExpiry(key) {
    const itemStr = localStorage.getItem(key)
    // if the item doesn't exist, return null
    if (!itemStr) {
        return null
    }
    const item = JSON.parse(itemStr)
    const now = new Date()
    // compare the expiry time of the item with the current time
    if (now.getTime() > item.expiry) {
        // If the item is expired, delete the item from storage
        // and return null
        localStorage.removeItem(key);
        return null;
    }
    return item.value;
}
function renderContent(client, container,contenttype, queryfield, queryvalue, order, renderer)
{

    const query = {};
    query.content_type = contenttype;

    if (order != null)
    {
        query.order = order;
    }
    if (queryfield != null)
    {
        query['fields.' + queryfield] = queryvalue;
    }
    entries = getWithExpiry(JSON.stringify(query));

    if (entries)
        container.html(renderer(entries.items));
    else
    {
        client.getEntries(
                query
                //content_type:contenttype
                //#'fields.colleagueType': '${empty param.colleagueType ? 'Core' : param.colleagueType}',
                //order: 'fields.ranking'
                )
                .then(function (entries) {
                    setWithExpiry(JSON.stringify(query), entries, CACHELENGTH);
                    container.html(renderer(entries.items));
                });
    }

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
function renderImage(image) {
    if (image && image.fields && image.fields.file) {
        return '<img src="' + image.fields.file.url + '"   />';

    } else {
        return '';
    }
}

function renderArray(list)
{

    return list.join("<br>");

}

function renderAssets(client, container, renderer)
{
    client.getAssets(
                {
                'metadata.tags.sys.id[all]': 'homeSection'
                
            })
                .then(function (entries) {
                    
                    
                    container.html(renderer(entries.items));
                    console.log(entries);
                })
                .catch(console.error);
    
    
}

            