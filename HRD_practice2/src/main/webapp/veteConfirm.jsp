<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
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
		<h3>투표검수조회</h3>
		<table border="1" style="border-collapse: collapse; width: 700px; text-align: center;">
			<tr>
				<th>성명</th><th>생년월일</th>
				<th>나이</th><th>성별</th>
				<th>후보자번호</th><th>투표시간</th>
				<th>유권자확인</th>
			</tr>
			<%
				Dao dao = new Dao();
				List<Dto> list = dao.getVoteConfirm();
				for( int i = 0 ; i < list.size(); i++ ){
					Dto dto = list.get(i);
					String year = "19"+dto.getV_jumin().substring(0,2);
					String month = dto.getV_jumin().substring(2,4);
					String date = dto.getV_jumin().substring(4,6);
					String birthDay = year+"년"+month+"월"+date+"일생";
					
					LocalDate birthDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(date));
					LocalDate currentDate = LocalDate.now();
					
					Period age = Period.between(birthDate, currentDate);
					int ageInYears = age.getYears();
					String ageString = "만 "+ageInYears+"세";
					String sex = dto.getV_jumin().substring(6,7);
					if ( dto.getV_jumin().substring(6,7).equals("1") ){
						sex = "남";
					}else if ( dto.getV_jumin().substring(6,7).equals("2") )
					{ sex = "여"; }
					
					String time = dto.getV_time().substring(0,2)+":"+dto.getV_time().substring(2,4);
					
					String confirm = dto.getV_confirm();
					if ( confirm.equals("Y")){ confirm = "확인"; }
					else if ( confirm.equals("N")){ confirm = "미확인"; }
				%>
					<tr>
						<th><%=dto.getV_name()%></th>
						<th><%=birthDay%></th>
						<th><%=ageString%></th>
						<th><%=sex%></th>
						<th><%=dto.getM_no()%></th>
						<th><%=time%></th>
						<th><%=confirm%></th>
					</tr>
				<%
				}
			%>
		</table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>