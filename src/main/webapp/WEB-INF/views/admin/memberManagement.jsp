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

               <%@include file ="./include/header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                     <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-0 my-5 my-md-3 mw-120 navbar-search"
                        id="searchForm" action="/admin/memberManagement" method="get">
                       <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                       <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                       <input type="hidden" name="type" value="userid">
                       <div class="input-group">
                       <input type="text" class="form-control bg-block border-1 small" placeholder="아이디 입력..."
                        aria-label="Search" aria-describedby="basic-addon2" name="keyword">
                       	<div class="input-group-append">
                           <button class="btn btn-primary" type="button" id="searchBtn">
                                    <i class="fas fa-search fa-sm"></i>
                           </button>
                       	</div>
                       </div>
                    </form>
					
					 <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text-primary" style="display:inline-block">회원 목록</h6>
                           
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
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>이메일</th>
                                            <th>전화번호</th>
                                            <th>우편번호</th>
                                            <th>가입일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${list}" var="list">
                                    	<c:set var= 'i' value="${i+1}"/>
                                    	<tr>
                                    		<td> ${i}</td>
                                    		<td><a class="move" href="<c:out value='${list.userid}'/>"> <c:out value="${list.userid}"/></a></td>
                                    		<td><c:out value="${list.userName}"/></td>
                                    		<td><c:out value="${list.userMail}"/></td>
                                    		<td><c:out value="${list.userPhone}"/></td>
                                    		<td><c:out value="${list.userAddr1}"/></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value= '${list.regDate}'/></td>
                                    	</tr> 
                                    </c:forEach>
                                     </tbody>
                                 </table>
                                 <form id="actionForm" action="/admin/memberManagement" method="get">
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
			actionForm.append("<input type='hidden' name='userid' value='"+ $(this).attr("href") + "'>");
			actionForm.attr("action", "/admin/idGet");
			actionForm.submit();
		});
		
		$("#amount-item a").on("click", function(e){
			e.preventDefault();
			console.log("click");
			actionForm.find("input[name=amount]").val($(this).attr("href"));
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		
		$("#searchBtn").on("click", function(e){
			
			if(!searchForm.find("input[name=keyword]").val()){
				alert("검색어를 입력하세요.");
				return false;
			}
			
			searchForm.find("input[name=pageNum]").val("1");
			e.preventDefault();
			searchForm.submit();
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