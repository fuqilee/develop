package com.orgweb.action;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
/*import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;*/
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.orgweb.entitydto.UploadFile;
//import com.orgweb.security.UserDto;
import com.orgweb.service.interfaces.ITableInfoColumnService;
import com.orgweb.service.interfaces.IUploadFileService;
import com.orgweb.utils.ConfigUtils;
import com.orgweb.utils.ServletDownloadFile;
/**
 * @author qlee
 * @version 1.0.0
 */
@Controller
@RequestMapping("/files")
public class UploadAction extends BaseAction {
	private static final Logger log = Logger.getLogger(UploadAction.class);
	@Autowired 
	private ConfigUtils configUtils;
	@Autowired
	private IUploadFileService uploadFileService;
	@Autowired
	private ITableInfoColumnService tableInfoColumnService;
	/**
	 * 上传
	 * @return
	 */
	@RequestMapping("/uploadForAjax")
	@ResponseBody
	public Map<String,Object> uploadFile(HttpServletRequest request,   
            HttpServletResponse response) {   
		Map<String,Object> resultMap=new HashMap<String,Object>();
        // 转型为MultipartHttpRequest：   
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request; 
        Map<String, MultipartFile> fileMap = mRequest.getFileMap();
        //根据日期在本地创建文件夹保存所要上传的文档
  		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");
  		String datestr = sdf.format(new Date());
  		try {
  			Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet().iterator();
  			while(it.hasNext()){
  	            Map.Entry<String, MultipartFile> entry = it.next();
  	            MultipartFile mFile = entry.getValue();
  	            if(mFile.getSize() != 0 && !"".equals(mFile.getName())){
  	            	//获取文件类型
  					String fileType = mFile.getContentType();
  					//为文档创建一个新的地址，以方便查询文档
  					String uploadFolder = datestr + "/" + fileType;
  				
  					//获取某个目录的绝对路径
  					//String uploadPath =getRequest().getSession().getServletContext().getRealPath(uploadFolder);
  					String uploadPath =(configUtils.getPropertyByName("uploadfilepath")+uploadFolder).replace("/", File.separator).replace("\\", File.separator);
  					// 创建目录
  					File dir=new File(uploadPath);
  					if(!dir.exists()){
						dir.mkdirs();
					}
  					String oldFileName=mFile.getOriginalFilename();
  					//为文件取一个新的名字，以便于保存到服务器上，并且不会产生名称相同的冲突
  					UUID uuid = UUID.randomUUID();
  					
  					String end=oldFileName.lastIndexOf(".")>=0?oldFileName.substring(oldFileName.lastIndexOf(".")):"";
  					
  					String newFileName = uuid.toString()+end;
  					
  					//创建一个文档，将上传文档内容保存到此文档中
  					File uploadFile = new File(uploadPath, newFileName);
  					//将内容写入文档中
  					try {
  						if(!uploadFile.exists()){
  							uploadFile.createNewFile();
  							//uploadFile.mkdir();
  						}
  						mFile.transferTo(uploadFile);
  					} catch (IllegalStateException | IOException e) {
  						e.printStackTrace();
  					} 
  					
  					/** 将文档保存信息保存到数据库中 start*/
  					Map<String,Object> uploadFileInfos=new HashMap<String,Object>();
  					//Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
  					/*UserDto udto=(UserDto) authentication.getPrincipal();
  					String name=udto.getName();
  					uploadFileInfos.put("JK_CREATOR", name);*/
  					uploadFileInfos.put("JK_CARDID", mRequest.getParameterMap().get("JK_CARDID")[0]);
  					uploadFileInfos.put("JK_REPORTTYPE", mRequest.getParameterMap().get("JK_REPORTTYPE")[0]);
  					uploadFileInfos.put("JK_FILEPATH", (uploadFolder+File.separator+newFileName).replace("\\", "/"));
  					uploadFileInfos.put("JK_FILENEWNAME",newFileName);
  					uploadFileInfos.put("JK_FILEOLDNAME",oldFileName);
  					uploadFileInfos.put("JK_FILETYPE",fileType);
  					tableInfoColumnService.addInfoForST(uploadFileInfos, "JK_UPLOAD_FILE");
  					resultMap.put("uplaodInfo", uploadFileInfos);
  					/** 将文档保存信息保存到数据库中 end*/
  	            }
  	        }
  		}catch (Exception e) {
			log.info("保存失败：",e);
			resultMap.put("code", "10002");
			return resultMap;
		} 
  		resultMap.put("code", "10001");
        // 获得文件：   
        return resultMap;  
	}
	
