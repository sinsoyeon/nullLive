package com.kh.nullLive.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Component
@Aspect
public class AroundAdvice {

	@Pointcut("execution(* com.kh.nullLive..*ServiceImpl.*(..))")
	public void allPointcut() {}
	
	@Around("allPointcut()")
	public Object aroundLog(ProceedingJoinPoint pj) throws Throwable {
		String methodName = pj.getSignature().getName();
		Object[] args = pj.getArgs();
		
		StopWatch sw = new StopWatch();
		System.out.println(methodName+"()메소드 실행 및 매개변수 갯수"+args.length);
		for (int i = 0; i < args.length; i++) {
			System.out.println(i+"번째 매개변수 : "+args[i].toString());
		}
		sw.start();
		
		Object obj = pj.proceed();
		
		sw.stop();
		System.out.println(methodName+"() 메소드 실행 시간 : "+sw.getTotalTimeMillis()+"(ms)");
		
		return obj;
	}
}
