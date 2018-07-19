<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Portfolio Item - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="/watchout/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/watchout/css/portfolio-item.css" rel="stylesheet">
<link href="/watchout/css/custom.css"
	rel="stylesheet">

</head>

<body>
	<%
	//1. 로긴을 한 상태(session), 2. 로긴을 안한 상태(x)
	String memID = null;
	if(session.getAttribute("memID") != null){
		memID = (String) session.getAttribute("memID");
	}
	
	//2. 쿠키확인
	String cookieID = null;
	Cookie[] cookies = request.getCookies();
	
	
	for(Cookie c : cookies){
		System.out.println("쿠키아이디 : " +c.getValue());
		if(c.getName().equals("cookieID")){
			//엘레멘트 찾아서 넣어주면 됨.
			cookieID = c.getValue();
		
		}
	}
	
	 
	    String clientId = "3RQYZZs6B4Oon5wvv22N";//애플리케이션 클라이언트 아이디값";
	    String redirectURI = URLEncoder.encode("http://localhost:8000/watchout/callback.jsp", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    
	    session.setAttribute("state", state);
	 
	  
	
%>


	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/watchout/main.jsp">Watch Out Records!!</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item "><a class="nav-link" href="/watchout/main.jsp">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/watchout/news/news.jsp">News</a></li>
					<li class="nav-item"><a class="nav-link" href="/watchout/album/album.jsp">Album</a></li>
					<li class="nav-item"><a class="nav-link" href="/watchout/video/video.jsp">Video</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/watchout/board/board.jsp">Community</a></li>
			<%
				if (memID == null) {
			%>
					<ul class="navbar-nav ml-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown">Account</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/watchout/member/login.jsp">Log in</a>
								<a class="dropdown-item" href="/watchout/member/signin.jsp">Sign in</a>
							</div></li>
					</ul>
			<%
				} else {
			%>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown">Account</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/watchout/member/info.jsp">Information</a> <a
							class="dropdown-item" href="/watchout/member/logoutAction.jsp">Log-out</a>
					</div></li>
			</ul>
			<%
				}
			%>
				</ul>
			</div>
		</div>
	</nav>
			
			<br>
	<div class="container"> <!--  container-fluid -->
	<div class="row"> <!-- 12칸 분할됨. -->
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<form action="/watchout/member/loginAction.jsp" method="post">
				<h1 style="text-align:center">login</h1>
				<br>
				<%
					if(cookieID != null){
				%>
				<input id="id" value="<%=cookieID %>" class="form-control" type="text" name="memID" placeholder="Your id" maxlength="20" required autofocus>
				<%
					}else{
				%>
					<input id="id" class="form-control" type="text" name="memID" placeholder="Your id" max	length="20" required autofocus>
				<%
					}
				%>
				
				<input class="form-control" type="password" name="memPW" placeholder="Your password" maxlength="20" required>
			
				<button class="btn btn-primary float-right" type="submit">Login</button>
				<a href="<%=apiURL%>"><img height="37" src="http://static.nid.naver.com/oauth/small_g_in.PNG" style="float:right"></a>
				<input type="checkbox" name="saveID" value="on">save my ID
			
			</form>
		</div>
		
		
		<div class="col-lg-2"></div>
	
	</div>
</div>


	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2018</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="/watchout/vendor/jquery/jquery.min.js"></script>
	<script src="/watchout/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>

</html>
