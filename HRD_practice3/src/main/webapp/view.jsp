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
		<h3>학생목록</h3>
		<table border="1" style="border-collapse: collapse; width: 700px;">
			<tr>
				<th>학번</th><th>이름</th>
				<th>학년</th><th>반</th>
				<th>번호</th><th>성별</th>
				<th>전화번호</th><th>주소</th>
			</tr>
			<%
				Dao dao = new Dao();
				ArrayList<Dto> dtoList = dao.getStudentList();
				for ( Dto dto : dtoList ){
				%>
					<tr>
						<th><%=dto.getSno()%></th>
						<th><%=dto.getSname()%></th>
						<th><%=dto.getSno().charAt(0)%></th>
						<th><%=dto.getSno().substring(1,3)%></th>
						<th><%=dto.getSno().substring(3,5)%></th>
						<th><%=dto.getSgender()%></th>
						<th><%=dto.getSphone()%></th>
						<th><%=dto.getSaddress()%></th>
					</tr>
				<%
				}
			%>
		</table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>