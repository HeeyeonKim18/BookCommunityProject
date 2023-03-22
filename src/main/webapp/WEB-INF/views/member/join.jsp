<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>회원가입</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<style>
#inputId1 {
	color: green;
	display: none;
}

#inputId2 {
	color: red;
	display: none;
}

#inputPw1 {
	color: green;
	display: none;
}

#inputPw2 {
	color: red;
	display: none;
}

#mail_check_false {
	background-color: #ebebe4;
}

#mail_check_true {
	background-color: white;
}

</style>
</head>

<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">회 원 가 입</h1>
							</div>
							<form class="user" id="join_form" method="post">
								<div class="form-group">
									<div class="col-sm-13 mb-sm-1">
										<input type="text" class="form-control form-control-user"
											name="userid" placeholder="* 아이디">
									</div>
									<div class="text-center">
										<span class="small" id="inputId1"> 사용 가능한 아이디입니다.</span> 
										<span class="small" id="inputId2">이미 존재하는 아이디입니다.</span>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											name="userpw" placeholder="* 비밀번호">
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user"
											name="userpwAgain" placeholder="* 비밀번호 확인">
									</div>
								</div>
									<div class="text-center">
										<span class="small" id="inputPw1"> 비밀번호가 일치합니다.	</span> 
										<span class="small" id="inputPw1"> 비밀번호가 일치하지 않습니다.</span>
									</div>

								<div class="form-group">
									<div class="col-sm-13">
										<input type="text" class="form-control form-control-user"
											name="userName" placeholder="* 이름">
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-13">
										<input type="text" class="form-control form-control-user"
											name="userPhone" placeholder="* 전화번호 ('-'포함하여 입력하세요)">
									</div>
								</div>

								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										name="userMail" id="inputMail" placeholder="* 이메일">
								</div>

								<div class="form-group row">
									<div class="col-sm-9 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											name="mailNum" id="mail_check_false" disabled="disabled"
											placeholder="* 인증번호">
									</div>
									<input type="button" class="btn btn-primary btn-user btn-sm"
										id="sendMail" value="인증번호 전송">
								</div>

								<hr>

								<div class="form-group row">
									<div class="col-sm-9 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											name="userAddr1" id="addr1" readonly="readonly"
											placeholder="우편번호">
									</div>
									<input type="button" class="btn btn-primary btn-user btn-sm"
										id="address" value="우편번호 검색"
										onclick="execution_daum_address()">
								</div>

								<div class="form-group">
									<div class="col-sm-13">
										<input type="text" class="form-control form-control-user"
											name="userAddr2" id="addr2" readonly="readonly"
											placeholder="주소">
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-13">
										<input type="text" class="form-control form-control-user"
											name="userAddr3" id="addr3" readonly="readonly"
											placeholder="상세 주소	 입력">
									</div>
								</div>

								<input type="button" class="btn btn-primary btn-user btn-block"
									id="join_button" value=" 회 원 가 입 하 기">
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="/member/forgotPw">Forgot
									Password?</a>
							</div>
							<div class="text-center">
								<a class="small" href="/member/login">Already have an account?
									Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		var idC = false;
		var reIdC = false;
		var idNum = false;
		var pwC = false;
		var rePwC = false;
		var pwC2 = false; // 비번과 비번확인 일치 여부
		var nameC = false;
		var phoneC = false;
		var phoneForm = false; 
		var mailC = false;
		var reMailC = false;
		var addrC = false;
		
		
		$(document).ready(function(){
			$("#join_button").click(function(){
				
				var id = $("input[name=userid]").val();
				var pw = $("input[name=userpw]").val();
				var pwAgain = $("input[name=userpwAgain]").val();
				var name = $("input[name=userName]").val();
				var phone = $("input[name=userPhone]").val();
				var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
				var mail = $("input[name=userMail]").val();
				var addr = $("input[name=userAddr1]").val();
				
				if(id == ""){
					alert("아이디를 입력해주세요.");
					idC = false;
					return;
				}else{
					idC = true;
				}
				
				if(id.length <= 4){
					alert("5자리 이상 아이디를 입력하세요.");
					idNum = false;
					return;
				}else{
					idNum = true;
				}
				
				if(pw == ""){
					alert("비밀번호를 입력해주세요.");
					pwC = false;
					return;
				}else{
					pwC = true;
				}
				
				if(pwAgain ==""){
					alert("비밀번호 확인이 필요합니다.");
					rePwC = false;
					return;
				}else{
					rePwC = true;
				}
				
				if(name == ""){
					alert("이름을 입력해주세요.");
					nameC = false;
					return;
				}else{
					nameC = true;
				}
				
				if(phone ==""){
					alert("휴대폰 번호를 입력해주세요.");
					phoneC = false;
					return;
				}else{
					phoneC = true;
				}
				
				if(!patternPhone.test(phone)){
					alert("휴대폰 번호를 확인해주세요.");
					phoneForm = false;
					return;
				}else{
					phoneForm = true;
				}
				
				if(mail == ""){
					alert("이메일을 입력해주세요.");
					mailC = false;
					return;
				}else{
					mailC = true;
				}
				if(addr == ""){
					alert("주소를 입력해주세요");
					addrC=false;
					return;
				}else{
					addrC = true;
				}
				
				if(idC && reIdC && idNum && pwC && rePwC && pwC2 && nameC && phoneC && phoneForm && mailC && reMailC && addrC){
					$("#join_form").attr("action","/member/join");
					$("#join_form").submit();
				}
				return false;
			});
		});
		
		$("input[name=userid]").on("propertychange change keyup paste input", function(){
			var userid= $("input[name=userid]").val();
			var data = {userid: userid}
			
			$.ajax({
				type: 'POST',
				url: '/member/idCheck',
				data: data,
				success: function(result){
					if(result != "fail"){
						$("#inputId1").css("display","inline-block");
						$("#inputId2").css("display", "none");
						reIdC = true;
					}else{
						$("#inputId2").css("display","inline-block");
						$("#inputId1").css("display", "none");
						reIdC = false;
					}
				}
			})
		});
		
		var code="";
		
		$("#sendMail").on("click", function(){
			var email= $("#inputMail").val();
			var checkBox = $("input[name=mailNum]");
			var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			  if(email.length < 6 || !regExpEmail.test(email))
			    {
			        alert('메일형식이 맞지 않습니다.');
			        return false;
			    }  
			
			
			$.ajax({
				type:"GET",
				url:"/member/mailCheck?email="+email,
				success:function(data){
					checkBox.attr("disabled", false);
					checkBox.attr("id", "mail_check_true");
					code = data;
				}
			});
		});
		
		$("input[name=mailNum]").blur(function(){
			var inputCode = $("input[name=mailNum]").val();
			var checkResult = $("#mail_check_warn");
			
			
			if(inputCode == code){
				alert("인증번호가 일치합니다.");
				reMailC = true;
			}else{
				alert("인증번호를 다시 입력해주세요.");
				reMailC = false;
			}
		});
		
		function execution_daum_address(){
			new daum.Postcode({
				oncomplete: function(data){
					
					 var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                   addr += extraAddr;
		                
		                } else {
		                    addr += ' ';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                $("#addr1").val(data.zonecode);
		                $("#addr2").val(addr);
		                // 커서를 상세주소 필드로 이동한다.
		                $("#addr3").attr("readonly", false);
		                $("#addr3").focus();
					
				}
			
			}).open();
		}
		
		$("input[name=userpwAgain]").on("propertychange change keyup paste input", function(){
			var pw = $("input[name=userpw]").val();
			var pwC = $("input[name=userpwAgain]").val();
			
			if(pw == pwC){
				$("#inputPw1").css("display","inline-block");
				$("#inputPw2").css("display", "none");
				pwC2 = true;
			}else{
				$("#inputPw2").css("display","inline-block");
				$("#inputPw1").css("display", "none");
				pwC2 = false;
			}
		});
		
		
			
	</script>
</body>

</html>