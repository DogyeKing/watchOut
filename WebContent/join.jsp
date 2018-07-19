
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.naver.search.Member"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.naver.search.ApiMemberPro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String access_token = (String)session.getAttribute("access_token");
   System.out.println("access_token : "+access_token);
   String memberPro = ApiMemberPro.getApiMember(access_token);
   
   JSONParser p = new JSONParser();
   JSONObject obj = (JSONObject)p.parse(memberPro);
   
    JSONObject data = (JSONObject)obj.get("response");
   Gson g = new Gson();
   //g.toJson
   Member m = g.fromJson(data.toString(), Member.class);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap file -->
<link rel="stylesheet" href="/BBS/css/bootstrap.css">
<link rel="stylesheet" href="/BBS/css/custom.css">


<!--  google jquery file -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/BBS/js/bootstrap.js"></script>

<title>Insert title here</title>
</head>
<body>
<%=m.getId() %><br>
<%=m.getName() %><br>
<%=m.getGender() %><br>
<%=m.getEmail() %><br>
<%=m.getBirthday() %><br>
</body>
</html>