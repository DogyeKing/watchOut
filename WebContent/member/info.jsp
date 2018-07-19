<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.io.PrintWriter"%>
<%@page import="member.Member"%>
<%@page import="member.MemberDAO"%>
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
   //session받기   
   String memID = null; //전역변수로 지정
   if(session.getAttribute("memID") != null){
      memID = (String)session.getAttribute("memID");
   }
   
   if(memID == null){
	   	PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = '/BBS/login.jsp'");
		script.println("</script>");
   }
   //MemberDAO객체 생성   
   MemberDAO memberDAO = new MemberDAO();
   
   //select함수 만들어서 호출(매개변수 : memID)
   Member member = memberDAO.select(memID);
   
      
   //결과를 Member type으로 받아서 아래에 input tag에 뿌려주기
   
   
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
					</li>
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
							class="dropdown-item" href="//member/logoutAction.jsp">Log-out</a>
					</div></li>
			</ul>
			<%
				}
			%>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
<div class="container"><!-- container-fluid -->
   <div class="row"> <!-- 12칸 분할 -->
      <div class="col-lg-2"></div>
      <div class="col-lg-8">
         <br>
         <br>
            <h1 style="text-align:center">Member information</h1>
            <input class="form-control" type="text" name="memID" value="<%=memID %>"> 
            <input class="form-control" type="text" name="memName" value=<%=member.getMemName() %>>
            <input class="form-control" type="text" name="memGender" value=<%=member.getMemGender() %>>
            <input class="form-control" type="text" name="memEmail" value=<%=member.getMemEmail() %>>
            <!-- 해당버튼이 클릭되면 main.jsp -->
            <a class="btn btn-primary btn-block" href="/watchout/main.jsp">Back</a>            
         
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
