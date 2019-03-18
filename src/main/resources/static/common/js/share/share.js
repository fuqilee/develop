//说明统一返回值中都含有一个code -= 10001 的时候 是正常返回，10002是异常，10003 没有查询到数据 asyncFlag同步为false，异步为true，默认同步
//任何可以后台执行的方法
function ajaxGetColums(tablename,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['tablename']=tablename;
	var dataUrl=basePath+'/zbjc/findColsList';
	// 调用后台
	$.ajax({
		url :dataUrl,//后台处理程序  
		type:"post",  //数据发送方式  
		async:asyncFlag,   //同步为false,异步为true
		dataType:"text", //接受数据格式            
		data:data,
		success: function(result){//执行成功后
			var da=eval('('+result+')');
			resultdata=da;
		}
	});
	return resultdata;
}
/**
 * 
 
 * 
 * @param configParam：对象相当于map
 * @param url：调用后台的url
 * @param asyncFlag ：同步是false，异步true
 * @param returnmethod ：回执方法名
 * @returns
 */
function ajaxMethod(configParam,url,asyncFlag,returnmethod){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['configParam']=JSON.stringify(configParam);
	var dataUrl=url;
	 // 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:asyncFlag,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(result){//执行成功后
			   var da=eval('('+result+')');
			   resultdata=da;
			   if(returnmethod){
				 //调用回执方法，可以有也可以自己手动处理
				 eval(returnmethod+'('+result+')');
			   }
   		   }
	 });
	 return resultdata;
}
//单表操作--------
//1 增加
function ajaxAddSingleInfo(addInfo,typename,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['addInfo']=JSON.stringify(addInfo);
	data['typename']=typename;
	var dataUrl=basePath+'/share/addSingleInfo';
	 // 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:asyncFlag,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(result){//执行成功后
			   var da=eval('('+result+')');
			   resultdata=da;
   		   }
	 });
	 return resultdata;
}
//2修改
/**
 * modifyInfo：修改内容{'bs':'1'}
 * typename:修改的类型名称，对应dataConfig.pro里面的表
 * condition：是更该的条件{'id':'xxx'}
 */
function ajaxModifySingleInfo(modifyInfo,typename,condition,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['modifyInfo']=JSON.stringify(modifyInfo);
	data['condition']=JSON.stringify(condition);
	data['typename']=typename;
	var dataUrl=basePath+'/share/modifySingleInfo';
	 // 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:asyncFlag,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(result){//执行成功后
			   var da=eval('('+result+')');
			   resultdata=da;
   		   }
	 });
	 return resultdata;
}
//3删除
/**
 * typename:修改的类型名称，对应dataConfig.pro里面的表
 * condition：where条件 {id:xx,name:'zhangsan'}
 * resultdata:code 10001 就是成功的，否则失败的
 */
function ajaxDelInfo(delInfo,typename,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['condition']=JSON.stringify(delInfo);
	data['typename']=typename;
	var dataUrl=basePath+'/share/delInfo';
	 // 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:asyncFlag,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(result){//执行成功后
			   var da=eval('('+result+')');
			   resultdata=da;
   		   }
	 });
	 return resultdata;
}

//4查询list
/**
 * typename:修改的类型名称，对应dataConfig.pro里面的表
 * condition：where条件
 * asyncFlag:可选，设置是异步还是同步，true是异步，false，是同步
 * processResultMethod:处理结果的方法，可选可不选
 */
function ajaxFindList(condition,typename,processResultMethod,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['condition']=JSON.stringify(condition);
	data['typename']=typename;
	var dataUrl=basePath+'/share/findList';
	 // 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:asyncFlag,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(result){//执行成功后
			   var da=eval('('+result+')');
			   resultdata=da;
			   if(processResultMethod){
				   //调用方法，这样是为了异步处理数据设计的
				   eval(processResultMethod+'('+result+')');
			   }
   		   }
	 });
	 return resultdata;
}
//5分页查询
/**
 * typename:修改的类型名称，对应dataConfig.pro里面的表
 * condition：where条件
 */
function ajaxFindListPage(condition,typename,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['condition']=JSON.stringify(condition);
	data['typename']=typename;
	var dataUrl=basePath+'/share/findListPage';
	 // 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:asyncFlag,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(result){//执行成功后
			   var da=eval('('+result+')');
			   resultdata=da;
   		   }
	 });
	 return resultdata;
}
//6单个查询
/**
 * typename:修改的类型名称，对应dataConfig.pro里面的表
 * condition：where条件
 * asyncFlag:可选，设置是异步还是同步，true是异步，false，是同步
 * processResultMethod:处理结果的方法，可选可不选
 */
