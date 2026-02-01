
<%
    HttpServletResponse httpResponse = (HttpServletResponse) response;
    httpResponse.setHeader("Cache-Control", "public, max-age=1"); // HTTP 1.1
    
%>