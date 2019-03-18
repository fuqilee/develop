//初始化界面
	$(function(){
		queryJson();
	});
	
	function queryJson(){
		 var dataUrl='/TestOne/toJson.do';
		 var data={};
		 data["id"]=1;//前台表单数据 后台可以用user.getId()获取
		//序列化表单元素，返回json数据  
		//var data = $("#userForm").serializeArray();
		 $.ajax({
			   url :dataUrl,//后台处理程序  
			   type:"post",  //数据发送方式  
			   async:true,  
			   dataType:"text", //接受数据格式            
			   data:data,
			   success: function(datas){//执行成功后
				   if (datas != null) {
					  var result=eval('('+datas+')');
					  var html='';
					  html='<span>userName:'+result.enterpriseName+'</span>';
					  $('#disId').html(html);
					  $('#disId').click(function(){
						  exitUser(result);
					  });
				   }
			   }
		 });
	}
	
	function exitUser(user){
		 var dataUrl='/TestOne/exitUser.do';
		 var data={};
		data["id"]=user.id;
		//序列化表单元素，返回json数据  
		//var data = $("#userForm").serializeArray();
		 $.ajax({
			   url :dataUrl,//后台处理程序  
			   type:"post",  //数据发送方式  
			   async:true,  
			   dataType:"text", //接受数据格式            
			   data:data,
			   success: function(datas){//执行成功后
				   if (datas != null&&datas=='000') {
					 alert('退出成功！');
				   }
			   }
		 });
	}