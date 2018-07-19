<%@page import="java.io.PrintWriter"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.Member" scope="page" />
<jsp:setProperty property="memID" name="member"/>
<jsp:setProperty property="memPW" name="member"/>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Portfolio Item - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="/watchout/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/watchout/css/portfolio-item.css" rel="stylesheet">

</head>

<body>
	<%
		//web.xml session 검색 30분
		session.invalidate(); //세션 무효화
	%>
	<script>
		location.href = '/watchout/main.jsp';
	</script>

</body>

</html>
