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
                                        <h1 class="h4 text-gray-900 mb-4">비밀번호 변경</h1>
                                    </div>
                                    <form class="user" id="pw_form">
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="now_pw" placeholder="현재 비밀번호" name="nowPw">
                                        </div>
                                        
                                        <div class="text-center" id="match">
                                           <span class="small" style="color:red;"></span>
                                        </div>
                                        
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="pw_input" placeholder="새로운 비밀번호" name="userpw">
                                        </div>
                                        
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="pw_again" placeholder="비밀번호 확인" name="userpw_again">
                                        </div>
                                        
                                        <div class="text-center" id="newPw_match">
                                           <span class="small" style="color:red;"></span>
                                        </div>
                                        
                                        <button class="btn btn-primary btn-user btn-block" id="change_pw">
                                         	비밀번호 변경
                                        </button>
                                        <input type="hidden" name="userid" value="<c:out value='${member.userid}'/>">
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/main">Main</a>
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
	var member = "<c:out value='${member.userid}'/>";
	var nowPwC = false;
	var newPwC2 = false;
	
		$("#change_pw").click(function(){
			
			var nowPw = $("#now_pw").val();
			var newPw = $("#pw_input").val();
			var newPw1 = $("#pw_again").val();
			
			if(nowPw == ""|| nowPw <= 0){
				alert("현재 비밀번호를 입력해주세요.");
				return false;
			}
			
			if(newPw == "" || newPw <=0){
				alert("새로운 비밀번호를 입력해주세요.");
				return false;
			}
			
			if(newPw1 == "" || newPw1 <=0){
				alert("새로운 비밀번호 확인이 필요합니다.");
				return false;
			}
			
			if(nowPwC && newPwC2){
				if(!confirm("비밀번호를 변경하시겠습니까?")){
					return false;
				}else{
					$("#pw_form").attr("action", "/member/modPw");
					$("#pw_form").attr("method", "post");
					$("#pw_form").submit();
				}
			}else{
				alert("빈칸 없이 입력해주세요.");
				return false;
			}
			
		});
		
		$("#now_pw").on("propertychange change keyup paste input", function(){
			var userpw = $("#now_pw").val();
			var spanUL = $("#match span");
			
			$.ajax({
				type:"get",
				url:"/member/pwCheck",
				data: {userpw: userpw},
				success:function(result){
					if(result == "fail"){
						$(spanUL).css("color", "red");
						$(spanUL).html("비밀번호가 올바르지 않습니다.");
						nowPwC = false;
					}else{
						$(spanUL).css("color", "green");
						$(spanUL).html("비밀번호가 일치합니다.");
						nowPwC = true;
					}
				}
			});
		});
		
		$("#pw_again").on("propertychange change keyup paste input", function(){
			var pw = $("#pw_input").val();
			var pw2 = $("#pw_again").val();
			var spanUL = $("#newPw_match span");
			if(pw == pw2){
				$(spanUL).css("color", "green");
				$(spanUL).html("비밀번호가 일치합니다.");
				newPwC2 = true;
				
			}else{
				$(spanUL).css("color", "red");
				$(spanUL).html("비밀번호가 일치하지 않습니다.");
				newPwC2 = false;
			}
		});
			
		
		
		
			
		
	
	</script>
</body>

</html>