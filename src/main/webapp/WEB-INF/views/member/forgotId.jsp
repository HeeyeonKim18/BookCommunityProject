<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Forgot ID</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Forgot Your ID?</h1>
                                        <p class="mb-4">이름과 이메일을 기입해주세요.</p>
                                    </div>
                                    <form class="user" id="findIdForm" action="/member/forgotId">
                                    	<div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="name_input" placeholder="Enter your name" name="userName">
                                        </div>
                                        
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="mail_input" 
                                                placeholder="Enter Email Address">
                                        </div>
                                        <a class="btn btn-primary btn-user btn-block" id="findIdBtn">
                                           	아이디 찾기
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/member/join">Create an Account!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/member/login">Already have an account? Login!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <div class="modal fade" id="forgotIdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">아이디 찾기</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                  	<button class="btn btn-secondary" id="forgotPw" type="button">비밀번호 찾기</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
                    <form id="pw_form"></form>
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
<script>
	
	
	$("#findIdBtn").on("click", function(e){
		e.preventDefault();
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var name = $("#name_input").val();
		var mail = $("#mail_input").val();
		
		if(name.length == 0|| name == ''){
			alert("이름을 입력해주세요.");
			return false;
		}
		
		if(mail.length < 6 || !regExpEmail.test(mail)){
			alert("이메일 형식에 맞지 않습니다.");
			return false;
		}
		
		var data = {
				userName:name,
				userMail:mail
		}		
		
		$.ajax({
			type: 'post',
			url: '/member/forgotId',
			data: data,
			success: function(result){
				idModal(result);
				$("#name_input").val("");
				$("#mail_input").val("");
			}
		});
		
	});
	var modal = $("#forgotIdModal");
	var pwBtn = $("#forgotPw");
	var id = '';
	
	function idModal(result){
		
		if(result =='fail'){
			$(".modal-body").html("일치하는 회원이 존재하지 않습니다. 회원가입을 해주세요.");
			modal.find(pwBtn).hide();
		}else{
			$(".modal-body").html("회원님의 아이디는 " + result + " 입니다.");
			modal.find(pwBtn).show();
			id = result;
		}
		modal.modal("show");
	}
	
	
	$("#forgotIdModal").on("click", pwBtn, function(e){
		e.preventDefault();
		var form = $("#pw_form");
		form.append("<input type='hidden' value='"+ id +"' name='userName'>");
		form.attr("action", "/member/forgotPw");
		form.submit();
	});

</script>
</body>

</html>