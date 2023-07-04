<%@page import="java.util.List"%>
<%@page import="controller.Dto"%>
<%@page import="java.util.ArrayList"%>
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
		<h3>후보조회</h3>
		<table border="1" style="border-collapse: collapse; width: 700px;">
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>
			</tr>
			<%
				Dao dao = new Dao();
				List<Dto> dtoList = dao.getList();
				for( Dto dto : dtoList ){
					String tel1 = dto.getP_tel1().split(" ")[0];
					String tel = tel1+"-"+dto.getP_tel2()+"-"+dto.getP_tel3();
					String jumin = dto.getM_jumin().substring(0,6)+"-"+dto.getM_jumin().substring(6, 13);
					%>
						<tr>
							<td><%=dto.getMno()%></td>
							<td><%=dto.getM_name()%></td>
							<td><%=dto.getP_name()%></td>
							<td><%=dto.getP_school()%></td>
							<td><%=jumin %></td>
							<td><%=dto.getM_city()%></td>
							<td><%=tel%></td>
						</tr>
					<%
				}
			%>
		</table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>