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
			<h3>후보자등수</h3>
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>총투표건수</th>
				</tr>

			<%
				List<Dto> dtoList = new Dao().getRank();
				for ( Dto dto : dtoList ){
					%>
					<tr>
						<th><%=dto.getM_no() %></th>
						<th><%=dto.getM_name() %></th>
						<th><%=dto.getRank() %></th>
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