function ajaxFindSingInfo(condition,typename,processResultMethod,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['condition']=JSON.stringify(condition);
	data['typename']=typename;
	var dataUrl=basePath+'/share/findSingInfo';
	 // 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:asyncFlag,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(result){//执行成功后
			   var da=eval('('+result+')');
			   resultdata=da;
			   if(processResultMethod){
				   //调用方法，这样是为了异步处理数据设计的
				   eval(processResultMethod+'('+result+')');
			   }
   		   }
	 });
	 return resultdata;
}
//多表操作---------
//1查询list
/**
 * methodName:查询方法 
 * condition：where条件 如果没有传值 为 ''
 * paramconfig:是参数，不是用于where，而是用于mybatis   如果没有传值 为 ''
 */
function ajaxFindListSql(condition,methodName,paramconfig,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['condition']=JSON.stringify(condition);
	data['paramconfig']=JSON.stringify(paramconfig);
	data['methodName']=methodName;
	var dataUrl=basePath+'/share/findListSql';
	 // 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:asyncFlag,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(result){//执行成功后
			   var da=eval('('+result+')');
			   resultdata=da;
   		   }
	 });
	 return resultdata;
}
//1.2查询list
/**
 * sql:sql内容
 */
function ajaxFindListSqlParam(sql,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['sql']=sql;
	var dataUrl=basePath+'/share/findListSqlParam';
	// 调用后台
	$.ajax({
		url :dataUrl,//后台处理程序  
		type:"post",  //数据发送方式  
		async:asyncFlag,   //同步为false,异步为true
		dataType:"text", //接受数据格式            
		data:data,
		success: function(result){//执行成功后
			var da=eval('('+result+')');
			resultdata=da;
		}
	});
	return resultdata;
}
function ajaxDelInfoSql(condition,methodName,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['condition']=JSON.stringify(condition);
	data['methodName']=methodName;
	var dataUrl=basePath+'/share/findListSql';
	// 调用后台
	$.ajax({
		url :dataUrl,//后台处理程序  
		type:"post",  //数据发送方式  
		async:asyncFlag,   //同步为false,异步为true
		dataType:"text", //接受数据格式            
		data:data,
		success: function(result){//执行成功后
			var da=eval('('+result+')');
			resultdata=da;
		}
	});
	return resultdata;
}
//2分页查询
/**
 * methodName:查询方法 
 * condition：where条件 如果没有传值 为 ''
 * paramconfig:是参数，不是用于where，而是用于mybatis   如果没有传值 为 ''
 */
function ajaxFindListPageSql(condition,methodName,paramconfig,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['condition']=JSON.stringify(condition);
	data['paramconfig']=JSON.stringify(paramconfig);
	data['methodName']=methodName;
	var dataUrl=basePath+'/share/findListPageSql';
	 // 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:asyncFlag,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(result){//执行成功后
			   var da=eval('('+result+')');
			   resultdata=da;
   		   }
	 });
	 return resultdata;
}
/**
 * methodName:查询方法 
 * condition：where条件 如果没有传值 为 ''
 * paramconfig:是参数，不是用于where，而是用于mybatis   如果没有传值 为 ''
 */
function ajaxFindListPageSqlOutWhere(condition,methodName,paramconfig,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['condition']=JSON.stringify(condition);
	data['paramconfig']=JSON.stringify(paramconfig);
	data['methodName']=methodName;
	var dataUrl=basePath+'/share/findListPageSqlOutWhere';
	 // 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:asyncFlag,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(result){//执行成功后
			   var da=eval('('+result+')');
			   resultdata=da;
   		   }
	 });
	 return resultdata;
}
//3单个查询
/**
 * methodName:查询方法 
 * condition：where条件 如果没有传值 为 ''
 * paramconfig:是参数，不是用于where，而是用于mybatis   如果没有传值 为 ''
 */
function ajaxFindSingleInfoSql(condition,methodName,paramconfig,processResultMethod,asyncFlag){
	if(!asyncFlag){
		asyncFlag=false;
	}
	var resultdata=null;
	var data={};
	data['condition']=JSON.stringify(condition);
	data['paramconfig']=JSON.stringify(paramconfig);
	data['methodName']=methodName;
	var dataUrl=basePath+'/share/findSingleInfoSql';
	 // 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:asyncFlag,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(result){//执行成功后
			   var da=eval('('+result+')');
			   resultdata=da;
			   if(processResultMethod){
				   //调用方法，这样是为了异步处理数据设计的
				   eval(processResultMethod+'('+result+')');
			   }
   		   }
	 });
	 return resultdata;
}

//获取表单数据
function getFormData(formid){
	var data={};
	var array =$('#'+formid).serializeArray(); 
	array.forEach(function(sitem,index){
		data[sitem.name]=sitem.value;
	});
	return data;
}
/**
 * 显示详情页面
 * @param formid:form 表单的id
 * @param resultData 填充的数据
 */
function displayFormData(formid,data){
	if(!isEmpty(data)){
		$.each(Object.keys(data),function(index,key){
			$('#'+formid).find('[name='+key+']').val(data[key]);
		});
	}
}

