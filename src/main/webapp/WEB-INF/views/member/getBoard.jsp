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

     	<%@include file ="../include/sidebar.jsp" %>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

               <%@include file ="../include/header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">
					
					 <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text-primary" style="display:inline-block">작성글</h6>
                           
							<div class="dropdown no-arrow float-right" style="display:inline-block">
									<a class="dropdown-toggle" href="#" role="button"
										id="dropdownMenuLink" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> <i
										class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
									</a>
										<div
										class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
										aria-labelledby="dropdownMenuLink" id="amount-item">
										<div class="dropdown-header">목록보기</div>
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
                                    <c:forEach items="${list}" var="list">
                                    <tbody>
                                    	<tr>
                                    		<td style="width:8%;"><c:out value="${list.bno}"/></td>
                                    		<td style="width:60%;"><a class="move" href="<c:out value='${list.bno}'/>"> <c:out value="${list.title}"/></a></td>
                                    		<td><c:out value="${list.writer}"/></td>
                                    		<td><fmt:formatDate pattern="yyyy-MM-dd" value= '${list.regDate}'/></td>
                                    		<td style="width:10%;"><c:out value="${list.views}"/></td>
                                    	</tr>
                                    </tbody>
                                    </c:forEach>
                                 </table>
                                 <form id="actionForm" action="/member/getBoard" method="get">
                                 	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                 	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
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
       							<%@include file="../include/modal.jsp" %>
    
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
				
            </div>
            <!-- End of Main Content -->
            <%@include file ="../include/footer.jsp" %>
           

<script>
$(document).ready(
			

	function(){
		
		history.replaceState({}, null, null);
		
		var actionForm = $("#actionForm");
		
		$(".page_item a").on("click",function(e){
			e.preventDefault();
			console.log("click");
			actionForm.find("input[name=pageNum]").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href") + "'>");
			actionForm.attr("action", "/member/detail");
			console.log("send it");
			actionForm.submit();
		}); 
	
		$("#amount-item a").on("click", function(e){
			e.preventDefault();
			console.log("click");
			actionForm.find("input[name=amount]").val($(this).attr("href"));
			actionForm.submit();
		});
		
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