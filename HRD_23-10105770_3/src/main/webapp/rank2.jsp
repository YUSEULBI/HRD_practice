<%@page import="java.text.DecimalFormat"%>
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
		<h3>학생성적</h3>
		<table border="1" style="border-collapse: collapse; width: 700px;">
			<tr>
				<th>학년</th>
				<th>반</th>
				<th>번호</th>
				<th>이름</th>
				<th>국어</th>
				<th>수학</th>
				<th>영어</th>
				<th>역사</th>
				<th>합계</th>
				<th>평균</th>
				<th>순위</th>
			</tr>
			<%
				List<Dto> dtoList = new Dao().getRank2();
				Double sumArray[] = { 0.0 , 0.0 , 0.0 , 0.0 , 0.0 , 0.0 };
				int count = 0; 
				for ( Dto dto : dtoList ){
					if ( dto.getEkor()!= 0 ){
						count++;
						sumArray[0] +=  dto.getEkor();
						sumArray[1] +=  dto.getEmath();
						sumArray[2] +=  dto.getEeng();
						sumArray[3] +=  dto.getEhist();
						sumArray[4] +=  dto.getSum();
						sumArray[5] +=  dto.getAvg();
					%>
						<tr>
							<th><%=dto.getSgrade() %></th>
							<th><%=dto.getSclass() %></th>
							<th><%=dto.getSnumber() %></th>
							<th><%=dto.getSname() %></th>
							<th><%=dto.getEkor() %></th>
							<th><%=dto.getEmath() %></th>
							<th><%=dto.getEeng() %></th>
							<th><%=dto.getEhist() %></th>
							<th><%=dto.getSum() %></th>
							<th><%=dto.getAvg() %></th>
							<th><%=dto.getRank() %></th>
						</tr>
					<%
					}else{
					%>
					<tr>
						<th><%=dto.getSgrade() %></th>
						<th><%=dto.getSclass() %></th>
						<th><%=dto.getSnumber() %></th>
						<th><%=dto.getSname() %></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
					<%
					}
				}
				DecimalFormat df = new DecimalFormat("#.#");
			%>
			<tr>
				<th colspan="4">총합</th>
				<th><%=df.format(sumArray[0])%></th>
				<th><%=df.format(sumArray[1])%></th>
				<th><%=df.format(sumArray[2])%></th>
				<th><%=df.format(sumArray[3])%></th>
				<th><%=df.format(sumArray[4])%></th>
				<th><%=df.format(sumArray[5])%></th>
			</tr>
			<tr>
				<th colspan="4">총합</th>
				<th><%=sumArray[0]/count %></th>
				<th><%=sumArray[1]/count %></th>
				<th><%=sumArray[2]/count %></th>
				<th><%=sumArray[3]/count %></th>
				<th><%=sumArray[4]/count %></th>
				<th><%=sumArray[5]/count %></th>
			</tr>
		</table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>