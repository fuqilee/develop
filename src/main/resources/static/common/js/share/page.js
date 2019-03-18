/**
 * 设置分页
 * @param pags 页面json串
 * @param pagid 存放容器ID 
 * @param method 有两个用处 1 getParams+method 是获取参数的方法 2 setHtml+method 组装方法调用之后的html
 * method 这个参数是为了解决同一个js或者页面有多个分页的时候使用的，如果单个分页，可以改成简单的实现方法，可以直接把1和2的地方把方法写成自己的单一的方法即可。
 */
 function setPagging(pags,pagid,method){
	 var page=eval('('+pags+')');
	 var paging='<p>当前第'+page.curPage+'页，共有：'+page.totalPage+'页，共有'+page.totalCount+'条记录</p>     '
	   +'<ul class="paging">'
	   +'    <li>'
	   +'          <a href="javascript:paging(1,\''+method+'\');" class="adl_bt"></a>'
	   +'    </li>'
	   +'    <li><a href="javascript:paging('+(page.curPage>1?(page.curPage-1):1)+',\''+method+'\');" class="al_bt"></a></li>';
	   //选中页前面展示两页
		 if(page.curPage>2){
			 paging+='    <li><a class="" href="javascript:paging('+(page.curPage-2)+',\''+method+'\');">'+(page.curPage-2)+'</a></li>';
		 }
	 	if(page.curPage>1){
	 		paging+='    <li><a class="" href="javascript:paging('+(page.curPage-1)+',\''+method+'\');">'+(page.curPage-1)+'</a></li>';
	 	}
	   //当前页的展示
	   paging+='    <li><a class="page_active" href="javascript:paging('+page.curPage+',\''+method+'\');">'+page.curPage+'</a></li>';
	   //选中页后面面展示两页
	   if(page.curPage<page.totalPage){
	 		paging+='    <li><a class="" href="javascript:paging('+(page.curPage+1)+',\''+method+'\');">'+(page.curPage+1)+'</a></li>';
	   }
	   if(page.curPage<page.totalPage-1){
	 		paging+='    <li><a class="" href="javascript:paging('+(page.curPage+2)+',\''+method+'\');">'+(page.curPage+2)+'</a></li>';
	   }
	 	
	   paging+='    <li><a href="javascript:paging('+(page.curPage+1)+',\''+method+'\');" class="ar_bt"></a></li>'
	   +'    <li class="last-br"><a href="javascript:paging('+(page.totalPage)+',\''+method+'\');" class="adr_bt"></a></li>'
	   +'</ul>'
	   +'<label for="jump">跳转到：<input name="jump" type="text"/></label>'
	   +'<div><a href="javascript:paging(-1,\''+method+'\');">GO</a></div>';
			//把分页的东西重新设置   当一个页面有多个分页的时候此ID的作用可以区分不同的分页 id+method 
	 paging+='<div style="display:none;">'
			+'<input name="curPage" id="curPage'+method+'" value="'+page.curPage+'" type="text"/>'
			+'<input name="url" id="url'+method+'" value="'+page.url+'" type="text"/>'
			+'<input name="params" id="params'+method+'" value="'+page.params+'" type="text"/>'
			+'<input name="totalPage" id="totalPage'+method+'" value="'+page.totalPage+'" type="text"/>'
			+'<input name="method" id="method'+method+'" value="'+method+'" type="text"/>'
			+'</div>';
	 $(pagid).html(paging);
 }
 
 /**
  * 分页
  * @param pageNum
  * @param id 区分多个分页
  */
function paging(pageNum,id){
	var curPage=$('#curPage'+id).val();
	var url=$('#url'+id).val();
	var params=$('#params'+id).val();
	var totalPage=$('#totalPage'+id).val();
	var method=$('#method'+id).val();
	
	var jump=undefined;
	//查询上传文件界面
	jump=$('input[name="jump"]').eq(0).val();
	
	if(pageNum==-1){
		pageNum=jump;
	}
	if(curPage==undefined||curPage == pageNum||curPage=="")
		return;
	if(parseInt(totalPage) < parseInt(pageNum))
		pageNum=totalPage;
	var dataUrl = basePath+url;
	//在应用的js中获取参数的方法
	var data=eval('getParams'+method+'()');
	data["curPage"]=pageNum;
	 $.ajax({
		   url :dataUrl,//后台处理程序  
		   type:"post",  //数据发送方式  
		   async:true,  
		   dataType:"text", //接受数据格式            
		   data:data,
		   error: function(){
		   		//失败则不显示数据  
		   },  
		   success: function(datas){
			   if (datas != null&&datas!="") {
				   //因为使用了eval,datas就直接变成了一个Object，而不是string
				   eval('setHtml'+method+'('+datas+')');
			   }
		   }
	 });
}

