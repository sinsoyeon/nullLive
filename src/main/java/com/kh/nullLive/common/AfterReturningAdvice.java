package com.kh.nullLive.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AfterReturningAdvice {

	@Pointcut("execution(* com.kh.nullLive..*ServiceImpl.*(..))")
	public void allPointcut() {}
	
	@AfterReturning(pointcut="allPointcut()", returning="returnObj")
	public void afterLog(JoinPoint jp, Object returnObj) {
		String methodName = jp.getSignature().getName();
		
		if(returnObj != null) {
		System.out.println(methodName+"()메소드 리턴값 : "+returnObj.toString());
		}
	}
}
