<%@page import="Controller.Dto"%>
<%@page import="java.util.List"%>
<%@page import="Controller.Dao"%>
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
		<h3>(지역별)검사건수통계</h3>
		<table border="1" style="border-collapse: collapse; width: 700px;">
			<tr>
				<th>지역코드</th><th>지역명</th><th>검사건수</th>
			</tr>
			<%
				Dao dao = new Dao();
				List<Dto> dtoList = dao.getStats();
				for ( Dto dto : dtoList ){
				%>
					<tr>
						<th><%=dto.getP_city()%></th><th><%=dto.getP_city_name()%></th><th><%=dto.getCount()%></th>
					</tr>
				<%
				}
			%>
		</table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>