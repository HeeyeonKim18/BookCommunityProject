<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">게시글 등록 완료</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
                </div>         
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">게시글 수정 완료</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
                </div>         
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="failModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">게시글 수정 실패</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
                </div>         
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="removeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">게시글 삭제</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
                </div>         
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="removeMemberModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">비밀번호 입력</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">탈퇴를 희망하시면 비밀번호를 입력해주세요.
                 <input type="password" name ="userpw" class="form-control" id="pw_input"></div>
                
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="submit" id="removeMember" data-dismiss="modal">완료</button>
                </div>  
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">댓글 작성</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
					<div class="form-group">
						<div class="col-sm-13 mb-sm-1">
							<label><strong>댓글</strong></label>
							<input type="text" class="form-control" 
							name="reply" value='작성하기'>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-13 mb-sm-1">
							<label><strong>작성자</strong></label>
							<input type="text" class="form-control" 
							name="replyer" value='작성자'>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-13 mb-sm-1">
							<label><strong>작성일</strong></label>
							<input type="text" class="form-control" 
							name="replyDate" value=''>
						</div>
					</div>
                <div class="modal-footer">
                    <button class="btn btn-warning" type="button" id="replyModBtn" data-dismiss="modal">수정하기</button>
                    <button class="btn btn-danger" type="button" id="replyDelBtn" data-dismiss="modal">삭제하기</button>
                    <button class="btn btn-primary" type="button" id="replyEnBtn" data-dismiss="modal">등록하기</button>
                </div>  
            </div>
        </div>
    </div>
  </div>
    
     <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/member/login">Logout</a>    
                </div>         
            </div>
        </div>
    </div>
    
    
    
   