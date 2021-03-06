<%@page import="board.Board"%>
<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="board" class="board.Board" scope="page"></jsp:useBean>

<!-- 
	useBean은 (1) page import="board.Board"
		  	 (2) Board board = new Board();
		  	 (3) scope를 결정해줌
 -->
<jsp:setProperty name="board" property="bdTitle" />
<jsp:setProperty name="board" property="bdContent" />

<!-- 
	setProperty은 (1) Board클래스에 set함수를 호출해줌.
				 (2) Board클래스에 변수를 property에 적어주면 됨.
				 (3) 무엇을? request로 넘어오는 name값을!!
		board.setBdTitle(request.getParameter("bdTitle"));		 
 -->

<!-- memPW SHA1, MD5 로 DB저장 시켜야함. -->
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Write Action</title>
</head>
<body>

<%
	String memID = null;
	if(session.getAttribute("memID") != null){
		//로그인이 되어있다.
		memID = (String) session.getAttribute("memID");
	}
	
	if(memID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = '/watchout/member/login.jsp'");
		script.println("</script>");
	}else{
		//board 객체에 어떤 데이터가 담겨있나?
		board.setMemID(memID);
		if(board.getBdTitle() == null || board.getBdContent() == null || board.getBdTitle().equals("") || board.getBdContent().equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력되지 않은 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			System.out.println("IP주소 :" + request.getRemoteAddr());
			String getIP = "";
			if(request.getRemoteAddr().equals("192.168.0.1") || request.getRemoteAddr().equals("127.0.0.1")){
				getIP = InetAddress.getLocalHost().getHostAddress();
			}else{
				getIP = request.getRemoteAddr();
			}
			
			board.setBdIP(getIP);
			BoardDAO boardDao = new BoardDAO();
			//write함수 호출 int result값만 받으면 됨.
			int result = boardDao.write(board);
			//1은 정상, -2은 DB오류
			if(result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
		
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글이 입력되었습니다.')");
				script.println("location.href = '/watchout/board/board.jsp'");
				script.println("</script>");
			}
		}
	}
	
%>

</body>
</html>