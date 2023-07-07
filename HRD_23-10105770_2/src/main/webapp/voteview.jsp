<%@page import="java.time.LocalDate"%>
<%@page import="org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation"%>
<%@page import="controller.Dao"%>
<%@page import="controller.Dto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<div style="height: 600px;">
		<center>
			<h3>투표검수조회</h3>
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<th>성명</th>
					<th>생년월일</th>
					<th>나이</th>
					<th>성별</th>
					<th>후보번호</th>
					<th>투표시간</th>
					<th>유권자확인</th>
				</tr>
				<% 
					List<Dto> dtoList = new Dao().getVoteList();
					for ( Dto dto : dtoList ){
						int nowyear = LocalDate.now().getYear();
						int year = Integer.parseInt("19"+dto.getBirthYear());
						String age = "만 "+(nowyear-year)+"세";
					%>
						<tr>
							<th><%=dto.getV_name() %></th>
							<th><%=dto.getBirthday() %></th>
							<th><%=age %></th>
							<th><%=dto.getGender() %></th>
							<th><%=dto.getM_no() %></th>
							<th><%=dto.getV_time()%></th>
							<th><%=dto.getV_confirm() %></th>
						</tr>
					<%
					}
				%>
			</table>
		</center>
	</div>
	
	<%@include file="footer.jsp" %>
</body>
</html>