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
		display: inline-block;
		list-style:none;
		padding:5px;
		font-size: small;
		width: 150px;
		
	}
	#uploadResult ul li img{
		width: 100px;
	}
	.bigPictureWrapper{
		position: absolute;
		display: none;
		justify-content: center;
		align-items:center;
		top: 0%;
		width: 100%;
		height: 100%;
		background-color:gray;
		z-index: 100;
		background:rgba(255,255,255, 0.5);
	}
	.bigPicture{
		position:relative;
		display:flex;
		justify-content: center;
		align-items: center;
	}
	.bigPicture img{
		width: 600px;
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

				<%@include file="../include/header.jsp"%>

				<div class="container-fluid">

					<h1 class="h3 mb-2 text-gray-800">오늘의 책</h1>
					<p class="mb-4">Talk about what you read today</p>

					<!-- Area Chart -->
					<div class="row">
						<div class="col-xl-12 col-lg-10">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										<c:out value="${board.bno}" />
										번 글
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
									<form class="boardForm" method="get" action="/board/modify">
										<input type="hidden" value="<c:out value='${board.bno}'/>"
											name="bno"> <input type="hidden" name="pageNum"
											value="<c:out value='${cri.pageNum}'/>"> <input
											type="hidden" name="amount"
											value="<c:out value='${cri.amount}'/>"> 
										<div class="form-group">
											<div class="col-sm-13 mb-sm-1">
												<label><strong>제목</strong></label> <input type="text"
													class="form-control" name="title"
													value="<c:out value='${board.title}'/>" disabled="disabled">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-13 mb-sm-1">
												<label><strong>내용</strong></label>
												<textarea class="form-control" rows="3" name="content"
													disabled="disabled"><c:out
														value='${board.content}' /></textarea>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6 mb-3 mb-sm-0">
												<label><strong>작성자</strong></label> <input type="text"
													class="form-control" name="writer" disabled="disabled"
													value="<c:out value='${board.writer}'/>">
											</div>

											<div class="col-sm-6">
												<label><strong>최종 수정일</strong></label> <input type="text"
													class="form-control" disabled="disabled"
													value='<fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd"/>'>
											</div>
										</div>
										<br>
										<div class="text-center">
											<button type="button" id="modifyBtn" class="btn btn-primary">수정하기</button>
											<button type="button" id="mainBtn" class="btn btn-secondary">목록</button>
										</div>
									</form>
								</div>
							</div>
						</div>

						<div class="col-xl-12 col-lg-10 ">
							<div class="card shadow mb-4">
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">IMAGES</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="form-group">
										<div class="col-sm-13">
											<label><strong>이미지</strong></label>
											<div id="uploadResult">
												<ul>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='bigPictureWrapper'>
						<div class="bigPicture">
						</div>
					</div>
					</div>
				</div>
<%@include file="../include/modal.jsp"%>
<%@include file="../include/footer.jsp"%>

<script>
	var form = $(".boardForm");

	$("#modifyBtn").on("click", function() {
		form.attr("action", "/member/boardModify");
		form.submit();
	});

	$("#mainBtn").on("click", function() {
		form.attr("action", "/member/getBoard");
		var pageTag = $("input[name=pageNum]").clone();
		var amountTag = $("input[name=amount]").clone();
		form.empty();
		form.append(pageTag).append(amountTag);
		form.submit();
	});

	$(document).ready(function() {
		
		
		(function(){
			var bno='<c:out value="${board.bno}"/>';
			
			$.getJSON("/getAttachList", {bno:bno}, function(arr){
				console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i, attach){
					var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_" + attach.uuid + "_" + attach.fileName);
					var originPath = encodeURIComponent(attach.uploadPath+"/"+ attach.uuid + "_" + attach.fileName);
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+ "'data-filename='"+attach.fileName +"'>";
					str += "<a href=\"javascript:showImage(\'"+originPath+"\')\">";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</a>";
					str += "</li>";
				});
				$("#uploadResult ul").html(str);
			});
		})();
		
	});
	function showImage(fileCallPath){
		
		$(".bigPictureWrapper").css("display", "flex").show();
		$(".bigPicture").html("<img src='/display?fileName="+encodeURI(fileCallPath)+"'>")
		.animate({width:'100%', height: '100%'},1000);  
	}
	
	$(".bigPictureWrapper").on("click", function(e){
		$(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
		setTimeout(() =>{
			$(this).hide();
		}, 1000);
	});
	
</script>
</body>
</html>