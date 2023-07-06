<%@page import="java.text.DecimalFormat"%>
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
		<h3>학생성적</h3>
		<table border="1" style="border-collapse: collapse; width: 700px;">
			<tr>
				<th>학년</th><th>반</th><th>번호</th><th>이름</th>
				<th>국어</th><th>수학</th><th>영어</th><th>역사</th>
				<th>합계</th><th>평균</th><th>순위</th>
			</tr>
			<%
				Dao dao = new Dao();
				ArrayList<Dto> dtoList = dao.getScoreList();
				double[] sumArray = { 0.0 , 0.0 , 0.0 , 0.0 , 0.0 , 0.0 };
				
				// 점수가 있는 학생 수
				int count = 0;
				
				for ( Dto dto : dtoList ){
					sumArray[0] += dto.getEkor();
					sumArray[1] += dto.getEmath();
					sumArray[2] += dto.getEeng();
					sumArray[3] += dto.getEhist();
					sumArray[4] += dto.getSum();
					sumArray[5] += dto.getAvg();
					
					// 점수가 있는 학생
					if ( dto.getEkor() != 0 ){ 
						count++; 
						%>
						<tr>
							<th><%=dto.getSno1()%></th><th><%=dto.getSno2()%></th>
							<th><%=dto.getSno3()%></th><th><%=dto.getSname()%></th>
							<th><%=dto.getEkor()%></th><th><%=dto.getEmath()%></th>
							<th><%=dto.getEeng()%></th><th><%=dto.getEhist()%></th>
							<th><%=dto.getSum()%></th><th><%=dto.getAvg()%></th><th><%=dto.getRank()%></th>
						</tr>
						<%
					}else{
						%>
						<tr>
							<th><%=dto.getSno1()%></th><th><%=dto.getSno2()%></th>
							<th><%=dto.getSno3()%></th><th><%=dto.getSname()%></th>
							<th> </th><th> </th>
							<th> </th><th> </th>
							<th> </th><th> </th><th> </th>
						</tr>
						<%
					}
				
				}
			%>
			<tr>
				<th colspan="4">총 합</th>
				<%
					DecimalFormat df = new DecimalFormat("#.#");
					for ( int i = 0 ; i < 6; i++ ){
					%>
					<th><%=df.format(sumArray[i])%></th>
					<%
				} %><th></th>
			</tr>
			<tr>
				<th colspan="4">총 평균</th>
				<% for ( int i = 0 ; i < 6; i++ ){
					%>
					<th><%=df.format(sumArray[i]/count)%></th>
					<%
				} %><th></th>
			</tr>
		</table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>