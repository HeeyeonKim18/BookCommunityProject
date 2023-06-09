<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

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
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">로 그 인</h1>
                                    </div>
                                    <form class="user" id="login_form" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="id_input" placeholder="Enter your Id" name="userid">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="pw_input" placeholder="Password" name="userpw">
                                        </div>
                                        
                                        <div class="text-center">
                                           <span class="small" style="color:red;">${login}</span>
                                        </div>
                                        
                                        <!-- <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div> -->
                                        <button class="btn btn-primary btn-user btn-block" id="login_button">
                                            Login
                                        </button>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/member/forgotId"> Forgot Id </a> 
                                        <a class="small" href="/member/forgotPw"> / Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/member/join">Create an Account!</a>
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
		$("#login_button").click(function(){
			
			var id = $("#id_input").val();
			var pw = $("#pw_input").val();
			
			if(id == ""|| id.length <= 0){
				alert("아이디를 입력해주세요.");
				return false;
			}
			
			if(pw == "" || pw.length <=0){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			$("#login_form").attr("action", "/member/login");
			$("#login_form").submit();
		});
		$(document).ready(function(){
			var result= '<c:out value="${result}"/>'; 
			
			if(result ==''){
				return;
			}else{
				alert(result);
			}
		});
	
	</script>
</body>

</html>