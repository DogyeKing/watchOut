<%@page import="java.io.PrintWriter"%>
<%@page import="board.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

</head>
<body>

<!-- google jquery file -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/watchout/js/bootstrap.js"></script>

<%  //1. 로그인을 한 상태(session), 2. 로그인을 안한 상태(x)
	String memID = null;
	if(session.getAttribute("memID") != null){
		//로그인을 한 상태!!
		memID = (String) session.getAttribute("memID");
	}
	
	if(memID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = '/watchout/member/login.jsp'");
		script.println("</script>");
	}
	
	int bdID = 0;
	if(request.getParameter("bdID") != null){
		bdID = Integer.parseInt(request.getParameter("bdID"));
	}
	
	BoardDAO boardDAO = new BoardDAO();
	Board board = boardDAO.getBoard(bdID);
	
	if(board == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('해당 글이 없습니다.')");
		script.println("location.href = '/watchout/board/board.jsp'");
		script.println("</script>");
	}
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


<br>

<div class="container">
	<div class="row"> <!-- 12개의 칼럼 -->
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<form action="/watchout/board/updateAction.jsp" method="post">
			<table class="table table-striped" style="border:1px solid #dddddd">
				<thead>
					<tr>
						<th>수정하기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<input type="text" class="form-control" value="<%=board.getBdTitle() %>" name="bdTitle" maxlength="50">
						</td>
					</tr>
					<tr>
						<td>
							<textarea class="form-control" name="bdContent" maxlength="2048" style="height:350px;"
							<%=board.getBdContent() %>></textarea>
						</td>
					</tr>
					
					<tr>
					<td>
						<input type="hidden" name="bdID" value="<%=bdID %>">
					</td>
					</tr>
					
					
				</tbody>
			</table>
			<button class="btn btn-primary float-right" type="submit">수정하기</button>
			</form>
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>

</body>
</html>