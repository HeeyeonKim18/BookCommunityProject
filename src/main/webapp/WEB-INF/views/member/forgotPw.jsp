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

    <title>Forgot Password</title>

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
                                        <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                                        <p class="mb-4">아이디와 이메일을 기입해주세요.</p>
                                    </div>
                                    <form class="user" id="findPwForm" action="/member/forgotPw">
                                    	<div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="id_input" placeholder="Enter your Id" name="userid" 
                                                value="${name}">
                                        </div>
                                        
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="mail_input" name="userMail"
                                                placeholder="Enter Email Address">
                                        </div>
                                        <a class="btn btn-primary btn-user btn-block" id="sendEmail">
                                           	임시 비밀번호 전송
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


    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>
<script>
	
	
	$("#sendEmail").on("click", function(e){
		e.preventDefault();
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var id = $("#id_input").val();
		var mail = $("#mail_input").val();
		var form = $("#findPwForm");
		
		if(id.length == 0|| id == ''){
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		if(mail.length < 6 || !regExpEmail.test(mail)){
			alert("이메일 형식에 맞지 않습니다.");
			return false;
		}
		
		var data = {
				userid:id,
				userMail:mail
		}		
		
		$.ajax({
			type: 'post',
			url: '/member/beforeMailPw',
			data: data,
			success: function(result){
				if(result == 'fail'){
					alert("일치하는 회원 정보가 없습니다.");
					return false;
				}else{
					form.attr("method", "post");
					form.submit();
				}
				
				$("#id_input").val("");
				$("#mail_input").val("");
			}
		});
		
	});
	

</script>
</body>

</html>