console.log("index js 실행")

function scoresubmit(){
	
	// form 객체
	let s = document.scoreForm;
	if( s.sno.value == "" ){ 
		alert('학생번호가 입력되지 않았습니다.'); s.sno.focus(); 
		return false; 
	}
	if( s.ekor.value == "" ){ 
		alert('국어점수가 입력되지 않았습니다.'); s.ekor.focus(); 
		return false; 
	}
	if( s.emath.value == "" ){ 
		alert('수학점수가 입력되지 않았습니다.'); s.emath.focus(); 
		return false; 
	}
	if( s.eeng.value == "" ){ 
		alert('영어점수가 입력되지 않았습니다.'); s.eeng.focus(); 
		return false; 
	}
	if( s.ehist.value == "" ){ 
		alert('역사점수가 입력되지 않았습니다.'); s.ehist.focus(); 
		return false; 
	}
	
	s.submit();
	alert('학생성적이 모두 입력되었습니다.')
}