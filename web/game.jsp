<%@ page import="Database.Data" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Game</title>
</head>

<body>
<%
int number = (int) application.getAttribute("random_number");
int count = (int) application.getAttribute("count");
%>
<div align="center">
    <h1>猜数字游戏</h1>
    <h4>随机数已生成</h4>
    <h4>你还剩<%=count%>次机会</h4>
    <h4>请输入你猜的数字：</h4>
    <form action="" method="post">
        <input type="text" name="answer"><br><br>
        <input type="submit" value="确认">
    </form>
</div>
<%
    String a = request.getParameter("answer");
    if (a != null) {
        application.setAttribute("count", --count);
        int answer = Integer.parseInt(a);
        if (answer == number || count == 0) {
            Data.sort();
            application.setAttribute("count", 3);
            application.setAttribute("random_number", (int)(Math.random()*10));
            application.setAttribute("result",answer == number?"恭喜你，答对啦！~":"很遗憾，答错啦！~");
            application.setAttribute("right_answer", number);
            if (answer == number){
                Data.increaseSuccess((String) application.getAttribute("player"));
            }
            response.sendRedirect("rank.jsp");
        } else if (answer < number) {
            request.setAttribute("wrong", "您猜的数字太小了,请再次尝试！");
            request.getRequestDispatcher("wrong.jsp").forward(request, response);
        } else {
            request.setAttribute("wrong", "您猜的数字太大了,请再次尝试！");
            request.getRequestDispatcher("wrong.jsp").forward(request, response);
        }
    }
%>
</body>

</html>
