
function vote(){
	console.log('vote() 실행')
	// 폼객체
 	let f = document.voteForm;
 	
 	if ( f.v_jumin.value == "" ){ alert('주민번호가 입력되지 않았습니다!'); f.v_jumin.focus(); return false; }
 	if ( f.v_name.value == "" ){ alert('성명이 입력되지 않았습니다!'); f.v_name.focus(); return false; }
 	if ( f.m_no.value == "" ){ alert('후보번호가 입력되지 않았습니다!'); f.m_no.focus(); return false; }
 	if ( f.v_time.value == "" ){ alert('투표시간이 입력되지 않았습니다!'); f.v_time.focus(); return false; }
 	if ( f.v_area.value == "" ){ alert('투표장소가 입력되지 않았습니다!'); f.v_area.focus(); return false; }
 	if ( f.v_confirm.value == "" ){ alert('유권자확인이 선택되지 않았습니다!'); f.v_confirm.focus(); return false; }
 	
 	f.submit();
 	alert('투표하기 정보가 정상적으로 등록 되었습니다!')
}

function voteReset(){
	console.log('voteReset() 실행')
	let f = document.voteForm;
	alert('정보를 지우고 처음부터 다시 입력합니다!')
	f.reset();
	f.v_jumin.focus();
}