//提交表单
function onsubmits(formid){
	var bv=$('#'+formid).data('bootstrapValidator');
	//bv.isValid() 为true的时候是通过，false的时候不通过
	//手动验证，此验证之后，如果不通过界面会有红字出现
	bv.validate();
	if(!bv.isValid()){
		//验证不通过
		return true;
	}else{
		return false;
	}
}

function validateForm(formid,tablelist){
	if($('#'+formid).data('bootstrapValidator')!=undefined ){
		$('#'+formid).data('bootstrapValidator',null);
	}
	 //头部信息
	 var title=""+
		"		$('#"+formid+"').bootstrapValidator({  \n  " +
		"			message:'this value is not valid',        \n    "+
		"			feedbackIcons:{                           \n    "+
		"				valid:'glyphicon glyphicon-ok',        \n     "+
		"				invalid:'glyphicon glyphicon-remove',  \n     "+
		"				invalid:'glyphicon glyphicon-refresh'   \n    "+
		"			},                                          \n  "+
		"			fields:{                                    \n  ";
	 //尾部信息
	 var end="	} \n";
	 end+="}).on('sucess.form.bv',function(e){e.preventDefault();});";
	 //中间信息，中间的是字段
	 var middle='';
	 $.each(tablelist,function(index,typename){
		 var gm=ajaxClomns(typename,formid);
		 if(gm){
			 if(middle!=''){
				 middle+=",";
		   	 }
			 middle+= gm; 
		 }
		 
	 });
	 if($('#'+formid).data('bootstrapValidator')!=undefined ){
		 $('#'+formid).data('bootstrapValidator',null);
	 }
	 var allhtml=title+middle+end;
	 eval(allhtml);
	 return allhtml;
}

//获取
function ajaxClomns(typename,formid){
	var colList='';
	var data={};
	data["typename"]=typename;
	//后台查询获取fields
	var dataUrl=basePath+'/share/findValidators';
	// 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:false,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(da){//执行成功后
			   var result=eval('('+da+')');
		   	   if(result.code=='10001'){
		   		 var columns=result['result'];
		   		colList=getHtml(columns,formid);
		   	   }else{
		   		 console.log("查询失败请联系管理员！");
		   	   }
   		   }
	});
	return colList
}

 //界面验证
