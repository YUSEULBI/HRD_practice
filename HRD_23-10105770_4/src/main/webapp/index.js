function testAdd(){
	console.log('testAdd()실행')
	//폼객체
	let f = document.addForm;
	if ( f.p_no.value == "" ){ alert('환자번호가 입력되지 않았습니다!'); f.p_no.focus(); return false; }
	if ( f.t_code.value == "" ){ alert('검사코드가 입력되지 않았습니다!'); f.t_code.focus(); return false; }
	if ( f.t_sdate.value == "" ){ alert('검사시작일자가 입력되지 않았습니다!'); f.t_sdate.focus(); return false; }
	if ( f.t_status.value == "" ){ alert('검사상태가 입력되지 않았습니다!'); f.t_status.focus(); return false; }
	if ( f.t_ldate.value == "" ){ alert('검사완료일자가 입력되지 않았습니다!'); f.t_ldate.focus(); return false; }
	if ( f.t_result.value == "" ){ alert('검사결과가 입력되지 않았습니다!'); f.t_result.focus(); return false; }
	
	f.submit();
	alert('검사결과가 정상적으로 등록 되었습니다!')
	
}

function formReset(){
	console.log('formReset()실행')
	alert('정보를 지우고 처음부터 다시 입력 합니다!')
	let f = document.addForm;
	f.reset();
	f.p_no.focus();
}