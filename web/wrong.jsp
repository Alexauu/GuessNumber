<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>答错啦~</title>
</head>
<body>
<script>
    alert("<%=request.getAttribute("wrong")%>");
    window.document.location.href="game.jsp";
</script>

</body>
</html>
