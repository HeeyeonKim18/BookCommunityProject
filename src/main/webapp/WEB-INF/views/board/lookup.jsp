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
											value="<c:out value='${cri.amount}'/>"> <input
											type="hidden" name="keyword"
											value="<c:out value='${cri.keyword}'/>"> <input
											type="hidden" name="type"
											value="<c:out value='${cri.type}'/>">
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
											<c:if test="${member.userid eq board.writer}">
											<button type="button" id="modifyBtn" class="btn btn-primary">수정하기</button>
											</c:if>
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
					<div class='bigPictureWrapper'>
						<div class="bigPicture">
						</div>
					</div>
					<div class="row">
						<div class="col-xl-12 col-lg-10">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary"><i class ="fa fa-comments fa-fw"></i> 댓글 보기</h6>	
									<button class="btn btn-outline-primary btn-sm float-right" id="enroll_reply">작성하기</button>
								</div>
								
								<div class="card-body" >
									<ul class="chat pl-0 mb-0" id="chat">
										<li class="left clearfix" data-rno='12' style="list-style: none;">
											<div>
												<div class="header">
													<strong class="primary-font">user00</strong>
													<small class="float-right text-muted">2018-11-11 11:11</small>
												</div>
												<p> Good job! </p>
											</div>
										</li>
									</ul>
								</div>
								<div class="card-footer m-0 p-2" id="chatFooter">
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
		form.attr("action", "/board/modify");
		form.submit();
	});

	$("#mainBtn").on("click", function() {
		form.attr("action", "/main");
		var pageTag = $("input[name=pageNum]").clone();
		var amountTag = $("input[name=amount]").clone();
		form.empty();
		form.append(pageTag).append(amountTag);
		form.submit();
	});

	$(document).ready(function() {
		var result = '<c:out value="${modifyResult}"/>';
		
		var bno = '<c:out value="${board.bno}"/>';
		var replyUL = $("#chat");
		
		showList(1);		
		
		var modal = $("#replyModal");
		var modalInputReply = modal.find("input[name=reply]");
		var modalInputReplyer = modal.find("input[name=replyer]");
		var modalInputReplyDate = modal.find("input[name=replyDate]");
		
		var modalModBtn = $("#replyModBtn");
		var modalDelBtn = $('#replyDelBtn');
		var modalEnBtn = $("#replyEnBtn");
		
		$("#enroll_reply").on("click", function(e){
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();
			modal.find(modalModBtn).hide();
			modal.find(modalDelBtn).hide();
			
			$("#replyModal").modal("show");
		});
		
		$(modalEnBtn).on("click", function(e){
			var reply = {
					reply : modalInputReply.val(),
					replyer:modalInputReplyer.val(),
					bno: bno
			};
			
			enroll(reply);
		});
		
		$(modalModBtn).on("click", function(e){
			var reply ={
					rno : modal.data("rno"),
					reply: modalInputReply.val()
			};
			updateRno(reply);
		});
		
		$(modalDelBtn).on("click", function(e){
			var rno = modal.data("rno");
			
			deleteRno(rno);
		});
		
		
		(function(){
			
			
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
		
		showResult(result);
		
		history.replaceState({}, null, null);

		function showResult(result) {
			
			if (result == null) {
				return;
			}
			if (parseInt(result) > 0) {
				$(".modal-body").html("게시글 "+ parseInt(modifyResult)+ "번 수정에 실패하였습니다.");
			} else {
				return;
			}
			$("#failModal").modal("show");
		}	
		
		var pageNum = 1;
		var replyPageFooter = $("#chatFooter");
	
	$("#chat").on("click", "li", function(e){
		var rno = $(this).data("rno");
		getRno(rno);
	});
	
	/* 댓글 목록 보기 */
	function showList(page){
		$.getJSON("/reply/pages/" + bno + "/" + page + ".json", function(data){
			var str = "";
			
			if(page == -1){
				pageNum = Math.ceil(data.replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			if(data.list==null || data.list.length == 0){
				replyUL.html("");
				return;
			}
			for(var i = 0, len = data.list.length || 0; i < len; i++){
				str += "<li class='left clearfix' data-rno='" +data.list[i].rno +"' style='list-style: none;'>";
				str += "<div><div class='header'><strong class='primary-font'>"+ data.list[i].replyer+"</strong>";
				str += "<small class='float-right text-muted'>"+timeZone(data.list[i].replyDate)+"</small></div>"
				str += "<p>" +data.list[i].reply+"</p></div></li>";
			}
			replyUL.html(str);
			showReplyPage(data.replyCnt);
			});
	};
	
	/* 댓글 등록하기 */
	function enroll(reply){
		$.ajax({
			type: 'post',
			url: '/reply/new',
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				alert(result);
				modal.find("input").val();
				modal.modal("hide");
				showList(-1);
			}
		});
	}
	
	/* 댓글 삭제하기 */
	function deleteRno(rno){
		$.ajax({
			type: 'delete',
			url: '/reply/' + rno,
			success: function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			}
		});
	}
	
	/* 댓글 수정하기 */
	function updateRno(reply){
		$.ajax({
			type: 'put',
			url: '/reply/' + reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			}
		})
	}
	
	/* 특정 댓글 보기 */
	function getRno(rno){
		$.get("/reply/"+ rno + ".json", function(reply){
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(timeZone(reply.replyDate)).attr("readonly", "readonly");
			modal.data("rno", reply.rno);
			modal.find(modalEnBtn).hide();
			
			$("#replyModal").modal("show");
		});
	}
	
	/* 시간 설정하기 */
	function timeZone(value){
		var today = new Date();
		var gap = today.getTime() - value;
		var dateObj = new Date(value);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [(hh > 9 ? '': '0') + hh, ':', (mi > 9 ?  '': '0') + mi, ':', (ss > 9 ? '' : '0') + ss ].join('');
		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '':'0') +mm, '/',
				(dd > 9 ? '' : '0') + dd].join('');
			
		}
	};	
	
	
	
	
	function showReplyPage(replyCnt){
		
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/ 10.0);
		}
		
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		var str= "<ul class='pagination float-right'>";
		
		if(prev){
			str+="<li class='page-item'><a class='page-link' href='"+ (startNum -1)+"'>Previous</a></li>";
		}
		
		for(var i = startNum ; i <= endNum; i++){
			var active = pageNum == i ? "active":"";
			
			str += "<li class='page-item" + active + " '> <a class='page-link' href='"+i+"'>" + i + "</a> </li>";
		}
		
		if(next){
			str += "<li class='page-item'> <a class='page-link' href='"+(endNum + 1) +"'> Next</a></li>";
		}
		
		str += "</ul> </div>";
		
		console.log(str);
		replyPageFooter.html(str);
	}
	
	replyPageFooter.on("click", "li a", function(e){
		e.preventDefault();
		console.log("page click");
		
		var targetPageNum = $(this).attr("href");
		
		console.log("targetNum: "+ targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
	});
	
	
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