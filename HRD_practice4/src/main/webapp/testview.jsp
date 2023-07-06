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
		<h3>검사결과조회</h3>
		<table border="1" style="border-collapse: collapse; width: 700px;">
			<tr>
				<th>환자번호</th><th>환자명</th>
				<th>검사명</th><th>검사시작일</th>
				<th>검사상태</th><th>검사완료일</th>
				<th>검사결과</th>
			</tr>
			<%
				Dao dao = new Dao();
				List<Dto> dtoList =  dao.getResultList();
				for( Dto dto : dtoList ){
				%>
				<tr>
					<th><%=dto.getP_no() %></th><th><%=dto.getP_name() %></th>
					<th><%=dto.getT_name() %></th><th><%=dto.getT_sdate().split(" ")[0] %></th>
					<th><%=dto.getT_status() %></th><th><%=dto.getT_ldate().split(" ")[0] %></th>
					<th><%=dto.getT_result() %></th>
				</tr>
				<%
				}
			%>
		</table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>