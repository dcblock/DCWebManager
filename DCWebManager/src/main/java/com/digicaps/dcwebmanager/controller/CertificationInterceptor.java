package com.digicaps.dcwebmanager.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class CertificationInterceptor implements HandlerInterceptor{
 
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        //UserVO loginVO = (UserVO) session.getAttribute("loginUser");
        /*
        if(ObjectUtils.isEmpty(loginVO)){
            response.sendRedirect("/moveLogin.go");
            return false;
        }else{
            session.setMaxInactiveInterval(30*60);
            return true;
        }
        */
        //String user_id = "";
        //String is_login = "";
        System.out.println("--------------------------");        
        System.out.println("인터셉트 입니다.");
		if(session.getAttribute("user_id") != null) {
			//user_id = session.getAttribute("user_id").toString();
			//is_login = session.getAttribute("is_login").toString();		
			System.out.println("로그인된 유저 입니다.");
			System.out.println("--------------------------");  
			return true;
		}
		else {
			System.out.println("로그인이 안 된 유저 입니다.");
			System.out.println("--------------------------");  
            try { response.sendRedirect("/login"); }
            catch (IOException ie ) {} //만약 리다이렉션 도중 에러가 난 경우
            return false;
		}

		
        
    }
 
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
        
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub
        
    }
 
}