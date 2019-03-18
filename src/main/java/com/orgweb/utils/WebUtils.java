package com.orgweb.utils;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONException;
import org.json.JSONObject;

public class WebUtils {
	public static JSONObject SMS(String postData, String postUrl) {
		//head标记
		StringBuffer head=new StringBuffer();
		boolean headFlag=false;
		//body中的标记
		StringBuffer body=new StringBuffer();
		boolean bodyFlag=false;
		//尾部标记
		StringBuffer foot=new StringBuffer();
		boolean footFlag=false;
		JSONObject data=new JSONObject(); 
		
		//内容标记
		boolean contentFlag=false;
		
		//组装title
		StringBuffer titleBuffer=new StringBuffer();
		boolean titleFlag=false;
		//组装切换页面上一章，下一章
		StringBuffer upOrDownPageBuffer=new StringBuffer();
		try {
			// 发送POST请求
			URL url = new URL(postUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");// 修改发送方式
			conn.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			conn.setRequestProperty("Connection", "Keep-Alive");
			conn.setUseCaches(false);
			conn.setDoOutput(true);

			conn.setRequestProperty("Content-Length", "" + postData.length());
			OutputStreamWriter out = new OutputStreamWriter(
					conn.getOutputStream(), "gbk");
			out.write(postData);
			out.flush();
			out.close();

			// 获取响应状态
			if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
				data.put("code", "10001");
				return data;
			}
			// 获取响应内容体
			String line, result = "";
			BufferedReader in = new BufferedReader(new InputStreamReader(
					conn.getInputStream(), "gbk"));
			while ((line = in.readLine()) != null) {
				//System.out.println(line);
				//组装head ---start
				if(line.contains("<head>")){
					headFlag=true;
					continue;
				}
				if(line.contains("</head>")){
					headFlag=false;
					continue;
				}
				
				if(headFlag){
					head.append(line+"\n");
					continue;
				}
				//组装head ---end
				//组装body ---start
				if(line.contains("body")){
					bodyFlag=true;
					continue;
				}
				//
				if(line.contains("</body>")){
					bodyFlag=false;
					continue;
				}
				//尾部内容
				if(line.contains("footer")){
					bodyFlag=false;
					footFlag=true;
					continue;
				}
				
				if(bodyFlag){
					if(contentFlag){
						if(line.contains("</div>")){
							contentFlag=false;
						}
						body.append(line+"\n");
					}
					//此处是内容
					if(line.contains("id=\"nr1\"")){
						if(!line.contains("</div>")){
							contentFlag=true;
						}
						
						body.append(line+"\n");
					}
					//titleFlag
					if(line.contains("nr_title")){
						titleFlag=true;
						continue;
					}
					if(titleFlag){
						titleBuffer.append("<div class=\"row\" >");
						upOrDownPageBuffer.append("  <div class=\"col-xs-12\">");
						titleBuffer.append(line);
						upOrDownPageBuffer.append("  </div");
						upOrDownPageBuffer.append("</div>");
						titleFlag=false;
						continue;
					}
					
					//组装切换页面
					if(line.contains("上一章")){
						upOrDownPageBuffer.append("<div class=\"row\" style=\"margin-bottom:10px;\">");
						upOrDownPageBuffer.append("  <div class=\"col-xs-6\">");
						String href=line.substring(line.indexOf("href=\"")+6,line.lastIndexOf("\""));
						upOrDownPageBuffer.append("    <button class=\"btn btn-primary\" type=\"button\" onclick=\"upPage('"+href+"')\" id=\"upPageId\">上一章</button>");
						upOrDownPageBuffer.append("   </div>");
					}
					if(line.contains("下一章")){
						upOrDownPageBuffer.append("  <div class=\"col-xs-6\">");
						String href=line.substring(line.indexOf("href=\"")+6,line.lastIndexOf("\""));
						upOrDownPageBuffer.append("    <button class=\"btn btn-primary\" type=\"button\" onclick=\"downPage('"+href+"')\" id=\"upPageId\">下一章</button>");
						upOrDownPageBuffer.append("  </div>");
						upOrDownPageBuffer.append("</div>");
					}
					
					continue;
				}
				//组装body ---end
				//组装foot ---start
				if(line.contains("html")){
					continue;
				}
				if(footFlag){
					foot.append(line+"\n");
					continue;
				}
				//组装foot ---end
			}
			data.put("head", head.toString());
			data.put("title", titleBuffer.toString());
			data.put("body", body.toString());
			data.put("updown", upOrDownPageBuffer.toString());
			data.put("foot", foot.toString());
			in.close();
			return data;
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
	}
	public static String httpUrlConnGet(String urlStr){ 
		String result="";
        HttpURLConnection urlConnection = null;  
        URL url = null;  
        try {  
            url = new URL(urlStr);  
            urlConnection = (HttpURLConnection) url.openConnection();  
            urlConnection.connect();  
            if(urlConnection.getResponseCode()==HttpURLConnection.HTTP_OK){  
                InputStream in = urlConnection.getInputStream();  
                BufferedReader br = new BufferedReader(new InputStreamReader(in));  
                String line = null;  
                StringBuffer buffer = new StringBuffer();  
                while((line=br.readLine())!=null){  
                    buffer.append(line);  
                }  
                in.close();  
                br.close();  
                result = buffer.toString();  
               /* if(result.equals("ok")){  
                    mHandler.sendEmptyMessage(USERLOGIN_SUCCESS);  
                }else{  
                    mHandler.sendEmptyMessage(USERLOGIN_FAILED);  
                }  */
            }else{  
                
            }  
        } catch (Exception e) {  
        }finally{  
            urlConnection.disconnect();  
        }  
        return result;
    }  
	
	public static String getHtml(String path) throws Exception {
        // 通过网络地址创建URL对象
        URL url = new URL(path);
        // 根据URL
        // 打开连接，URL.openConnection函数会根据URL的类型，返回不同的URLConnection子类的对象，这里URL是一个http，因此实际返回的是HttpURLConnection
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        // 设定URL的请求类别，有POST、GET 两类
        conn.setRequestMethod("GET");
        //设置从主机读取数据超时（单位：毫秒）
        conn.setConnectTimeout(5000);
        //设置连接主机超时（单位：毫秒）
        conn.setReadTimeout(5000);
        // 通过打开的连接读取的输入流,获取html数据
        InputStream inStream = conn.getInputStream();
        // 得到html的二进制数据
        byte[] data = readInputStream(inStream);
        // 是用指定的字符集解码指定的字节数组构造一个新的字符串
        String html = new String(data, "utf-8");
        return html;
    }

    /**
     * 读取输入流，得到html的二进制数据
     * 
     * @param inStream
     * @return
     * @throws Exception
     */
    public static byte[] readInputStream(InputStream inStream) throws Exception {
    	
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len = 0;
        while ((len = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, len);
        }
        inStream.close();
        return outStream.toByteArray();
    }
}
