$(function(){
	initmenu();
	//closeOrOpenMenu();
});
/**
 * 展开收起
 */
function closeOrOpenMenu(){
	//初始的时候展现
	$('.le_left_close_open a').eq(1).hide();
	// fa-arrow-right fa-arrow-left
	$('.le_left_close_open a').click(function(){
		$(this).closest('.le_left_close_open').find('a').show();
		$(this).hide();
		$(".le_left_menu").toggle(); 
		if($(".le_left_menu").css('display')=='none'){
			$('.le_left_close_open').css('margin-left','8px');
			$('.le_right').css('width','102%');
			$('.le_right').css('margin-left','-27px');
		}else{
			$('.le_left_close_open').css('margin-left','212px');
			$('.le_right').css('width','calc(100% - 184px)');
			$('.le_right').css('margin-left','');
		}
	});
}
//初始化菜单
function initmenu(){
	var roleid=$('#roleid').text().trim().replace('[','').replace(']','').split(',');
	var data=ajaxFindListSqlCache({'roleidIn':roleid},'findMenuByRoleID','',$('#loginnameid').text().trim()+"_findMenuByRoleID");
	$('.le_left_menu >ul').html('');
	if(data.code=='10001'&&data.result.length>0){
		$.each(data.result,function(index,item){
			var pid='fa-sitemap';
			if(!isEmpty(item.FUNCPID)){
				pid=item.FUNCPID;
			}
			var html='';
			html+='<li class="">';
			html+='		<a class="col-xs-11" href="'+item.FUNCLINK+'">   '; 
			html+='		 <i class="fa '+pid+'" aria-hidden="true"></i>'; 
			html+='		 <span>'+item.FUNCNAME+'</span>'; 
			html+='		</a>'; 
			html+='</li>'; 
			$('.le_left_menu >ul').append(html);
		});
	}
}