function validateInfo(typename,formid){
	 if($('#'+formid).data('bootstrapValidator')!=undefined ){
		//$('#mrqksb_add_formID').data('bootstrapValidator').destroy();
		//$('#'+formid).data('bootstrapValidator').restForm();
		$('#'+formid).data('bootstrapValidator',null);
	 }
	 /*$('#'+formid).bootstrapValidator().on('sucess.form.bv',function(e){
		 //阻止默认提交
		 e.preventDefault();
	 });*/
	 var html=""+
		"		$('#"+formid+"').bootstrapValidator({  \n  " +
		"			message:'this value is not valid',        \n    "+
		"			feedbackIcons:{                           \n    "+
		"				valid:'glyphicon glyphicon-ok',        \n     "+
		"				invalid:'glyphicon glyphicon-remove',  \n     "+
		"				invalid:'glyphicon glyphicon-refresh'   \n    "+
		"			},                                          \n  "+
		"			fields:{                                    \n  ";
		var data={};
		data["typename"]=typename;
		//后台查询获取fields
    	var dataUrl=basePath+'/share/findValidators';
    	// 调用后台
    	 $.ajax({
    		   url :dataUrl,//后台处理程序  
    		   type:"post",  //数据发送方式  
    		   async:false,   //同步为false,异步为true
    		   dataType:"text", //接受数据格式            
    		   data:data,
    		   success: function(da){//执行成功后
    			   var result=eval('('+da+')');
    		   	   if(result.code=='10001'){
    		   		 var childhtml='';
    		   		 var mrqk=result['result'];
    		   		 if(childhtml!=''){
    		   			childhtml+=",";
    		   		 }
    		   		  childhtml=getHtml(mrqk,formid,childhtml);
    		   		  html+=childhtml; 
    		   	   }else{
    		   		 console.log("查询失败请联系管理员！");
    		   	   }
       		   }
    	 });
		
		html+="	} \n"+
		"});";
	 eval(html);
	 return html;
} 
//界面验证
function validateInfoAdd(typename,formid){
	/*if($('#'+formid).data('bootstrapValidator')!=undefined ){
		//$('#mrqksb_add_formID').data('bootstrapValidator').destroy();
		$('#'+formid).data('bootstrapValidator',null);
	}*/
	var data={};
	data["typename"]=typename;
	//后台查询获取fields
	var dataUrl=basePath+'/share/findValidators';
	// 调用后台
	$.ajax({
		url :dataUrl,//后台处理程序  
		type:"post",  //数据发送方式  
		async:false,   //同步为false,异步为true
		dataType:"text", //接受数据格式            
		data:data,
		success: function(da){//执行成功后
			var result=eval('('+da+')');
			if(result.code=='10001'){
				var mrqk=result['result'];
				getHtmlAdd(mrqk,formid);
			}else{
				console.log("查询失败请联系管理员！");
			}
		}
	});
	
} 
//获取字段配置信息，根据配置信息增加校验
function getHtmlAdd(infos,formid){
	var html='';
	$.each(infos,function(index,item){
		var validateStr='';
		var valsHtml='';
		//字段名称
		var name=item['COLUMNENAME'];
		//dataType
		var dataType=item['DATATYPE'];
		////枚举内容menuType
		var menuType=item['MENUTYPE'];
		//是否为空
		var isNull=item['ISNULL'];
		//自定义匹配内容 正则表达式
		var matchInfo=item['MATCHINFO'];
		//正则提示信息
		var alertInfo=item['ALERTINFO'];
		//最大最小
		var stringLength=item['STRINGLENGTH'];
		 //首先判断字段是否存在文本框,如果存在才加校验
		 if($('#'+formid+' [name='+name+']').length>0 && $('#'+formid+' [name='+name+']').prop('type')!='hidden'){
			 //校验头部
			 validateStr+="  			 { \n ";
			 validateStr+="  			   validators:{  \n ";
			 
			 
			//是否为空
			if(isNull=='0'){
				if(valsHtml!=''){
					valsHtml+=", \n  ";
				}
				valsHtml+="  			      notEmpty:{  \n";
				valsHtml+="  			          message:'不能为空！' \n";
				valsHtml+="  			      }";
			}
			//最长最短
			if(stringLength!='' && stringLength !=undefined && stringLength != 'undefined'){
				var ss=stringLength.split(",");
				if(ss.length==2){
					if(valsHtml!=''){
						valsHtml+=", \n  ";
					}
					valsHtml+="  			      stringLength:{  \n";
					valsHtml+="  			          min: "+ss[0]+",  \n";
					valsHtml+="  			          max: "+ss[1]+",  \n";
					valsHtml+="  			          message:'长度在"+ss[0]+"到"+ss[1]+"位之间！' \n";
					valsHtml+="  			      }";
				}
			}
			//正则表达式
			if(matchInfo!=null  && alertInfo!=null && matchInfo!='' && alertInfo !=''){
				if(valsHtml!=''){
					valsHtml+=", \n  ";
				}
				valsHtml+="  			      regexp:{ \n ";
				valsHtml+="  			         regexp:"+matchInfo+", \n ";
				valsHtml+="   			        message:'"+alertInfo+"' \n ";
				valsHtml+="   			     } ";
			}else {
			    //其他数据类型
				//增加对身份证的验证 
				if(dataType=="SF"){
					if(valsHtml!=''){
						valsHtml+=", \n  ";
					}
					valsHtml+="  			      creditCard:{\n ";
					valsHtml+="   			        message:'身份证格式不正确！'\n ";
					valsHtml+="   			     } ";
				}
				else if((dataType=="L"||dataType=="I")){
					if(valsHtml!=''){
						valsHtml+=", \n  ";
					}
					valsHtml+="    			    regexp:{ \n ";
					valsHtml+="    			        regexp:/^[0-9]\\d*$/,\n ";
					valsHtml+="    			        message:'必须是正整数' \n ";
					valsHtml+="    			    } ";
				}else if(dataType=="D"){
					if(valsHtml!=''){
						valsHtml+=", \n  ";
					}
					valsHtml+="   			     numeric:{\n ";
					valsHtml+="   			         message:'请输入正确的数字'\n ";
					valsHtml+="    			    } ";
				}else if(dataType=="C"){
					if(valsHtml!=''){
						valsHtml+=", \n  ";
					}
					valsHtml+="   			     regexp:{\n ";
					valsHtml+="   			        regexp:/^\\d+(\\.\\d+)?$/,\n ";
					valsHtml+="   			        message:'请输入正确的金额！'\n ";
					valsHtml+="    			    } ";
				}else if(dataType=="TD"){
					if(valsHtml!=''){
						valsHtml+=", \n  ";
					}
					valsHtml+="    			    date:{\n ";
					valsHtml+="    			       format:'YYYY-MM-DD',\n ";
					valsHtml+="    			       message:'请输入正确的日期'\n ";
					valsHtml+="    			    } ";
				}else if(dataType=="T"){
					if(valsHtml!=''){
						valsHtml+=", \n  ";
					}
					valsHtml+="   			     date:{\n ";
					valsHtml+="    			         format:'YYYY-MM-DD HH:mm:ss',\n ";
					valsHtml+="   			         message:'请输入正确的日期'\n ";
					valsHtml+="    			    }\n ";
				}
		 	}
			
			//中间加上内容
			 validateStr+=valsHtml;
			if(valsHtml!=''){
				valsHtml+=" \n ";
			}
			//最后的数据
			validateStr+="   			  }\n ";
			validateStr+="	      }\n ";
			/*console.log(validateStr);
			console.log("----------------------");*/
			var v=eval('('+validateStr+')');
			//console.log(v);
			if(Object.keys(v).length>0){
				$('#'+formid).bootstrapValidator('addField',name,v);
			}
		 }
	});
	return html;
}
//获取字段配置信息，根据配置信息增加校验
function getHtml(infos,formid,childhtml){
	var html='';
	$.each(infos,function(index,item){
		var validateStr='';
		var valsHtml='';
		//字段名称
		var name=item['COLUMNENAME'];
		//dataType
		var dataType=item['DATATYPE'];
		////枚举内容menuType
		var menuType=item['MENUTYPE'];
		//是否为空
		var isNull=item['ISNULL'];
		//自定义匹配内容 正则表达式
		var matchInfo=item['MATCHINFO'];
		//正则提示信息
		var alertInfo=item['ALERTINFO'];
		//最大最小
		var stringLength=item['STRINGLENGTH'];
		//如果已经存在name，跳过去
		if(childhtml&&childhtml.indexOf(" "+name+":{")>=0){
			return false;
		}
		 //首先判断字段是否存在文本框,如果存在才加校验
		 if($('#'+formid+' [name='+name+']').length>0 && $('#'+formid+' [name='+name+']').prop('type')!='hidden'){
			 //校验头部
			 validateStr+="  			 "+name+":{ \n ";
			 validateStr+="  			   validators:{  \n ";
			 
			 
			//是否为空
			if(isNull=='0'){
				if(valsHtml!=''){
					valsHtml+=", \n  ";
				}
				valsHtml+="  			      notEmpty:{  \n";
				valsHtml+="  			          message:'不能为空！' \n";
				valsHtml+="  			      }";
			}
			//最长最短
			if(stringLength!='' && stringLength !=undefined && stringLength != 'undefined'){
				var ss=stringLength.split(",");
				if(ss.length==2){
					if(valsHtml!=''){
						valsHtml+=", \n  ";
					}
					valsHtml+="  			      stringLength:{  \n";
					valsHtml+="  			          min: "+ss[0]+",  \n";
					valsHtml+="  			          max: "+ss[1]+",  \n";
					valsHtml+="  			          message:'长度在"+ss[0]+"到"+ss[1]+"位之间！' \n";
					valsHtml+="  			      }";
				}
			}
			//正则表达式
			if(matchInfo!=null  && alertInfo!=null && matchInfo!='' && alertInfo !=''){
				if(valsHtml!=''){
					valsHtml+=", \n  ";
				}
				valsHtml+="  			      regexp:{ \n ";
				valsHtml+="  			         regexp:"+matchInfo+", \n ";
				valsHtml+="   			        message:'"+alertInfo+"' \n ";
				valsHtml+="   			     } ";
			}else {
			    
		 	}
			//其他数据类型
			//增加对身份证的验证 
			if(dataType=="SF"){
				if(valsHtml!=''){
					valsHtml+=", \n  ";
				}
				valsHtml+="  			      creditCard:{\n ";
				valsHtml+="   			        message:'身份证格式不正确！'\n ";
				valsHtml+="   			     } ";
			}
			else if((dataType=="L"||dataType=="I")){
				/*if(valsHtml!=''){
					valsHtml+=", \n  ";
				}
				valsHtml+="    			    regexp:{ \n ";
				valsHtml+="    			        regexp:/^[0-9]\\d*$/,\n ";
				valsHtml+="    			        message:'必须是整数' \n ";
				valsHtml+="    			    } ";*/
				if(valsHtml!=''){
					valsHtml+=", \n  ";
				}
				valsHtml+="callback:{  \n  ";
				valsHtml+="    			        message:'必须是正整数', \n ";
				valsHtml+="    			   		callback:function(value,validator){ \n ";
				valsHtml+="    			        	var regexp=/^[0-9]*[0-9]*$/;\n ";
				valsHtml+="    			            if(!value){return true;}        	\n ";
				valsHtml+="    			        	return regexp.test(value);\n ";
				valsHtml+="    			    	} ";
				valsHtml+="          } ";
			}else if(dataType=="D"){
				if(valsHtml!=''){
					valsHtml+=", \n  ";
				}
				valsHtml+="   			     numeric:{\n ";
				valsHtml+="   			         message:'请输入正确的数字'\n ";
				valsHtml+="    			    } ";
			}else if(dataType=="C"){
				if(valsHtml!=''){
					valsHtml+=", \n  ";
				}
				/*valsHtml+="   			     regexp:{\n ";
				valsHtml+="   			        regexp:/^\\d+(\\.\\d+)?$/,\n ";
				valsHtml+="   			        message:'请输入正确的金额！'\n ";
				valsHtml+="    			    } ";*/
				valsHtml+="callback:{  \n  ";
				valsHtml+="    			        message:'请输入正确的金额！', \n ";
				valsHtml+="    			   		callback:function(value,validator){ \n ";
				valsHtml+="    			        	var regexp=/^\\d+(\\.\\d+)?$/;\n ";
				valsHtml+="    			       if(!value){return true;}  	return regexp.test(value);\n ";
				valsHtml+="    			    	} ";
				valsHtml+="          } ";
			}else if(dataType=="TD"){
				if(valsHtml!=''){
					valsHtml+=", \n  ";
				}
				valsHtml+="    			    date:{\n ";
				valsHtml+="    			       format:'YYYY-MM-DD',\n ";
				valsHtml+="    			       message:'请输入正确的日期'\n ";
				valsHtml+="    			    } ";
			}else if(dataType=="T"){
				if(valsHtml!=''){
					valsHtml+=", \n  ";
				}
				valsHtml+="   			     date:{\n ";
				valsHtml+="    			         format:'YYYY-MM-DD HH:mm:ss',\n ";
				valsHtml+="   			         message:'请输入正确的日期'\n ";
				valsHtml+="    			    }\n ";
			}
			
			/*if((dataType=="L"||dataType=="I")){
				if(valsHtml!=''){
					valsHtml+=", \n  ";
				}
				valsHtml+="callback:{  \n  ";
				valsHtml+="    			        message:'必须是整数', \n ";
				valsHtml+="    			   		callback:function(value,validator){ \n ";
				valsHtml+="    			        	var regexp=/^[0-9]\\d*$/;\n ";
				valsHtml+="    			        	return regexp.test(value);\n ";
				valsHtml+="    			    	} ";
				valsHtml+="          } ";
			}*/
			
			
			//中间加上内容
			 validateStr+=valsHtml;
			if(valsHtml!=''){
				valsHtml+=" \n ";
			}
			//最后的数据
			validateStr+="   			  }\n ";
			validateStr+="	      }\n ";
			
			if(html!=''){
				html+=','+validateStr;
			}else{
				html+=validateStr;
			}
		 }
	});
	return html;
}

