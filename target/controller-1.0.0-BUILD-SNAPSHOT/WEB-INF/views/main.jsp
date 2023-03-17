<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>EAT BOOK</title>

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<style>
#paging li.active > a{
      background-color:#eee;
      pointer-events:none;
  	}
	</style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

     	<%@include file ="./include/sidebar.jsp" %>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

               <%@include file ="./include/mainHeader.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">오늘의 책</h1>
                    <p class="mb-4">Talk about what you read today</p>
					
					 <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           <!-- <h6 class="m-0 font-weight-bold text-primary">게시판</h6> -->
                            <a class="btn btn-outline-primary btn-sm" href="/board/register"
										id="registerBtn">게시판 등록</a>
							<div class="dropdown no-arrow float-right pt-2">
									<a class="dropdown-toggle" href="#" role="button"
										id="dropdownMenuLink" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> <i
										class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
									</a>
										<div
										class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
										aria-labelledby="dropdownMenuLink" id="amount-item">
										<div class="dropdown-header">게시판 보기</div>
										<c:forEach var="numAmount" items="${pageMaker.amountList}"> 
										<a class="dropdown-item" id="item-amount" href="${numAmount}" >${numAmount}개씩</a>
										</c:forEach>
									</div>
								</div>
			               </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${board}" var="list">
                                    <tbody>
                                    	<tr>
                                    		<td style="width:8%;"><c:out value="${list.bno}"/></td>
                                    		<td style="width:60%;"><a class="move" href="<c:out value='${list.bno}'/>"><c:out value="${list.title}"/></a></td>
                                    		<td><c:out value="${list.writer}"/></td>
                                    		<td><fmt:formatDate pattern="yyyy-MM-dd" value= '${list.regDate}'/></td>
                                    		<td style="width:10%;"><c:out value="${list.views}"/></td>
                                    	</tr>
                                    </tbody>
                                    </c:forEach>
                                 </table>
                                 <form id="action_form" action="/main" method="get">
                                 	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                 	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                	<input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type}'/>">
                                	<input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>">
                                 </form>
                                 	<div>
                                 		<ul class="pagination justify-content-center" id="paging">
                                 			<c:if test="${pageMaker.prev}">
                                 				<li class="page_item previous">
                                 					<a class="page-link" href="${pageMaker.startPage -1}">이전</a>
                                 				</li>
                                 			</c:if>
                                 			
                                 			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}"> 
                                 				<li class='page_item ${pageMaker.cri.pageNum == num ? "active":""}'>
                                 					<a class="page-link" href="${num}">${num}</a>
                                 				</li>
                                 			</c:forEach>
                                 			
                                 			<c:if test="${pageMaker.next}">
                                 				<li class="page_item next">
                                 					<a class="page-link" href="${pageMaker.endPage +1}">다음</a>
                                 				</li>
                                 			</c:if>
                                 		</ul>
                                 	</div>
       							<%@include file="./include/modal.jsp" %>
    
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
				
            </div>
            <!-- End of Main Content -->
            <%@include file ="./include/footer.jsp" %>
           

<script>
$(document).ready(
	function(){
		var result = '<c:out value="${result}"/>';
		var modifyResult = '<c:out value="${modifyResult}"/>';
		var remove = '<c:out value="${removeResult}"/>';
		
		var removeMember= '<c:out value="${removeMember}"/>'; 
		
		if(removeMember ==''){
			return;
		}else{
			alert(removeMember);
		}
		
		checkModal(result);
		checkModify(modifyResult);
		removeModal(remove);
		
		history.replaceState({}, null, null);
	});
		
		function checkModal(result){
			if(result == ''){
				return
			}
			if(parseInt(result)>0){
				$(".modal-body").html("게시글 " + parseInt(result) +"번이 등록되었습니다.");
			}
			$("#registerModal").modal("show");
		}
		
		function checkModify(modifyResult){
			if(modifyResult == ''){
				return
			}
			if(parseInt(modifyResult)>0){
				$(".modal-body").html("게시글 " + parseInt(modifyResult) +"번 수정이 완료되었습니다.");
			}
			$("#modifyModal").modal("show");
		}
		
		function removeModal(remove){
			if(remove == ''){
				return
			}
			if(parseInt(remove)>0){
				$(".modal-body").html("게시글 " + parseInt(remove) +"번이 삭제되었습니다.");
			}else{
				$(".modal-body").html("게시글 " + parseInt(remove) +"번 삭제에 실패하였습니다.");
			}
			$("#removeModal").modal("show");
		}
		
		var actionForm = $("#action_form");
		
		$(document).on("click",".page_item a",function(e){
			e.preventDefault();
			console.log("click");
			actionForm.find("input[name=pageNum]").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(document).on("click",".move", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href") + "'>");
			actionForm.attr("action", "/board/lookup");
			actionForm.submit();
		});
		
		$(document).on("click", "#amount-item a",function(e){
			e.preventDefault();
			console.log("click");
			actionForm.find("input[name=amount]").val($(this).attr("href"));
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		
		$(document).on("click","#searchBtn", function(e){
			
			if(!searchForm.find("input[name=keyword]").val()){
				alert("검색어를 입력하세요.");
				return false;
			}
			
			searchForm.find("input[name=pageNum]").val("1");
			e.preventDefault();
			searchForm.submit();
		});
		
		

	
		
</script>

</body>

</html>