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
	<center style="height: 700px;">
		<h2>환자조회</h2>
		<table border="1" style="border-collapse: collapse; width: 700px;">
			<tr>
				<th>환자번호</th>
				<th>환자성명</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>지역</th>
			</tr>
			<%
				List<Dto> dtoList = new Dao().getPatient();
				for ( Dto dto : dtoList ){
				%>
					<tr>
						<th><%=dto.getP_no() %></th>
						<th><%=dto.getP_name() %></th>
						<th><%=dto.getP_birth() %></th>
						<th><%=dto.getP_gender() %></th>
						<th><%=dto.getP_tel() %></th>
						<th><%=dto.getP_city() %></th>
					</tr>	
				<%
				}
			%>
		</table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>