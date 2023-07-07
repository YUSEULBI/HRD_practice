<%@page import="controller.Dto"%>
<%@page import="java.util.List"%>
<%@page import="controller.Dao"%>
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
			<h3>후보조회</h3>
			<table border="1" style="border-collapse: collapse; width: 700px;">
				<tr>
					<th>후보번호</th><th>성명</th><th>소속정당</th>
					<th>학력</th><th>주민번호</th><th>지역구</th><th>대표전화</th>
				</tr>
				<% 
					List<Dto> dtoList = new Dao().getMemberList();
					for ( Dto dto : dtoList ){
					%>
						<tr>
							<th><%=dto.getM_no() %></th>
							<th><%=dto.getM_name() %></th>
							<th><%=dto.getP_name() %></th>
							<th><%=dto.getP_school() %></th>
							<th><%=dto.getM_jumin() %></th>
							<th><%=dto.getM_city() %></th>
							<th><%=dto.getP_tel().split(" ")[0]+dto.getP_tel().split(" ")[1] %></th>
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