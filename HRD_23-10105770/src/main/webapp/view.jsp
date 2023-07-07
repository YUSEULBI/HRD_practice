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
		<h3>회원목록조회/수정</h3>
		<table border="1" style="border-collapse: collapse; width: 800px;">
			<tr>
				<th>회원번호</th><th>회원성명</th><th>전화번호</th>
				<th>주소</th><th>가입일자</th><th>고객등급</th><th>거주지역</th>
			</tr>
			<%
				List<Dto> dtoList = new Dao().getMemberList();
				for ( Dto dto : dtoList ){
				%>
					<tr>
						<th><a href="update.jsp?custno=<%=dto.getCustno()%>"><%=dto.getCustno()%></a></th>
						<th><%=dto.getCustname()%></th>
						<th><%=dto.getPhone()%></th>
						<th><%=dto.getAddress()%></th>
						<th><%=dto.getJoindate().split(" ")[0]%></th>
						<th><%=dto.getGrade()%></th>
						<th><%=dto.getCity()%></th>
					</tr>
				<%
				}
			%>
		</table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>