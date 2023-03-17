package com.board.aop;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogInfo {
	
	@AfterReturning("execution(* com.board.service.MemberService*.*(..))")
	public void logService() {
		log.info("Success to work: service");
	}

}
