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
		<h1>성적입력</h1>
		<form name="addForm" action="/HRD_23-10105770_3/score/add" method="post">
			<table border="1" style="border-collapse: collapse; width: 500px;">
				<tr>
					<th>학번</th>
					<th><input name="sno" type="text" /></th>
				</tr>
				<tr>
					<th>국어점수</th>
					<th><input name="ekor" type="text" /></th>
				</tr>
				<tr>
					<th>수학점수</th>
					<th><input name="emath" type="text" /></th>
				</tr>
				<tr>
					<th>영어점수</th>
					<th><input name="eeng" type="text" /></th>
				</tr>
				<tr>
					<th>역사점수</th>
					<th><input name="ehist" type="text" /></th>
				</tr>
				<tr>
					<th colspan="2"><button type="button" onclick="socreAdd()">등록하기</button></th>
				</tr>
			</table>
		</form>
	</center>
	<%@include file="footer.jsp" %>
	<script src="index.js" type="text/javascript"></script>
</body>
</html>