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
		<h3>투표하기</h3>
		<form name="voteForm" action="/HRD_practice2/vote" method="post">
			<table border="1" style="border-collapse:collapse;  width:500px;">
				<tr>
					<th>주민번호</th>
					<th> <input name="v_jumin" type="text" /> 예 : 8906153154726 </th>
				</tr>
				<tr>
					<th>성명</th>
					<th> <input name="v_name" type="text" /> </th>
				</tr>
				<tr>
					<th>투표번호</th>
					<th> 
						<select name="m_no">
							<option></option>
							<option value="1">1 김후보</option>
							<option value="2">2 이후보</option>
							<option value="3">3 박후보</option>
							<option value="4">4 조후보</option>
							<option value="5">5 최후보</option>
						</select> 
					</th>
				</tr>
				<tr>
					<th>투표시간</th>
					<th> <input name="v_time" type="text" placeholder="예)0930" /> </th>
				</tr>
				<tr>
					<th>투표장소</th>
					<th> <input name="v_area" type="text" placeholder="예) 제1투표장" /> </th>
				</tr>
				<tr>
					<th>유권자확인</th>
					<th> 
						<input type="radio" name="v_confirm" value="Y"> 확인
						<input type="radio" name="v_confirm" value="N"> 미확인
					</th>
				</tr>
				<tr>
					<th colspan="2">
						<center>
							<button type="button" onclick="vote()">투표하기</button>
							<button type="button" onclick="voteReset()">다시하기</button>
						</center>
					</th>
				</tr>
			</table>
		</form>
	</center>
	<%@include file="footer.jsp" %>
	
	<script src="index.js" type="text/javascript"></script>
	
</body>
</html>