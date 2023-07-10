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
<body style="700px;">
	<%@include file="header.jsp" %>
	<center style="height: 700px;">
		<h2>(지역별)검사건수통계</h2>
		<table border="1" style="border-collapse: collapse; width: 700px;">
			<tr>
				<th>지역코드</th>
				<th>지역별</th>
				<th>검사건수</th>
			</tr>
			<%
				List<Dto> dtoList = new Dao().getCount();
				for ( Dto dto : dtoList ){
				%>
					<tr>
						<th><%=dto.getP_city() %></th>
						<th><%=dto.getP_city_name() %></th>
						<th><%=dto.getT_count() %></th>
					</tr>
				<%
				}
			%>
		</table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>