
function addMember(){
	console.log("addMember 실행")
	//폼객체
	let f = document.addForm;
	if ( f.custno.value == "" ){ alert('회원번호가 입력되지 않았습니다.'); f.custno.focus(); return false;	}
	if ( f.custname.value == "" ){ alert('회원성명이 입력되지 않았습니다.'); f.custname.focus(); return false;	}
	if ( f.phone.value == "" ){ alert('전화번호가 입력되지 않았습니다.'); f.phone.focus(); return false;	}
	if ( f.address.value == "" ){ alert('주소가 입력되지 않았습니다.'); f.address.focus(); return false;	}
	if ( f.joindate.value == "" ){ alert('가입일자가 입력되지 않았습니다.'); f.joindate.focus(); return false;	}
	if ( f.grade.value == "" ){ alert('등급이 입력되지 않았습니다.'); f.grade.focus(); return false;	}
	if ( f.city.value == "" ){ alert('도시코드가 입력되지 않았습니다.'); f.city.focus(); return false;	}
	
	f.submit();
	alert('회원등록이 완료 되었습니다!')
}

function viewmove(){
	console.log("viewmove 실행")
	document.location.href="view.jsp";
}

function upDateMember(){
	console.log('upDateMember()실행')
	document.updateForm.submit();
	alert('회원정보수정이 완료 되었습니다.')
}