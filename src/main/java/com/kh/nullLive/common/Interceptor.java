package com.kh.nullLive.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {
	
	// 컨트롤러보다 먼저 수행되는 메소드
	/*
	 * @Override public boolean preHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler) throws Exception {
	 * 
	 * HttpSession session = request.getSession(); Object obj =
	 * session.getAttribute("loginUser");
	 * 
	 * if(obj == null) { System.out.println("loginUser가 없습니다.");
	 * response.sendRedirect("loginPage.me"); return false; }
	 * 
	 * return true; }
	 * 
	 * // 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메소드
	 * 
	 * @Override public void postHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, ModelAndView modelAndView)
	 * throws Exception { System.out.println("post handle...."); }
	 */
	
}
