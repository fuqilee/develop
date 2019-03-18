package com.orgweb.utils;

import org.apache.log4j.HTMLLayout;


public class Loger4JHTMLLayOut extends HTMLLayout {
	@Override
	public String getContentType() {
        return "text/html;charset=utf-8"; 
    }
}