//排序
function _initOrderShare(method){
	//获取排序字段
	var orderColumn = $("#orderColumn").val();
	var orderType = $("#orderType").val();
	//多字段排序情况下，排序字段按照aa,bb规则组成
	var column = orderColumn.split(",");
	var type = orderType.split(",");
	//遍历th,为排序的th添加样式
	$("th").each(function(){
		var id = $(this).attr('data-type');
		if(column!=undefined&&column.length>0){
			for (var i = 0; i < column.length; i++) {
				//th id和排序字段比较，相同情况下，则为th添加样式
				if(id == column[i]){
					//根据排序类型添加不同样式
					if(type[i]=='asc'||type[i]=='ASC'){
						$(this).attr('class','sorting ascIcon');
					}else if(type[i]=='desc'||type[i]=='DESC'){
						$(this).attr('class','sorting descIcon');
					}else{
						$(this).attr('class','sorting ascIcon');
					}
				}
			}
		}
	});
	
	//点击排序th时，改变th样式同时向排序隐藏域保存排序条件
	$(".sorting").each(function(){
		var htmlStr = $(this).html();
		$(this).html("<i></i>"+htmlStr);
		
		$(this).click(function(){
			var c_temp = [];//临时存数排毒字段
			var t_temp = [];//临时存储排序类型
			var c = $("#orderColumn").val();//获取当前已存在的排序字段
			var t = $("#orderType").val();//获取已存在的排序类型
			
			var $id = $(this).attr('data-type');//获取点击的列id
			var classText = $(this).attr('class');//获取点击th当前样式
			
			c_temp.push($id);//将点击列的id存入临时排序字段
			//class中存在ascIcon则说明该th已经按照asc排序，点击后，改编为desc样式
			if(classText.indexOf('ascIcon')!=-1){
				$(this).attr('class','sorting descIcon');
				t_temp.push('desc');
			}else{
				//请他情况则点击后一律变为asc排序样式
				$(this).attr('class','sorting ascIcon');
				t_temp.push('asc');
			}
			//将已存在的排序字段存到临时排序字段中
			if(c!=undefined&&c!=''){
				var c_arr = c.split(",");
				var t_Arr = t.split(',');
				for (var i = 0; i < c_arr.length; i++) {
					//排除和当前点击列id相同的部分
					if(c_arr[i]!=$id){
						c_temp.push(c_arr[i]);
						t_temp.push(t_Arr[i]);
					}
				}
			}
			//将临时排序字段中的内容再保存到排序隐藏域字段中
			$("#orderColumn").val(_getOrderParamShare(c_temp));
			$("#orderType").val(_getOrderParamShare(t_temp));
			
			method = eval(method);
			method.call(this);
			//search();
		});
	});
}
function _getOrderParamShare(param){
	var str = '';
	if(param!=undefined){
		for (var i = 0; i < param.length; i++) {
			if(param[i]!=''){
				if(i!=0){
					str = str+','+param[i];
				}else{
					str = str+param[i];
				}
			}
		}
	}
	return str;
}


/**
	 * 筛选条件区域按钮点击事件
	 * currentObj:当前对象；code选中值；inputid：input的ID
	 * 我的思路：我仍然使用的是form表单查询，只是把input隐藏了，当点击事件时把code赋给input
	*/
 function _chooseBtnShare(currentObj,code,inputid){
	//删除兄弟节点的active类
	$(currentObj).siblings('div').removeClass('active');
	$(currentObj).addClass('active');
	$('#'+inputid).val(code);
	findBaseInfo();
} 
//筛选条件区域展开收起按钮触发事件
function _IsShowShare(currentObj){
	var flag = $(currentObj).attr("id");
	if(flag=='show'){
		$(currentObj).attr("id","notShow");
		$("#searchFormID").css("display","none");
		$(currentObj).html("展开 ⋁");
	}
	if(flag=='notShow'){
		$(currentObj).attr("id","show");
		$("#searchFormID").css("display","block");
		$(currentObj).html("收起 ⋀");
	}
};
/**
 * 排列顺序ascdesc排列顺序的方式例如：【onclick="queryOrderBy(this,'asc','findBaseInfo')"】 
 * currentObj:当前对象
 * ascdesc：升序降序【asc，desc】
 * methodName：方法名称
 */
function queryOrderBy(currentObj,ascdesc,methodName){
	//删除兄弟节点的active类
	$(currentObj).siblings('input').removeClass('order_active');
	$(currentObj).addClass('order_active');
	var columnname=$('#orderCondition').val();
	var orderbyContent=columnname + ' ' +ascdesc;
	$('#orderby').val(orderbyContent);
	eval(methodName+'()');
}

