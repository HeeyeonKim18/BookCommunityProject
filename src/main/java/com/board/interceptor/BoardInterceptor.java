package com.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class BoardInterceptor implements HandlerInterceptor{
	
	@Override
    public boolean preHandle(HttpServletRequest request
            , HttpServletResponse response, Object handler) 
                    throws Exception {

        //세션 객체 생성
        HttpSession session=request.getSession();

        //세션이 없으면(로그인되지 않은 상태)
        if(session.getAttribute("member") == null) {

            //login 페이지로 이동
            response.sendRedirect(request.getContextPath()
                    +"/member/login");
            return false; //메인 액션으로 가지 않음
        }else {
            return true; //메인 액션으로 이동
        }
    }

}
