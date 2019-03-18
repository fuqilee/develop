package com.orgweb.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

@Configuration
public class ConfigUtils {
	@Autowired
	private Environment env;
	
	public  String getPropertyByName(String name){
		String content=env.getRequiredProperty(name);
		return content;
	}
}