//获取随机数，目前是最长获取30位
function getRandomChars(){
	var radomChars=Math.random().toString(36).substr(2,10)+Math.random().toString(36).substr(2,10)+Math.random().toString(36).substr(2,10);
	return radomChars;
}
//获取当前时间
function getCurrentDate(){
	var date=new Date();
	var currentDate=date.getFullYear()+"-"+(date.getMonth()+1>=10?date.getMonth()+1:"0"+(date.getMonth()+1))+"-"+(date.getDate()>=10?date.getDate():"0"+date.getDate());
	
	return currentDate;
}
function getCurrentTime(){
	var date=new Date();
	
	return format(date,'yyyy-MM-dd hh:mm:ss');
}


/**
 * 时间格式装换 format 方法
 * 
 * @param date			时间
 * @param dateformat	格式化(yyyy-MM-dd hh:mi:ss)
 * 
 * @example 调用 new Date().format("yyyy-MM-dd hh:mi:ss")
 */
function format(date, dateformat)
{
	 //为空返回空串
	 if (isNaN(date)){
		return ""; 
	 }
	 
     var format = dateformat;
     var o = {
         "M+": date.getMonth() + 1,
         "d+": date.getDate(),
         "h+": date.getHours(),
         "m+": date.getMinutes(),
         "s+": date.getSeconds(),
         "q+": Math.floor((date.getMonth() + 3) / 3),
         "S": date.getMilliseconds()
     };
     if (/(y+)/.test(format))
     {
         format = format.replace(RegExp.$1, (date.getFullYear() + "")
     .substr(4 - RegExp.$1.length));
     }
     for (var k in o)
     {
         if (new RegExp("(" + k + ")").test(format))
         {
             format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
         : ("00" + o[k]).substr(("" + o[k]).length));
         }
     }
     return format;
}
//如果有了html，但是没有name和id，则在此处赋值
function setName(){
	var data={};
	data['ZAIWJGS']='在位军官';
	data['ZAIWSGS']='在位士官';
	data['ZAIWYWBS']='在位义务兵';

	var keys=Object.keys(data);
	//console.log(keys);

	//var spans=$('#jbxx .form-group label span');
	var spans=$('.base_info_zhjg .form-group>label>span');
		$.each(spans,function(index,item){
			var name=$(item).html().trim().substr(0,$(item).html().trim().indexOf('：'));
			$.each(keys,function(num,key){
				//如果标签中含有状态
				if(name==data[key]){
					//查询标签中含有运行状态的字段
					var select =$(item).parent().next().find('select,input,textarea');
					$(select).attr('name',key);
					console.log($(select).prop('name'));
				}
			});		
		});

}

