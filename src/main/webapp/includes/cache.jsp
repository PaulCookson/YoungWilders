
<%
    HttpServletResponse httpResponse = (HttpServletResponse) response;
    httpResponse.setHeader("Cache-Control", "public, max-age=10"); // HTTP 1.1
    
%>