	/**
	 * 下载文档
	 * @return
	 */
	@RequestMapping("/downloadDocument")
	/*@ResponseBody*/
	public Map<String, Object> downloadDocument(){
		 Map<String, Object> resultMap = new HashMap<String,Object>();
		 HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		 HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
		try {
			//从前台获取数据
			String documentName = request.getParameter("documentName");//文件实际名称
			String storageLocation = request.getParameter("storageLocation");//存储位置
			//如果存储位置不为空，进行下载
			if(storageLocation!=null&&!"".equals(storageLocation)){
				String uploadConfigPath =configUtils.getPropertyByName("uploadfilepath");
				//获取文件全路径
				String uploadPath =uploadConfigPath+storageLocation;//getRequest().getSession().getServletContext().getRealPath(storageLocation);
				uploadPath=uploadPath.replace("/", File.separator).replace("\\", File.separator);
				//调用方法进行下载
				boolean res = new ServletDownloadFile().downloadFile(uploadPath,documentName,response);
				//根据结果封装返回值
				if(res){
					resultMap.put("code", "10001");
				}else{
					resultMap.put("code", "10002");
					resultMap.put("message","文档下载出现异常。");
				}
			}else{
				resultMap.put("message","获取参数信息异常！");
				resultMap.put("code","10002");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		 return resultMap;
	}
	
	
	/**
	 * 根据文件信息ID查询文件信息
	 * @throws IOException 
	 */
	@RequestMapping("/findFileInfoById")
	@ResponseBody
	public Map<String,Object> findFileInfoById() throws IOException{
		Map<String,Object> resultMap=new HashMap<String,Object>();
		try {
			UploadFile fileDto=uploadFileService.queryUploadFileById(getParameterInt("id"));
			resultMap.put("code", "10001");
			resultMap.put("dto", fileDto);
			return resultMap;
		} catch ( Exception e) {
			log.info("查询失败：",e);
			resultMap.put("code", "10002");
			return resultMap;
		}
	}
	
	/**
	 * 上传
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/uploadDocument")
	@ResponseBody
	public Map<String,Object> uploadDocument(HttpServletRequest request,   
			HttpServletResponse response) {   
		
		Map<String,Object> resultMap=new HashMap<String,Object>();
		// 转型为MultipartHttpRequest：   
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request; 
		Map<String, MultipartFile> fileMap = mRequest.getFileMap();
		resultMap.put("encode", mRequest.getCharacterEncoding());
		//根据日期在本地创建文件夹保存所要上传的文档
		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");
		String datestr = sdf.format(new Date());
		MultipartFile mFile =null;
		String uploadPath =null;
		String newFileName = null;
		try {
			Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet().iterator();
			while(it.hasNext()){
				Map.Entry<String, MultipartFile> entry = it.next();
			    mFile = entry.getValue();
				if(mFile.getSize() != 0 && !"".equals(mFile.getName())){
					log.info("上传开始："+mFile.getName());
					saveCileOfFile(mRequest, mFile, datestr);
					/*//获取文件类型
					String fileType = mFile.getContentType();
					//为文档创建一个新的地址，以方便查询文档
					String uploadFolder = "/files/"+ datestr + "/" + fileType;
					
					//获取某个目录的绝对路径
					uploadPath =getRequest().getSession().getServletContext().getRealPath(uploadFolder);
					// 创建目录
					File dir=new File(uploadPath);
					if(!dir.exists()){
						dir.mkdirs();
					}
					String oldFileName=mFile.getOriginalFilename();
					//为文件取一个新的名字，以便于保存到服务器上，并且不会产生名称相同的冲突
					UUID uuid = UUID.randomUUID();
					
					String end=oldFileName.lastIndexOf(".")>=0?oldFileName.substring(oldFileName.lastIndexOf(".")):"";
					
					newFileName = uuid.toString()+end;
					
					//创建一个文档，将上传文档内容保存到此文档中
					File uploadFile = new File(uploadPath, newFileName);
					InputStream is=null;
					InputStreamReader isr=null;
					BufferedReader br=null;
					
					OutputStream os =null;
					OutputStreamWriter osw =null;
					BufferedWriter bw =null;
					//将内容写入文档中
					try {
						if(!uploadFile.exists()){
							uploadFile.createNewFile();
							//uploadFile.mkdir();
						}
						//直接写入文档
						//mFile.transferTo(uploadFile);
						
						is=mFile.getInputStream();
						isr = new InputStreamReader(is);
						br = new BufferedReader(isr);  
						
						os = new FileOutputStream(uploadFile);  
						osw = new OutputStreamWriter(os); 
						bw = new BufferedWriter(osw);  
						String sb=null;
						while ((sb = br.readLine()) != null) {  
			                bw.write(sb);//输出字符串  
			                bw.newLine();//换行  
			                bw.flush();  
			            }  
						
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}finally {  
			            try {  
			            	//先打开先关闭，后打开后关闭
			            	bw.close();
			            	osw.close();
			            	os.close();
			            	
			                br.close();  
			                isr.close();
			            	is.close();
			            } catch (IOException e) {  
			                e.printStackTrace();  
			            }  
			        }  */
					
					
					/**** 上传数据 end*/
					/** 将文档保存信息保存到数据库中 end*/
				}
			}
		}catch (Exception e) {
			log.info("保存失败：",e);
			resultMap.put("code", "10002");
			return resultMap;
		}
		// 获得文件：   
		return resultMap;  
	}
	
	/**
	 * 保存分片数据
	 * @param request
	 * @param mFile
	 * @param datestr
	 */
	public void saveCileOfFile(HttpServletRequest request,MultipartFile mFile,
			String datestr){
		//从Request中取参数，注意上传的文件在Requst.Files中

	    String name = request.getParameter("name");

	    int total =Integer.parseInt(request.getParameter("total")) ;

	    int index = Integer.parseInt(request.getParameter("index"));//;
	    
	    long tempath = Long.parseLong(request.getParameter("tempath"));//;
	    String encode = request.getParameter("encode");//;

	    //var data = Request.Files["data"];

	    log.info("上传开始："+mFile.getName());
		
		//为文档创建一个新的地址，以方便查询文档
		String uploadFolder = "/files/" + tempath;
		
		//获取某个目录的绝对路径
		String uploadPath =getRequest().getSession().getServletContext().getRealPath(uploadFolder);
		// 创建目录
		File dir=new File(uploadPath);
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		//创建一个文档，将上传文档内容保存到此文档中
		File uploadFile = new File(uploadPath, name + "_" + index);
		InputStream is=null;
		InputStreamReader isr=null;
		BufferedReader br=null;
		
		OutputStream os =null;
		OutputStreamWriter osw =null;
		BufferedWriter bw =null;
		//将内容写入文档中
		try {
			if(!uploadFile.exists()){
				uploadFile.createNewFile();
				//uploadFile.mkdir();
			}
			//直接写入文档
			mFile.transferTo(uploadFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
	   
		/**
		 * 当接收到最后一个分片之后，合成数据
		 */
		if(index == total){
	        log.info("上传开始："+mFile.getName());
			//获取文件类型
			String fileType = mFile.getContentType();
			//为文档创建一个新的地址，以方便查询文档
			String uploadFolders = "/files/"+ datestr + "/" + fileType;
			
			//获取某个目录的绝对路径
			String uploadPaths =getRequest().getSession().getServletContext().getRealPath(uploadFolders);
			// 创建目录
			File dirs=new File(uploadPaths);
			if(!dirs.exists()){
				dirs.mkdirs();
			}
			//为文件取一个新的名字，以便于保存到服务器上，并且不会产生名称相同的冲突
			UUID uuid = UUID.randomUUID();
			
			String end=name.lastIndexOf(".")>=0?name.substring(name.lastIndexOf(".")):"";
			
			String newFileName = uuid.toString()+end;
			
			//创建一个文档，将上传文档内容保存到此文档中
			try {
				//合起来的文件
				File uploadFiles = new File(uploadPaths, newFileName);
				if(!uploadFiles.exists()){
					uploadFiles.createNewFile();
					//uploadFile.mkdir();
				}
				os = new FileOutputStream(uploadFiles);  
				osw = new OutputStreamWriter(os); 
				bw = new BufferedWriter(osw);  
				for(int i = 1;i <= total;++i){
					//分片文件
					uploadFile = new File(uploadPath, name + "_" + i);
					
					is=new FileInputStream(uploadFile);//mFile.getInputStream();
					isr = new InputStreamReader(is);
					br = new BufferedReader(isr); 
					
					String sb=null;
					while ((sb = br.readLine()) != null) {  
		                bw.write(sb);//输出字符串  
		                bw.newLine();//换行  
		                bw.flush();  
		            }  
					
					 br.close();  
		             isr.close();
		             is.close();
		             
		             uploadFile.deleteOnExit();
					
		        }
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}finally {  
	            try {  
	            	//先打开先关闭，后打开后关闭
	            	bw.close();
	            	osw.close();
	            	os.close();
	            	
	               /* br.close();  
	                isr.close();
	            	is.close();*/
	            } catch (IOException e) {  
	                e.printStackTrace();  
	            }  
	        } 

	    }
	}
	
}
