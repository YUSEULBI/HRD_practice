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
				<th>학번</th>
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
				List<Dto> dtoList = new Dao().getRank();
				int count = 0;
				double sum[] = { 0 , 0 , 0 , 0 , 0 , 0 };
				
				for ( int i = 0 ; i < dtoList.size(); i++ ){
					Dto dto = dtoList.get(i);
					if ( dto.getEkor() != 0 ){
						sum[0] += dto.getEkor();	
						sum[1] += dto.getEmath();
						sum[2] += dto.getEeng();
						sum[3] += dto.getEhist();
						sum[4] += dto.getSum();
						sum[5] += dto.getAvg();
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
							<th><%=++count %></th>
						</tr>
					<%
					}
				}
				for ( int i = 0 ; i < dtoList.size(); i++ ){
					Dto dto = dtoList.get(i);
					if ( dto.getEkor() == 0 ){
						
					
					%>
						<tr>
							<th><%=dto.getSgrade() %></th>
							<th><%=dto.getSclass() %></th>
							<th><%=dto.getSnumber() %></th>
							<th><%=dto.getSname() %></th>
							<th> </th>
							<th> </th>
							<th> </th>
							<th> </th>
							<th> </th>
							<th> </th>
							<th> </th>
						</tr>
					<%
					}
				}
					DecimalFormat df = new DecimalFormat("#.#");
				%>
					<tr>
						<th colspan="4">총 합</th>
						<th><%=df.format(sum[0])  %></th>
						<th><%=df.format(sum[1])  %></th>
						<th><%=df.format(sum[2])  %></th>
						<th><%=df.format(sum[3])  %></th>
						<th><%=df.format(sum[4])  %></th>
						<th><%=df.format(sum[5])  %></th>
					</tr>
				<tr>
					<th colspan="4">총 평균</th>
					<th><%=df.format(sum[0]/count) %></th>
					<th><%=df.format(sum[1]/count) %></th>
					<th><%=df.format(sum[2]/count) %></th>
					<th><%=df.format(sum[3]/count) %></th>
					<th><%=df.format(sum[4]/count) %></th>
					<th><%=df.format(sum[5]/count) %></th>
				</tr>
		</table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>