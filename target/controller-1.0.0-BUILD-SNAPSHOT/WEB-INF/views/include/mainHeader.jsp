<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                        id="searchForm" action="/main" method="get">
                       <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                       <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                       <input type="hidden" name="type" value="TW" <c:out value="${pageMaker.cri.type eq 'TW'? 'selected':''}"/>>
                       <div class="input-group">
                       <input type="text" class="form-control bg-light border-0 small" placeholder="Search for title or id"
                        aria-label="Search" aria-describedby="basic-addon2" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>">
                       	<div class="input-group-append">
                           <button class="btn btn-primary" type="button" id="searchBtn">
                                    <i class="fas fa-search fa-sm"></i>
                           </button>
                       	</div>
                       </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - User Information -->
                        <c:if test="${member == null}">
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="/member/login">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">login</span>
                            </a>
                        </li>
                          <li class="nav-item dropdown no-arrow">
                             <a class="nav-link dropdown-toggle" href="/member/join">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">join</span>
                                   &nbsp; &nbsp;<img class="img-profile rounded-circle"
                                    src="/resources/img/undraw_profile.svg">
                            </a>
                         </li>
                        
                        </c:if>
                        
                         <c:if test="${member != null}">
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${member.userid}님</span>
                                <img class="img-profile rounded-circle"
                                    src="/resources/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="/logout" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                        </c:if>

                    </ul>

                </nav>
                <!-- End of Topbar -->
                


	