//初始化form表单
//初始化信息parentElement 可能是form表单，也可能是其他元素
function updateChildFormInfo(parentElement,condition,typename){
	//展示数据
	var data=ajaxFindSingInfo(condition,typename);
	if(data.result!=undefined&&Object.keys(data.result).length>0){
		$.each(Object.keys(data.result),function(index,item){
			var value=data.result[item];
			//设置不可少
			$(parentElement).find('[name='+item+']').val(value);
		});
	}
	return data;
}
//根据数据更新表单
function updateChildFormInfoByData(parentElement,data){
	//展示数据
	if(data!=undefined&&Object.keys(data).length>0){
		$.each(Object.keys(data),function(index,item){
			var value=data[item];
			//设置不可少
			$(parentElement).find('[name='+item+']').val(value);
		});
	}
	return data;
}

//日期弹出框
function displayDateInfo(obj){
	var times=$(obj).closest('.col-md-12').find('.inptime');
	var time_copy = {
			elem:"#testid",
			format:'YYYY-MM-DD hh:mm:ss',
			//min:laydate.now(),
			//max:"2199-06-16 23:59:59",
			istime:true,
			istoday:true,
			choose:function(datas){
				$("#mrqksb_add_formID .inptime").attr('id','')
			},
			change:function(value,date,endDate){
				$("#mrqksb_add_formID .inptime").attr('id','')
			}
		};
		if(times.eq(0).attr('id')==$(obj).attr('id')&&times.eq(1).val()!=''){
			time_copy['max']=times.eq(1).val();
		}
		if(times.eq(1).attr('id')==$(obj).attr('id')&&times.eq(0).val()!=''){
			time_copy['min']=times.eq(0).val();
		}
		laydate(time_copy);
}

