var quence = new Array();//待上传的文件队列，包含切块的文件
var page = {
	file:null,//上传文件
	currentIndex:0,//当前执行位置
	shardCount:0,//分片总数
	shardSize:0,//以2MB为一个分片
	size:0,//文件总大小
	name:'',//文件名
	tempath:'',//服务器上用到的保存路径 时间戳
	openFlag:false,//是否允许运行
	succeed:0,//成功数目 
	stop:function(){
		this.openFlag=false;
	},
	start:function(){
		this.openFlag=true;
		run();
	},
	init : function() {
		$("#upload").click($.proxy(this.initupload, this));
		/*$("#stop").click($.proxy(this.stop, this));
		$("#start").click($.proxy(this.start, this));*/
	},
	initupload : function() {
		if($("#file")[0].files.length==0){
			$.alert('请选择文件！');
			return ;
		}
		//初始化参数
		this.file=$("#file")[0].files[0];//上传文件
		this.currentIndex=0;//当前执行位置
		this.shardSize= 2 * 1024 * 1024, //以2MB为一个分片
		this.size=this.file.size;//文件总大小
		this.shardCount=Math.ceil(this.size / this.shardSize);//分片总数
		this.name=this.file.name;//文件名
		this.tempath=new Date().getTime();//服务器上用到的保存路径 时间戳
		this.openFlag=false;//是否允许运行
		this.succeed=0;//成功数目 
		//如果当前文件小于切片大小则不进行切片
		if(this.size<=this.shardSize){
			//封装成一个task，入列
			var task = {
					file : this.file,
					name : this.name,
					total : this.shardCount,
					tempath : this.tempath,
					index : i+1,
					encode : this.encode,
					start:start,
					end:end
			}
			quence.push(task);
		}else{
			//切块发送
			for (var i = 0; i < this.shardCount; i++) {
				//计算每一片的起始与结束位置
				var start = i * this.shardSize,
				end = Math.min(this.size, start + this.shardSize);
				//封装成一个task，入列
				var task = {
					file : this.file.slice(start, end),
					name : this.name,
					total : this.shardCount,
					tempath : this.tempath,
					index : i+1,
					encode : this.encode,
					start:start,
					end:end
				}
				quence.push(task);
			}
		}
		 doUpload();
	}
};
/**
 * 更新进度条
 */
function progressUpdate(){
	++page.succeed;
	
	var pesent=page.succeed*100/page.shardCount+"%"; 
	
	$('.progress .progress-bar').css('width',pesent);
	
	$('.progress .progress-bar sr-only').html(pesent+' 完成');
}

/**
 *  上传器，绑定一个XMLHttpRequest对象，处理分配给其的上传任务
 **/
function Uploader(name) {
	this.url = "/OrgWeb/files/uploadDocument"; //服务端处理url
	this.req = new XMLHttpRequest();
	this.tasks; //任务队列
	this.taskIdx = 0; //当前处理的tasks的下标
	this.name = name;
	this.status = 0; //状态，0：初始；1：所有任务成功；2：异常

	//上传 动作
	this.upload = function(uploader) {
		this.req.responseType = "json";

		//注册load事件（即一次异步请求收到服务端的响应）
		this.req.addEventListener("load", function() {
			//更新对应的进度条
			//progressUpdate(this.response.uuid, this.response.fileSize);
			progressUpdate();
			//从任务队列中取一个再次发送
			var task = uploader.tasks[uploader.taskIdx];
			if (task) {
				console.log(uploader.name + "：当前执行的任务编号：" + uploader.taskIdx);
				this.open("POST", uploader.url);
				this.send(uploader.buildFormData(task));
				uploader.taskIdx++;
			} else {
				console.log("处理完毕");
				uploader.status = 1;
			}
			
		});

		//处理第一个
		var task = this.tasks[this.taskIdx];
		if (task) {
			console.log(uploader.name + "：当前执行的任务编号：" + this.taskIdx);
			this.req.open("POST", this.url);
			this.req.send(this.buildFormData(task));
			this.taskIdx++;
		} else {
			uploader.status = 1;
		}
	}

	//提交任务
	this.submit = function(tasks) {
		this.tasks = tasks;
	}

	//构造表单数据
	this.buildFormData = function(task) {
		var file = task.file;
		var form = new FormData();
		form.append("data", task.file); //slice方法用于切出文件的一部分

		form.append("name", task.name);

		form.append("tempath", task.tempath);
		
		form.append("total", task.total); //总片数

		form.append("index", task.index); //当前是第几片

		form.append("encode", task.encode); //字符集
		
		return form;
	}
}
/**
 *用户点击“上传”按钮
 */
function doUpload() {
	//创建4个Uploader上传器（4条线程）
	var uploader0 = new Uploader("uploader0");
	var task0 = new Array();

	var uploader1 = new Uploader("uploader1");
	var task1 = new Array();

	var uploader2 = new Uploader("uploader2");
	var task2 = new Array();

	var uploader3 = new Uploader("uploader3");
	var task3 = new Array();

	//将文件列表取模hash，分配给4个上传器
	for (var i = 0; i < quence.length; i++) {
		if (i % 4 == 0) {
			task0.push(quence[i]);
		} else if (i % 4 == 1) {
			task1.push(quence[i]);
		} else if (i % 4 == 2) {
			task2.push(quence[i]);
		} else if (i % 4 == 3) {
			task3.push(quence[i]);
		}
	}
	//提交任务，启动线程上传
	uploader0.submit(task0);
	uploader0.upload(uploader0);
	uploader1.submit(task1);
	uploader1.upload(uploader1);
	uploader2.submit(task2);
	uploader2.upload(uploader2);
	uploader3.submit(task3);
	uploader3.upload(uploader3);

	//注册一个定时任务，每3秒监控文件是否都上传完毕
	uploadCompleteMonitor = setInterval("uploadComplete()", 3000);
}

function uploadComplete(){
	var persent=$('.progress .progress-bar').css('width');
	if(persent=="100%"){
		$.alert('上传成功！',function(){
			//刷新界面
		});
	}
}
