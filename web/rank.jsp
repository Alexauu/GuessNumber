<%@ page import="Database.Data" %>

<%@ page import="Database.Player" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>排行榜</title>
</head>
<body>
    <%
        int right_answer = (int) application.getAttribute("right_answer");
        String result = (String) application.getAttribute("result");
        String player_name = (String) application.getAttribute("player");
    %>
<div align="center">
    <h4><%=player_name%>,<%=result%>正确答案是：<%=right_answer%>。</h4>
    <div style="letter-spacing:10px;">
        <input type="submit" value="继续游戏" onclick="window.location='init.jsp'">
        <input type="submit" value="注销" onclick="window.location='login.jsp'" >
    </div>
<h1>排行榜</h1>
<table width="300px" border="1px" rules="all">
    <tr align="center">
        <td>玩家</td>
        <td>游戏次数</td>
        <td>答对次数</td>
        <td>胜率（%）</td>
    </tr>
    <% List<Player> players = Data.getPlayers();
        for (Player player : players) {%>
    <tr align="center">
        <td><%=player.getName()%></td>
        <td><%=player.getCount_game()%></td>
        <td><%=player.getCount_win()%></td>
        <td><%=player.getRate_win()*100%></td>
    </tr>
    <%}%>

</table>
</div>
</body>
</html>