/**
 * 根据type获取时间或者日期，如果是time则返回待时分秒
 * 否则就获取
 * @param type
 */
function getDateOrTime(type){
	var resultdata=null;
	var data={'type':type};
	var dataUrl=basePath+'/share/getServerDateOrTime';
	// 调用后台
	$.ajax({
		url :dataUrl,//后台处理程序  
		type:"post",  //数据发送方式  
		async:false,   //同步为false,异步为true
		dataType:"text", //接受数据格式            
		data:data,
		success: function(result){//执行成功后
			var da=eval('('+result+')');
			resultdata=da;
		}
	});
	if(resultdata.result){
		return resultdata.result;
	}else{
		return null;
	}
		
}

/**
 * 判断对象是否为空
 * @param obj
 * @returns {Boolean}
 */
function isEmpty(obj){
	if(typeof obj == "undefined" || obj== null || obj=='' || obj == "undefined"){
		return true;
	}else {
		return false;
	}
		
}

/****************************************************************升级start*/
function updateButton(){
	//updateOldToNewConfig('101','060000011','综合计划席2');
	updateOldToNewConfig('101','01050101','通信网络组');
	return ;
	var dataresult=ajaxFindListSql('','updaeFindDwnmAndXwm','');
	if(dataresult.code=='10001'&&dataresult.result.length>0){
		//return ;
		var array=dataresult.result;
		$.each(array,function(i,item){
			updateOldToNewConfig('101',item['DWNM'],item['XWM']);
		});
	}
}
//升级系统，更新模板
function updateOldToNewConfig(mblx,dwnm,xwm){
	//toConfigInfoUpdate(mblx);
	//先获取界面html
	var parentDom=$('#mrqkrb_config_form_add .modal-body');
	//查询模板的配置信息,选择复选框
	toConfigInfoUpdate(parentDom,mblx,dwnm,xwm);
	//processModalUpdate(parentDom,mblx,dwnm,xwm);
	$('#mrqkrb_config_form_add .modal-body').find('.child_con,.label_con,.row_con').css('background-color','');
	look();
	
	//直接升级
	saveModalConfigUpdate(mblx,dwnm,xwm);
	//保存模板 进行测试
	//保存的时候，先执行了预览，然后进行保存
	//$('#modalTable_mrqkrb_config').modal('show');
	/*$('#mrqkrb_config_btn').click(function(){
		//对模板101进行一个单独的逻辑处理，信息管理情况中，军兵种信息管理情况和战区信息管理情况 只能存在一个，否则给出提示
		look();
		//移除背景色
		$('#mrqkrb_config_form_add .modal-body').find('.child_con,.label_con,.row_con').css('background-color','');
		saveModalConfigUpdate(mblx,dwnm,xwm);
	});*/
}
//点击配置界面
function toConfigInfoUpdate(parentDom,mblx,dwnm,xwm){
	    $('#mrqkrb_config_form_add').html('');
	    $('#mrqkrb_config_form_add').html('<div class="modal-body" style="max-height:640px;overflow:auto"></div>');
	    $('#mrqkrb_config_form_add').bootstrapValidator('resetForm',true);
		$('#mrqkrb_config_form_add')[0].reset();
	 	var parentDom=$('#mrqkrb_config_form_add .modal-body');
	   	//加载内容
	   	initMrqkConfig(false,parentDom,mblx);
	 	//复选框控制
		checkbox_control();
		//展开
		zhankai();
	   	//增加校验
	   	//各种后续的处理1 收起，展开
	   	//显示弹出框
	   	
	   	var parentDom=$('#mrqkrb_config_form_add .modal-body');
	   	processModalUpdate(parentDom,mblx,dwnm,xwm);
}
//根据配置信息设置显示的内容
function processModalUpdate(parentDom,mblx,dwnm,xwm){
	//查询已有配置，如果存在数据则直接展示，否则展示全面的
	var paramConfig={};
	paramConfig['GNBS']=mblx;//功能标识GNBS	
	paramConfig['DWNM']=dwnm;//单位内码DWNM	
	paramConfig['XWM']=xwm;//席位名XWM	
	var dataresult=ajaxFindListSql('','findConfigListInfo',paramConfig);
	if(dataresult.code=='10001'&&dataresult.result.length>0){
		var html='';
		$.each(dataresult.result,function(index,item){
			html+=item.DISCONTENT;
    	});
		var rows=$(html);
		$.each(rows,function(num,row){
			//找到右侧的信息，并找到右侧对应目前的row
			var name=$(row).find('.left_con [type=checkbox]').eq(0).prop('name');
			var currRow=$(parentDom).find('.left_con [name='+name+']').closest('.row_con');
			//设置右侧
			var childCheckboxs=$(row).find('.right_con [type=checkbox]');
			if(childCheckboxs.length>0){
				$.each(childCheckboxs,function(index,item){
					var cn=$(item).prop('name');
					$(currRow).find('.right_con [name='+cn+']').prop('checked',true);
				});
				//如果所有的子选项都被选中，则父选项也选中
				if(childCheckboxs.length==$(currRow).find('.right_con [type=checkbox]').length){
					$(currRow).find('.left_con [name='+name+']').prop('checked',true);
				}
			}else{
				//如果没有子选项，直接选中
				$(currRow).find('.left_con [name='+name+']').prop('checked',true);
			}
		});
	}
}
//保存配置信息
function saveModalConfigUpdate(mblx,dwnm,xwm){
	//获取所有的check信息he radio
	var content=$('#mrqkrb_config_form_add .modal-body').html();
	var data={};
	var paramConfig={};
	paramConfig['GNBS']=mblx;//功能标识GNBS	
	paramConfig['DWNM']=dwnm;//单位内码DWNM	
	paramConfig['XWM']=xwm;//席位名XWM	
	data['mainConfig']=JSON.stringify(paramConfig);
	data['checkbox']=content;
	
	data["URL"]="/supplement/zbjc/saveModalConfig";
	var dataUrl='sys/supplement/tosupplement';
	 // 调用后台
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:false,   //同步为false,异步为true
		   dataType:"text", //接受数据格式            
		   data:data,
		   success: function(result){//执行成功后
			   var da=eval('('+result+')');
		   	   if(da.code=='10001'){
		   			//layer.open({content:'保存成功!'}); 
		    		//$('#modalTable_mrqkrb_config .CloseBtn').click();
		    		console.log('设置成功，对应单位：【'+dwnm+'】');
		   	   }else{
		   			console.log('设置失败，对应单位：【'+dwnm+'】');
		   			//layer.open({content:'保存失败，请联系管理员!'}); 
		   	   }
   		   }
	 });
}
/****************************************************************升级end*/
/* 隐藏和显示  20180928 start */
/**
 * element是一个jquery对象
 */
function noshow(element){
	$(element).addClass('noshow');
	$(element).removeClass('isshow');
}
function isshow(element){
	$(element).addClass('isshow');
	$(element).removeClass('noshow');
}
/* 隐藏和显示  20180928 end */
/**
 * 重置form表单
 */
function resetFormAndValidate(formid,validatorFlag){
	//初始化form
	$('#'+formid)[0].reset();
	if($('#'+formid).data('bootstrapValidator')!=undefined ){
		$('#'+formid).data('bootstrapValidator',null);
		//$('#'+formid).bootstrapValidator('resetForm',true);
		//$('#'+formid).find('small').css('display','none');
		///$('#'+formid).find('small').remove();
		$('#'+formid).find('.has-success').removeClass('has-success');
		$('#'+formid).find('.has-error').removeClass('has-error');
	}
	if(validatorFlag){
		var html= eval(formid+'ValidatorHTML');
		if(!isEmpty(html)){
			//约定好，用forid+ValidatorHTML 执行进行重新进行校验
			eval(html);
		}
	}
}
/**
 * 获取序号 bootstrap table 
 * @param value
 * @param row
 * @param index
 * @returns
 */
function getXhByRow(value, row, index){
	return index+1;
}
