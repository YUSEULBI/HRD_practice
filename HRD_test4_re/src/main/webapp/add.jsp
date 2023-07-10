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
	<center style="height: 700px;">
		<h2>검사결과입력</h2>
		<form name="addForm" action="/HRD_test4_re/add/test" method="post">
			<table border="1" style="border-collapse: collapse; width: 700px;">
				<tr>
					<th>환자번호</th>
					<th><input name="p_no" type="text" />예)1001</th>
				</tr>
				<tr>
					<th>검사코드</th>
					<th>
						<select name="t_code">
							<option value="">검사명</option>
							<option value="T001">[T001]결핵</option>
							<option value="T002">[T002]장티푸스</option>
							<option value="T003">[T003]수두</option>
							<option value="T004">[T004]홍역</option>
							<option value="T005">[T005]콜레라</option>
						</select>
					</th>
				</tr>
				<tr>
					<th>검사시작일자</th>
					<th><input name="t_sdate" type="text" />예)20200101</th>
				</tr>
				<tr>
					<th>검사상태</th>
					<th>
						<input name="t_status" value="1" type="radio" />검사중
						<input name="t_status" value="2" type="radio" />검사완료
					</th>
				</tr>
				<tr>
					<th>검사완료일자</th>
					<th><input name="t_ldate" type="text" />예)20200101</th>
				</tr>
				<tr>
					<th>검사결과</th>				
					<th>
						<input name="t_result" value="X" type="radio" />미입력
						<input name="t_result" value="P" type="radio" />양성
						<input name="t_result" value="N" type="radio" />음성
					</th>
				</tr>
				<tr>
					<th colspan="2">
						<button onclick="addTest()" type="button">검사결과등록</button>
						<button onclick="resetForm()" type="button">다시쓰기</button>
					</th>
				</tr>
			</table>
		</form>
	</center>

	<%@include file="footer.jsp" %>
	<script src="index.js" type="text/javascript"></script>
</body>
</html>