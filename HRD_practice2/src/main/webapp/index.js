function vote(){
	console.log("투표실행")
	let v = document.voteForm;
	if ( v.v_jumin.value ==""){  alert('주민번호가 입력되지 않았습니다!'); 	v.v_jumin.focus(); return false;	}
	if ( v.v_name.value ==""){  alert('성명이 입력되지 않았습니다.'); 	v.v_name.focus(); return false;	}
	if ( v.m_no.value ==""){  alert('후보번호가 선택되지 않았습니다!'); 	v.m_no.focus(); return false;	}
	if ( v.v_time.value ==""){  alert('투표시간이 입력되지 않았습니다!'); 	v.v_time.focus(); return false;	}
	if ( v.v_area.value ==""){  alert('투표장소가 입력되지 않았습니다!'); 	v.v_area.focus(); return false;	}
	if ( v.v_confirm.value ==""){  alert('유권자확인이 선택되지 않았습니다!'); 	v.v_confirm.focus(); return false;	}
	
	v.submit();
	alert('투표하기 정보가 정상적으로 등록 되었습니다.')
}

function voteReset(){
	console.log("투표다시실행")
	alert("정보를 지우고 처음부터 다시 입력합니다.")
	let v = document.voteForm;
	v.reset();
	v.v_jumin.focus();
}