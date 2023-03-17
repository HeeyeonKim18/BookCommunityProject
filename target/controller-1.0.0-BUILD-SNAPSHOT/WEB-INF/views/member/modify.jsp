<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>REGISTER</title>

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<style>
	#uploadResult ul{
		padding-left:0;
	} 
	#uploadResult ul li{
		list-style:none;
		padding:1px;
		font-size: small;
		width: 100%
		
	}
	#uploadResult ul li img{
		width: 100%;
	}
</style>
</head>

<body>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@include file="../include/sidebar.jsp"%>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				 <%@include file ="../include/header.jsp" %>

				<div class="container-fluid">

					<h1 class="h3 mb-2 text-gray-800">회원 정보 조회</h1>
					<p class="mb-4">Management of Member</p>

					<!-- Area Chart -->
					<div class="row">
						<div class="col-xl-12 col-lg-10">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										<c:out value='${list.userid}'/>님
									</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Change</div>
											<a class="dropdown-item" href="#">Modify</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Main</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<form class="boardForm" method="post" action="/member/modify">
										<input type="hidden" value="<c:out value='${list.userid}'/>"
											name="userid"> 
										<div class="form-group row">

											<div class="col-sm-6">
												<label><strong>이름</strong></label> <input type="text"
													class="form-control" disabled="disabled" name="userName"
													value="<c:out value='${list.userName}'/>">
											</div>
											
											<div class="col-sm-6 mb-3 mb-sm-0">
												<label><strong>가입일</strong></label> <input type="text"
													class="form-control" name="regDate" disabled="disabled"
													value='<fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/>'>
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-sm-13 mb-sm-1">
												<label><strong>이메일</strong></label> <input type="text"
													class="form-control" name="userMail" disabled ="disabled"
													value="<c:out value='${list.userMail}'/>">
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-sm-13 mb-sm-1">
												<label><strong>전화번호</strong></label> <input type="text"
													class="form-control" name="userPhone"
													value="<c:out value='${list.userPhone}'/>" >
											</div>
										</div>
										
										<div class="form-group row">
											<div class="col-sm-6 mb-2 mb-sm-1">
											<label><strong>주소</strong></label> 
												<input type="text" class="form-control form-control-user"
											name="userAddr1" id="addr1" readonly="readonly"
											placeholder="우편번호" value="<c:out value='${list.userAddr1}'/>">
											</div>
												<div class="col-sm-6 pt-4 mt-1">
												<input type="button" class="btn btn-primary btn-user"
													id="address" value="우편번호 검색"
													onclick="execution_daum_address()">
													</div>
											
										</div>
										
										<div class="form-group row">
											<div class="col-sm-6 mb-3 mb-sm-0">
												<input type="text" class="form-control form-control-user"
											name="userAddr2" id="addr2" readonly="readonly" placeholder="주소"
											value="<c:out value='${list.userAddr2}'/>">
											</div>

											<div class="col-sm-6">
												<input type="text" class="form-control form-control-user"
												name="userAddr3" id="addr3" placeholder="상세주소 입력"
												value="<c:out value='${list.userAddr3}'/>">
											</div>
										</div>
										
										<br>
										<div class="text-center">
											<button type="button" id="modifyBtn" class="btn btn-primary">수정하기</button>
											<button type="button" id="deleteBtn" class="btn btn-secondary">탈퇴하기</button>
											<button type="button" id="mainBtn" class="btn btn-warning">메인화면</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
<%@include file="../include/modal.jsp"%>
<%@include file="../include/footer.jsp"%>
<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var form = $(".boardForm");

	$("#modifyBtn").on("click", function() {
		var phone = $("input[name=userPhone]").val();
		var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
		
		if(phone == '' || phone.length <= 0){
			alert("전화번호를 입력해주세요.");
			return false;
		}
		if(!patternPhone.test(phone)){
			alert("'-'를 포함하여 작성해주세요.");
			return false;
		}

		form.attr("action", "/member/modify");
		form.submit();
	});

	$("#mainBtn").on("click", function() {
		form.attr("action", "/main");
		form.attr("method", "get")
		var pageTag = $("input[name=pageNum]").clone();
		var amountTag = $("input[name=amount]").clone();
		form.empty();
		form.append(pageTag).append(amountTag);
		form.submit();
	});
	
	$("#deleteBtn").on("click", function(){
		
			showModal();
	});
	
	function showModal(){
		$("#removeMemberModal").modal("show");
		$("#removeMember").on("click", function(e){
			e.preventDefault();
			var pw = $("#pw_input").val();
			var str ='';
			
			str += "<input type='hidden' name='userpw' value='"+pw+"'>";
			
			form.append(str);
			form.attr("action", "/member/remove");
			form.submit();
		});
		
	}
	
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