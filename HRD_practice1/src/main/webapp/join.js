console.log("join js 실행")

function memberjoin(){
	console.log("memberjoin클릭")
	
	if( document.joinform.custno.value == "" ){
		alert("회원번호를 입력해주세요")
		document.joinform.custno.focus(); // 포커스 이동
		return false;
	}
	
	if( document.joinform.custname.value == "" ){
		alert("회원성명을 입력해주세요")
		document.joinform.custname.focus(); // 포커스 이동
		return false;
	}
	
	if( document.joinform.phone.value == "" ){
		alert("phone을 입력해주세요")
		document.joinform.phone.focus(); // 포커스 이동
		return false;
	}
	
	if( document.joinform.address.value == "" ){
		alert("address을 입력해주세요")
		document.joinform.address.focus(); // 포커스 이동
		return false;
	}
	
	if( document.joinform.joindate.value == "" ){
		alert("joindate을 입력해주세요")
		document.joinform.joindate.focus(); // 포커스 이동
		return false;
	}
	
	if( document.joinform.grade.value == "" ){
		alert("grade을 입력해주세요")
		document.joinform.grade.focus(); // 포커스 이동
		return false;
	}
	
	if( document.joinform.city.value == "" ){
		alert("city을 입력해주세요")
		document.joinform.city.focus(); // 포커스 이동
		return false;
	}
	
	document.joinform.submit();
	alert("회원 등록이 되었습니다.");
}