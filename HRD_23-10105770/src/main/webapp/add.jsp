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
		<h3>홈쇼핑 회원 등록</h3>
		<form name="addForm" action="/HRD_23-10105770/member/add" method="post">
			<table border="2" >
				<tr>
					<th>회원번호(자동발생)</th>
					<%
						Dao dao = new Dao();
						int custno = dao.getMemberLastNo();
					%>
					<th><input name="custno" type="text" value="<%=custno %>" /></th>
				</tr>
				<tr>
					<th>회원성명</th>
					<th><input name="custname" type="text" /></th>
				</tr>
				<tr>
					<th>회원전화</th>
					<th><input name="phone" type="text" /></th>
				</tr>
				<tr>
					<th>회원주소</th>
					<th><input name="address" type="text" /></th>
				</tr>
				<tr>
					<th>가입일자</th>
					<th><input name="joindate" type="text" /></th>
				</tr>
				<tr>
					<th>고객등급(A:VIP,B:일반,C:직원)</th>
					<th><input name="grade" type="text" /></th>
				</tr>
				<tr>
					<th>도시코드</th>
					<th><input name="city" type="text" /></th>
				</tr>
				<tr>
					<th colspan="2">
						<button type="button" onclick="addMember()">등록</button>
						<button type="button" onclick="viewmove()">조회</button>
					</th>
				</tr>
			</table>
		</form>
	</center>
	<%@include file="footer.jsp" %>
	<script src="index.js" type="text/javascript"></script>
</body>
</html>