package com.orgweb.utils;

import org.apache.log4j.Logger;


public class QuartzJob {
	private static final Logger log = Logger.getLogger(QuartzJob.class);
	public void work(){
		System.out.println("----------hello");
		System.out.println("----------hello");
		log.debug("----------hello");
		
	}
}
