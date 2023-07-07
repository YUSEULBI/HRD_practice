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
	<center>
		<h3>회원매출조회</h3>
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
				List<Dto> dtoList = new Dao().getSales();
				for ( Dto dto : dtoList ){
					%>
						<tr>
							<th><%=dto.getCustno() %></th>
							<th><%=dto.getCustname() %></th>
							<th><%=dto.getGrade() %></th>
							<th><%=dto.getSum() %></th>
						</tr>
					<%
				}
			%>
		</table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>