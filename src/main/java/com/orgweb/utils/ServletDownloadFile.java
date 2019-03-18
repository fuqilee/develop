package com.orgweb.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class ServletDownloadFile {
	private static final Logger log = Logger.getLogger(ServletDownloadFile.class);

	public Boolean downloadFile(String path, String documentName,HttpServletResponse response){
		boolean res = true;
		
	    InputStream fis = null;
        OutputStream toClient = null;
        try {
			// path是指欲下载的文件的路径。
	        File file = new File(path);
	        if (!file.exists()) {
	            response.sendError(404, "File not found!");
	            res = false;
	        }else{
		        // 取得文件名。
		        String filename = file.getName();
		        if(documentName!=null&&!"".equals(documentName)){
		        	filename = documentName;
		        }
		        // 取得文件的后缀名。
		        //String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
	       
		        // 以流的形式下载文件。
	        	fis = new BufferedInputStream(new FileInputStream(path));
		        byte[] buffer = new byte[fis.available()];
				
		        fis.read(buffer);
		        fis.close();
		        // 清空response
		        response.reset();
		        response.setCharacterEncoding("utf-8");
		        // 设置response的Header
		        response.setContentType("text/html");
		        response.setHeader("Content-Disposition","attachment; filename="+java.net.URLEncoder.encode(filename, "UTF-8"));  
		        toClient = new BufferedOutputStream(response.getOutputStream());
		        toClient.write(buffer);
		        toClient.flush();
		        toClient.close();
	        }
        } catch (IOException e) {
			e.printStackTrace();
			log.info("文档下载异常",e);
			res = false;
		}finally{
			if(fis!=null){
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
					log.info("关闭流异常",e);
					res = false;
				}
			}
			if(toClient!=null){
				try {
					toClient.close();
				} catch (IOException e) {
					e.printStackTrace();
					log.info("关闭流异常",e);
					res = false;
				}
			}
		}
        return res;
	}
}
