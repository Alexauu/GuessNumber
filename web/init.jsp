<%@ page import="Database.Data" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%@ page language="java" %>
    <%
        application.setAttribute("random_number",(int)(Math.random()*10));
        application.setAttribute("count", 3);
        response.sendRedirect("game.jsp");
        Data.increaseTotal((String) application.getAttribute("player"));
    %>
</body>
</html>
