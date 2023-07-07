<%@page import="controller.Dto"%>
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
		<form name="updateForm" action="/HRD_23-10105770/member/add" method="get">
			<table border="2" >
				<tr>
					<th>회원번호</th>
					<%
						int custno = Integer.parseInt(request.getParameter("custno"));
						Dto dto = new Dao().getMemberOne(custno);
					%>
					<th><input name="custno" type="text" value="<%=custno %>" /></th>
				</tr>
				<tr>
					<th>회원성명</th>
					<th><input name="custname" type="text" value="<%=dto.getCustname() %>" /></th>
				</tr>
				<tr>
					<th>회원전화</th>
					<th><input name="phone" type="text" value="<%=dto.getPhone() %>" /></th>
				</tr>
				<tr>
					<th>회원주소</th>
					<th><input name="address" type="text" value="<%=dto.getAddress() %>" /></th>
				</tr>
				<tr>
					<th>가입일자</th>
					<th><input name="joindate" type="text" value="<%=dto.getJoindate().split(" ")[0] %>" /></th>
				</tr>
				<tr>
					<th>고객등급(A:VIP,B:일반,C:직원)</th>
					<th><input name="grade" type="text" value="<%=dto.getGrade() %>" /></th>
				</tr>
				<tr>
					<th>도시코드</th>
					<th><input name="city" type="text" value="<%=dto.getCity() %>" /></th>
				</tr>
				<tr>
					<th colspan="2">
						<button type="button" onclick="upDateMember()">수정</button>
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