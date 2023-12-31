<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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

	<%@include file="header.jsp"  %>
	
	<%
		// 회원번호
		Dao dao = new Dao();
		int custno = dao.getLastNo()+1;
		
		// 오늘날짜
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String now = dateFormat.format(date);
	%>
	
	<center>
		<h3>홈쇼핑 회원 등록</h3>
		<form name="joinform" action="/HRD_practice1/practice/join" method="post">
			<table border="1">
				<tr>
					<td>회원번호(자동발생)</td>
					<td> <input name="custno" value="<%=custno%>" type="text" /> </td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td> <input name="custname" type="text" /> </td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td> <input name="phone" type="text" /> </td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td> <input name="address" type="text" /> </td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td> <input value="<%=now%>" name="joindate" type="text" /> </td>
				</tr>
				<tr>
					<td>고객등급 [A:VIP,B:일반,C:직원]</td>
					<td> <input name="grade" type="text" /> </td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td> <input name="city" type="text" /> </td>
				</tr>
				<tr>
					<td colspan="2">
						<center>
							<button type="button" onclick="memberjoin()" >등록</button>
							<a href="view.jsp"><button type="button">조회</button></a>
						</center>
					</td>
				</tr>
			</table>
		</form>
	</center>
	<%@include file="footer.jsp"  %>
	
	<script src="join.js" type="text/javascript"></script>
</body>
</html>