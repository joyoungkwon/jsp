function registerCheck(){
	var id = document.frm.id.value;
	var pw = document.frm.pw.value;
	var pwCheck = document.frm.pwcheck.value;
	var form = document.querySelector("form");
	var existirngErrorMsg = document.querySelector("#errorMsg");
	var dupliId = document.frm.dupliId.value;
	
	if(id==""){
		alert("아이디를 입력해주세요.");
		document.frm.id.focus();
		return;
	}
	if(pw ==""){
		alert("비밀번호를 입력해주세요.");
		document.frm.pw.focus();
		return;
	}
	if(pwCheck ==""){
		alert("비밀번호 확인 을 입력해주세요.");
		document.frm.pwCheak.focus();
		return;
	}
	
	/*if(pw != pwCheck){
		alert("비밀번호 가 일치하지않습니다.");
		document.from.pwCheck.focus();
		return;
	}*/
	
	if(existirngErrorMsg){
		form.removeChild(existirngErrorMsg);
		
	}
	
	
	 //from.insertBefore = "지정한 태그 전에 삽입할 노드, 요소 설정 (표시가 설정해놓은곳 전에 표시)"
	if(pw !== pwCheck){
		var errorMsg = document.createElement("p"); 
		errorMsg.id="errorMsg"; // p태그안의 id를 만듬 #errorMsg
		errorMsg.style.color ="red";
		errorMsg.textContent="비밀번호가 맞지 않습니다"; // textContent = "요소 값 다가지고옴"
		form.insertBefore(errorMsg, form.querySelector(".eamil-wrapper"));
		return false;
	}
	//
	if(dupliId.length === 0){
		alert("중복검사를 실행하세요");
		document.frm.id.focus();
		return false;
	}
	if(id != dupliId ){
		alert("아이디를 다시 중복검사 하세요");
		document.frm.id.focus();
		return false;
	}
	
	document.frm.submit();
	
}

function idCheak() {
	var url ="idCheckServlet?id=" + document.frm.id.value;
	window.open(url,"_blank_1","toolbar=no,menubar=no,scrollbars=yes,resize=no,width=450,height=200");
}
function idOk() {
	
	opener.frm.id.value = document.idCheckFrom.id.value;
	opener.frm.dupliId.value = document.idCheckFrom.id.value;
	self.close();
}
