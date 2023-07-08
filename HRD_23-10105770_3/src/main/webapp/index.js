

function socreAdd(){
	console.log('socreAdd() 실행')
	// form 객체
	let f = document.addForm;
	if ( f.sno.value == "" ){ alert('학생번호가 입력되지 않았습니다.'); f.sno.focus(); return false; }
	if ( f.ekor.value == "" ){ alert('국어점수가 입력되지 않았습니다.'); f.ekor.focus(); return false; }
	if ( f.emath.value == "" ){ alert('수학점수가 입력되지 않았습니다.'); f.emath.focus(); return false; }
	if ( f.eeng.value == "" ){ alert('영어점수가 입력되지 않았습니다.'); f.eeng.focus(); return false; }
	if ( f.ehist.value == "" ){ alert('역사점수가 입력되지 않았습니다.'); f.ehist.focus(); return false; }
	
	f.submit();
	alert('학생 성적이 모두 입력되었습니다.');
}