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

				 <%@include file ="./include/header.jsp" %>

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
									<form class="boardForm" method="get" action="/admin/memberModify">
										<input type="hidden" value="<c:out value='${list.userid}'/>"
											name="userid"> <input type="hidden" name="pageNum"
											value="<c:out value='${cri.pageNum}'/>"> <input
											type="hidden" name="amount"
											value="<c:out value='${cri.amount}'/>"> <input
											type="hidden" name="keyword"
											value="<c:out value='${cri.keyword}'/>"> <input
											type="hidden" name="type"
											value="<c:out value='${cri.type}'/>">
											
										<div class="form-group row">
											
											<div class="col-sm-6">
												<label><strong>이름</strong></label> <input type="text"
													class="form-control" disabled="disabled"
													value="<c:out value='${list.userName}'/>">
											</div>
											<div class="col-sm-6 mb-3 mb-sm-0">
												<label><strong>권한</strong></label> 
												<input type="text" disabled = "disabled"
													class="form-control" id="auth_input" value="${list.auth}">
											</div>
											
										</div>
										
										<div class="form-group">
											<div class="col-sm-13 mb-sm-1">
												<label><strong>이메일</strong></label> <input type="text"
													class="form-control" name="title"
													value="<c:out value='${list.userMail}'/>" disabled="disabled">
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-sm-13 mb-sm-1">
												<label><strong>전화번호</strong></label> <input type="text"
													class="form-control" name="title"
													value="<c:out value='${list.userPhone}'/>" disabled="disabled">
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-sm-13 mb-3 mb-sm-0">
												<label><strong>주소</strong></label> <input type="text"
													class="form-control" name="writer" disabled="disabled"
													value="<c:out value='(${list.userAddr1}) ${list.userAddr2}, ${list.userAddr3}'/>">
											</div>
										</div>
										
										<div class="form-group row">
											<div class="col-sm-6 mb-3 mb-sm-0">
												<label><strong>가입일</strong></label> <input type="text"
													class="form-control" name="writer" disabled="disabled"
													value='<fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/>'>
											</div>

											<div class="col-sm-6">
												<label><strong>작성한 글</strong></label> <input type="text"
													class="form-control" disabled="disabled" id="count_input">
											</div>
										</div>
										
										<br>
										<div class="text-center">
											<button type="button" id="modifyBtn" class="btn btn-primary">수정하기</button>
											<button type="button" id="mainBtn" class="btn btn-secondary">메인화면</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
<%@include file="../include/modal.jsp"%>
<%@include file="../include/footer.jsp"%>

<script>
	var form = $(".boardForm");

	$("#modifyBtn").on("click", function() {
		form.attr("action", "/admin/memberModify");
		form.submit();
	});

	$("#mainBtn").on("click", function() {
		form.attr("action", "/admin/memberManagement");
		var pageTag = $("input[name=pageNum]").clone();
		var amountTag = $("input[name=amount]").clone();
		form.empty();
		form.append(pageTag).append(amountTag);
		form.submit();
	});
	
	$(document).ready(function(){
		var userid= '<c:out value="${list.userid}"/>';
		
		$.getJSON("/admin/countBoard",{userid: userid}, function(result){
			console.log(result);
			$("#count_input").val(result);
		});
		
		var auth = $("#auth_input").val();
		if(auth == 1){
			$("#auth_input").empty();
			$("#auth_input").val('관리자');
		}else{
			$("#auth_input").empty();
			$("#auth_input").val('일반회원');
		}
	}) 

	
</script>
</body>
</html>