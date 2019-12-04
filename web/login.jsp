<%@ page import="java.io.PrintWriter" %>
<%@ page import="Database.Data" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <form action="">
        <br><br><br>
        <div align="center">
            请输入用户名：<label>
            <input type="text" name="name">
        </label>
            <input type="submit" name="confirm" value="确认">
        </div>
    </form>
<%
    String name = request.getParameter("name");
    if (name != null) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        if ("".equals(name)) {
            writer.print("<script language='javascript'>alert('用户名不能为空。');window.location.href='login.jsp';</script>");
        } else if (Data.isExitPlayer(name)) {
            writer.print("<script language='javascript'>alert('用户名已经被其他用户使用。');window.location.href='login.jsp';</script>");
        } else {
            Data.addPlayer(name);
            application.setAttribute("player", name);
            application.setAttribute("random_number",(int)(Math.random()*10));
            application.setAttribute("count", 3);
            response.sendRedirect("game.jsp");
        }
    }
%>
</body>
</html>
