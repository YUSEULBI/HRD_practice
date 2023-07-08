<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	<center>
		<h2>검사결과조회</h2>
		<table border="1" style="border-collapse: collapse; width: 900px;">
			<tr>
				<th>환자번호</th>
				<th>환자명</th>
				<th>검사명</th>
				<th>검사시작일</th>
				<th>검사상태</th>
				<th>검사완료일</th>
				<th>검사결과</th>
			</tr>
			<%
				List<Dto> dtoList = new Dao().getTesttList();
				for ( Dto dto : dtoList ){
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:ss:mm");
					Date sdate = df.parse( dto.getT_sdate() ); 
					Date ldate = df.parse( dto.getT_ldate() );
					SimpleDateFormat ndf = new SimpleDateFormat("yyyy-MM-dd");
					String ssdate = ndf.format(sdate);
					String sldate = ndf.format(ldate);
				%>
					<tr>
						<th><%=dto.getP_no() %></th>
						<th><%=dto.getP_name() %></th>
						<th><%=dto.getT_name() %></th>
						<th><%=ssdate %></th>
						<th><%=dto.getT_status() %></th>
						<th><%=sldate %></th>
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