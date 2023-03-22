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
								<h6 class="m-0 font-weight-bold text-primary"><c:out value="${board.bno}"/>번 글</h6>
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
										<a class="dropdown-item" href="/board/remove?bno='<c:out value="${board.bno}"/>'">Delete</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="/main">Main</a>
									</div>
								</div>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<form class="boardForm" method="post">
								<input type="hidden" value="<c:out value='${board.bno}'/>" name="bno">
								<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
                                <input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
                                <input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
                                <input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>">
								<div class="form-group">
									<div class="col-sm-13 mb-sm-1">
										<label><strong>제목</strong></label>
										<input type="text" class="form-control" id="titleIn"
										name="title" value="<c:out value='${board.title}'/>">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-13 mb-sm-1">
										<label><strong>내용</strong></label>
										<textarea class="form-control" rows="15" id="contentIn"
										 name="content"><c:out value='${board.content}'/></textarea>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<label><strong>작성자</strong></label>
										<input type="text" class="form-control" name="writer" readonly="readonly" value="<c:out value='${board.writer}'/>">
									</div>
									
									<div class="col-sm-6">
										<label><strong>최종 수정일</strong></label>
										<input type="text" class="form-control" disabled="disabled" 
										value='<fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd"/>'>
									</div>
								</div>
								<br>
								<div class="text-center">
								<button type="button" id="modifyBtn" class="btn btn-primary">수정완료</button>
								<button type="button" id="deleteBtn" class="btn btn-danger">삭제하기</button>
								<button type="button" id="mainBtn" class="btn btn-secondary">메인화면</button>
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
											<div class="col-sm-13 pb-4" id="uploadDiv">
												<label><strong>이미지 선택</strong></label> 
													<input type="file" accept=".gif,.jpg, .jpeg, .png"
													class="form-control form-control-sm" name="uploadFile" multiple>
											</div>
										</div> 
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
					</div>
				</div>
	<%@include file="../include/footer.jsp"%>
	
<script>
var form = $(".boardForm");

$("#modifyBtn").on("click", function(){
	
	console.log("submit clicked");
	form.attr("action", "/board/modify");
	
	var titleIn = $("#titleIn").val();
	var contentIn = $("#contentIn").val();

	if(titleIn == null || titleIn == '' ){
		alert("제목을 입력해주세요.");
		return false;
	}
	if(contentIn == null || contentIn == ''){
		alert("내용을 입력해주세요.");
		return false;
	}
	
	var str = "";
	
	$("#uploadResult ul li").each(function(i, obj){
		var jobj = $(obj);
		
		console.dir(jobj);
		
		str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	});
	form.append(str);
	
	form.submit();	
});

$("#mainBtn").on("click", function(){
	form.attr("action", "/main").attr("method", "get");
	var pageNumTag = $("input[name=pageNum]").clone();
	var amountTag = $("input[name=amount]").clone();
	var keywordTag = $("input[name=keyword]").clone();
	var typeTag = $("input[name=type]").clone();
	
	form.empty();
	form.append(pageNumTag);
	form.append(amountTag);
	form.append(keywordTag);
	form.append(typeTag);
	form.submit();
});

$("#deleteBtn").on("click", function(){
	form.attr("action", "/board/remove");
	form.submit();
});

$(document).ready(function(){
	
	(function(){
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/getAttachList", {bno:bno}, function(arr){
			console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i, attach){
					var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_" + attach.uuid + "_" + attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+ "'data-filename='"+attach.fileName +"'>";
					str += "<span>" + attach.fileName + "</span>";
					str += "<button type='button' data-file =\'"+fileCallPath+"\' class='btn btn-warning btn-circle'>";
					str += "<i class='fa fa-times'> </i> </button> <br>";
					str += "<div><img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
				});
				
				$("#uploadResult ul").html(str);
			});
		})();
	
	$("#uploadResult").on("click", "button", function(e){
		console.log("delete file");
		
		if(confirm("Remove this file?")){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	});
	
	var maxSize = 5242880;
	
	function sizeCheck(fileSize){
		if(fileSize >= maxSize){
			alert("이미지 용량이 너무 큽니다.");
			return false;
		}
		return true;
	}
	var cloneObj = $("#uploadDiv").clone();
	
	$("input[type='file']").change(function(e){
		var formData = new FormData();
		
		var inputFile = $("input[name=uploadFile]");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		for(var i = 0; i < files.length; i++){
			if(!sizeCheck(files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: '/upload',
			processData:false,
			contentType:false,
			data:formData,
			type:'POST',
			dataType:'json',
			success: function(result){
				console.log(result);
				showUploadFile(result);
			}
		});
	});
	
	var uploadResult = $("#uploadResult ul");
	
	function showUploadFile(uploadResultArr){
		var str="";
		
		$(uploadResultArr).each(function(i, obj){
			var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_" + obj.uuid + "_" + obj.fileName);
			
			str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+ "'data-filename='"+obj.fileName +"'>";
			str += "<span>" + obj.fileName + "</span>";
			str += "<button type='button' data-file =\'"+fileCallPath+"\' class='btn btn-warning btn-circle'>";
			str += "<i class='fa fa-times'> </i> </button> <br>";
			str += "<div><img src='/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str += "</li>";
			
		});
		
		uploadResult.append(str);

	}
	
	$("#uploadResult").on("click", "button", function(e){
		console.log("delete file");
		
		var targetFile = $(this).data("file");
		
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url: "/deleteFile",
			data: {fileName: targetFile},
			dataType: 'text',
			type:'post',
			success:function(result){
				targetLi.remove();
			}
		});
	
	});
});
</script>
</body>
</html>