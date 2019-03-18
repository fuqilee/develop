/**
 * jQuery 扩展工具包
 * @author Tasen
 * @since 2010-07-21 23:09:50
 */
(function($){
	var _data = "@SHARE_DATA",
	isDebug = true,//是否是调试状态
	PERMISSION_DENIED="您无权访问该页面",
	getLoginURL=function(){return basePath;};
	/**
	 *jQuery extend
	 */
	$.extend({
		isDebug  : isDebug,
		basePath : function (a, b, c) {
			a = document.getElementsByTagName("script");
			for (b in a)
				a[b].src && -1 !== a[b].src.indexOf("jquery.extends") && (c = a[b]);
			p = c || a[a.length - 1];
			c = p.src.replace(/\\/g, "/").replace("/js","");
			return 0 > c.lastIndexOf("/") ? "." : c.substring(0, c.lastIndexOf("/"));
		}(),
		//basePath:function(){return basePath;}(),
		/**
		 * ajax工具类
		 * {String}				required	请求路径
		 * {String || Object}	required	提交的数据
		 * {Function}			required	请求成功的回调函数
		 * {Object}				optional	ajax的标准参数
		 * 									{
		 * 										type:"post",
 		 *										dataType:"json",
 		 *										lock:true,  	//lock 是否锁屏
 		 *										sleep:0,    	//延迟(秒),本次请求的最短时间
 		 *										loading:null	//锁屏显示的内容
 		 *										waitTime:20		//锁屏时间(秒),超过该时间屏幕解锁,默认为20秒
 		 *									}
		 *
		 */
		ajaxhelper : function(url, data, callback, opts) {
			if(typeof(data) === "string"){
				data += "&t=" + new Date().getTime();
				data += "&isAjax=1";
			}
			else{
				if (!this.isPlainObject(data))
					data = {};
				data.t = new Date().getTime();
				data.isAjax = "1";
			}
			var options =  this.extend({
				dataType:"json",
				type : "post",
				async : true,
				processData : true,
				crossDomain : false,
				beforeSend : this.noop,
				error : this.noop,
				lock : true,
				sleep : 0,
				loading : null,
				waitTime : 20
			}, opts);
			//计时器
			options.start = new Date().getTime();
			//间隔值
			options.interval = function(a, b){
				a = new Date().getTime();
				b = a - this.start;
				this.start = a;
				return b;
			};
			this.ajax({
				url : this.basePath + url,
				data : data,
				dataType : options.dataType,
				type : options.type,
				async : options.async,
				processData: options.processData,
				crossDomain : options.crossDomain,
				beforeSend : function(xmlHR) {
					if(options.lock)
						$.loading(options.loading, options.waitTime);
					options.beforeSend(xmlHR);
				},
				success : function(data) {
					var t = options.sleep * 1000 - options.interval();
					setTimeout(function(){
						if(options.lock)
							$.loading.close();
						if ("json" === options.dataType && "object" !== typeof data) {
							$.alert("很抱歉,网络繁忙操作失败,请稍后重新操作!");
							options.error({status : 5000});
						} else
							callback(data);
					}, t < 0 ? 0 : t);
				},
				error : function(e) {
					console.log(e);
					options.error(e);
					if(options.lock)
						$.loading.close();
					if(e.responseText.indexOf(PERMISSION_DENIED) >= 0)
						$.alert("很抱歉,会话已过期,请重新登录后重试!",function(){
//							location.href=getLoginURL();
							parent.location.href=getLoginURL();
						});
					else
						//$.alert("很抱歉,网络繁忙操作失败,请稍后重新操作![status:"+e.status+"]");
						$.alert("很抱歉,网络繁忙操作失败,请稍后重新操作!",function(){
							location.href=getLoginURL();
							parent.location.href=getLoginURL();
						});
				}
			});
		},
		/**
		 * 调试工具
		 * {String || Object}	required	需要打印的数据
		 * {String}				optional	需要过滤的信息
		 */
		log : function(msg, filter){
			var printFlag = true;
			var print = function(msg){
				var t = new Date();
				t = t.getHours() + ":" + t.getMinutes() + ":" + t.getSeconds() + "." + t.getMilliseconds() + " - ";
				if (window.console && window.console.log) {
					window.console.log(t+msg);
				} else {
					if(printFlag)
						alert("当前浏览器不支持console对象，如果是IE请切换浏览器模式或者文档模式");
					printFlag = false;
				}
			};
			if(this.isDebug){
				if(typeof(msg) === "undefined"){
					print("undefined");
				}
				else if(typeof(msg) === "object"){
					var i = 0;
					for(var m in msg){
						if(typeof(filter) === "string"){
							if(m.indexOf(filter) >= 0 || (typeof(msg[m]) !== "object" && (msg[m]+"").indexOf(filter) >= 0)){
								print(m + ":" + (typeof(msg[m]) === "object" ? "object" : msg[m]));
								i ++;
							}
						}
						else{
							print(m + ":" + (typeof(msg[m]) === "object" ? "object" : msg[m]));
							i ++;
						}
					}
					print("total:" + i);
				}
				else{
					print(msg);
				}
			}
		},
		/**
		 * Cookie工具类
		 * {String}				required	cookie名称
		 * {String}				optional	cookie值(如果有值则设置cookie,没有则取cookie)
		 * {object}				optional	{expires:15}有效时间(单位:天)默认15天
		 */
		cookie : function(name, value, options) {
		    if (typeof value != 'undefined') { // name and value given, set cookie
		        options = options || {};

		        if (value === null) {
		            value = '';
		            options = this.extend({}, options); // clone object since it's unexpected behavior if the expired property were changed
		            options.expires = -1;
		        }
		        if(!options.expires) {
		        	options.expires = 15;
		        }
		        var expires = '';
		        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
		            var date;
		            if (typeof options.expires == 'number') {
		                date = new Date();
		                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
		            } else {
		                date = options.expires;
		            }
		            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
		        }
		        // NOTE Needed to parenthesize options.path and options.domain
		        // in the following expressions, otherwise they evaluate to undefined
		        // in the packed version for some reason...
		        var path = options.path ? '; path=' + (options.path) : '';
		        var domain = options.domain ? '; domain=' + (options.domain) : '';
		        var secure = options.secure ? '; secure' : '';
		        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
		    } else { // only name given, get cookie
		        var cookieValue = null;
		        if (document.cookie && document.cookie != '') {
		            var cookies = document.cookie.split(';');
		            for (var i = 0; i < cookies.length; i++) {
		                var cookie = jQuery.trim(cookies[i]);
		                // Does this cookie string begin with the name we want?
		                if (cookie.substring(0, name.length + 1) == (name + '=')) {
		                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
		                    break;
		                }
		            }
		        }
		        return cookieValue;
		    }
		},
		/**
		 * 预加载图片
		 * {Array}	required	预加载图片地址数组
		 * {String}	optional	{init:function(){},loaded:function(){},loadedAll:function(){}}
		 */
		preload : function (imgArr, option) {
			var setting = $.extend({
					init : function (loaded, total) {},
					loaded : function (img, loaded, total) {},
					loaded_all : function (loaded, total) {}
				}, option);
			var total = imgArr.length;
			var loaded = 0;
			setting.init(0, total);
			for (var i in imgArr) {
				imgList.push(this("<img />")
					.attr("src", imgArr[i])
					.load(function () {
						loaded++;
						setting.loaded(this, loaded, total);
						if (loaded == total) {
							setting.loadedAll(loaded, total);
						}
					}));
			}
		},
		/**
		 * 延迟执行
		 * {Number}		required	延迟的秒数
		 * {Function}	required	执行的函数
		 */
		sleep : function(second, callback){
			setTimeout(callback, second * 1000);
		},
		/**
		 * 字符串中的某个字符全部替换
		 */
		replaceAllStr : function(src, to, from){
			//第二个参数中的 g 表示全部匹配,i表示忽略大小写 RegExp("test","gi");
			var r = new RegExp(to,"g");
			return src.replace(r, from);
		},
		/**
		 * 获取当前日期
		 * @returns {String}
		 */
		getCurDate : function(){
			 var now = new Date();
			 var year = now.getFullYear();
			 var month = now.getMonth() + 1;
			 var date = now.getDate();
			 if(month<10)
				 month = "0" + month;
			 if(date<10)
				 date = "0" + date;
			 var timeVal = "";
			 timeVal = year + "-" + month + "-" + date;
			 return timeVal;
		},
		/**
		 * 获取当前日期时间
		 * @returns {String}
		 */
		getCurDatetime : function(){
			 var now = new Date();
			 var year = now.getFullYear();
			 var month = now.getMonth() + 1;
			 var date = now.getDate();
			 var hours = now.getHours();
			 var mins = now.getMinutes();
			 var secs = now.getSeconds();
			 if(month<10)
				 month = "0" + month;
			 if(date<10)
				 date = "0" + date;
			 if(hours<10)
				 hours = "0" + hours;
			 if(mins<10)
				 mins = "0" + mins;
			 if(secs<10)
				 secs = "0" + secs;
			 var timeVal = "";
			 timeVal = year + "-" + month + "-" + date + " " + hours + ":" + mins + ":" +  secs;
			 return timeVal;
		},
		/**
		 * 判断父窗体是否支持某个方法
		 * @param funcName
		 * @returns {Boolean}
		 */
		isParentSpport : function(funcName){
			return eval("window.parent." + funcName) != null;
		},
		/**
		 * 执行父窗体中的方法
		 * @param funcName
		 * @param params
		 */
		parentExec : function(funcName, params){
			if($.isParentSpport(funcName)){
				eval("window.parent." + funcName)(params);
			}
		},
		/**
		 * 格式化金额
		 * @param s 需要格式化的字符数字
		 * @param n 保留的小数位 默认 2
		 * @param prefix 前缀
		 * @returns {String}
		 */
		fmoney : function(s, n, prefix){
		   n = n > 0 && n <= 20 ? n : 2;
		   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
		   var l = s.split(".")[0].split("").reverse(),
		   r = s.split(".")[1],
		   t = "";
		   for(var i = 0; i < l.length; i ++ ) {
		      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
		   }
		   return ((prefix!=undefined ? prefix : "￥") +t.split("").reverse().join("") + "." + r).replace("-,", "-");
		},
		/**
		 * 还原格式化的金额为数字
		 * @param s
		 * @returns
		 */
		rmoney : function(s){
			var r = s.replace(/[^\d\.-]/g, "");
			return r == "" || r == "-" || r == "." ? "" : parseFloat(r);
		},
		/**
		 * 四舍五入法截取一个小数
		 * @param float digit 要格式化的数字
		 * @param integer length 要保留的小数位数
		 * @return float
		 */
		round : function(digit, length) {
		    length = length ? parseInt(length) : 0;
		    if (length <= 0) return Math.round(digit);
		    digit = Math.round(digit * Math.pow(10, length)) / Math.pow(10, length);
		    return digit;
		},
		/**
		 * 舍去法截取一个小数
		 * @param float digit 要格式化的数字
		 * @param integer length 要保留的小数位数
		 * @return float
		 */
		floor : function(digit, length) {
		    length = length ? parseInt(length) : 0;
		    if (length <= 0) return Math.floor(digit);
		    digit = Math.floor(digit * Math.pow(10, length)) / Math.pow(10, length);
		    return digit;
		},
		/**
		 * 进一法截取一个小数
		 * @param float digit 要格式化的数字
		 * @param integer length 要保留的小数位数
		 * @return float
		 */
		ceil : function(digit, length) {
		    length = length ? parseInt(length) : 0;
		    if (length <= 0) return Math.ceil(digit);
		    digit = Math.ceil(digit * Math.pow(10, length)) / Math.pow(10, length);
		    return digit;
		},
		/**
		 * @param	{String}	需要截取的字符
		 * @param	{Number}	最大长度
		 * @param	{Boolean}	是否打印document.write()
		 */
		strLimit : function(s, max, isPrint){
			var str = this.trim(s);
			if(str.length > max){
				str = str.substring(0, max - 3)+"...";
			}
			if(isPrint)
				document.write(str);
			return str;
		},

		/**
		 * 打开新窗口,浏览器不会提示有弹出窗口(提交表单的方式实现)
		 * @param url
		 */
		openNew : function(url, data){
			var h = "",d = this.extend({}, data);
			this.each(d, function(key,val){
				h += "<input type='hidden' name='"+key+"' value='"+val+"'/>";
			});
			this("body").append("<div style='display:none;'><form id='form_openNew' target='_blank' method='get'>"+h+"</form></div>");
			this("#form_openNew").attr("action", url).submit().parent().remove();
		},

		/**
		 *	根据ID,关闭Dialog,不填写ID关闭所有
		 */
		dialogClose : function(id){
			if(id){
				var d = this.dialog.list[id];
				if(typeof(d) == "object"){
					d.close();
				}
			}
			else{
				this.each(this.dialog.list, function(){
					this.close();
				});
			}
		},
		/**
		 * 弹出层,以Iframe的方式
		 * @param	{String}	url地址
		 * @param	{Object}	{id:"openId", tilte:""}不填写ID会自动生成
		 * @param	{String}	url地址
		 */
		popup : function(url, options){
			this.popup.index += 1;
			var opts = this.extend({
				id : "dialog_popup" + this.popup.index,
				lock : true,
				init : function(){
					if(this.iframe.contentWindow.document.body.innerHTML.indexOf(PERMISSION_DENIED) > -1){
						this.close();
						$.alert("很抱歉,会话已过期,请重新登录后重试!",function(){
//							location.href=getLoginURL();
							parent.location.href=getLoginURL();
						});
					}
				}
			}, options);
			return this.dialog.open(url, opts, false);
		},
		/**
		 * 基本弹出框
		 * @param	{String} 内容
		 * @param	{Object} dialog组件参数(可选)
		 * @param	{Function}	确定按钮回调函数(可选)
		 * @param	{Function}	取消按钮回调函数(可选)
		 */
		info : function (content, opts, yes, no) {
			if(yes && $.isFunction(yes))
				opts.ok = function (here) {
		            return yes.call(this, here);
		        };
			if(no && $.isFunction(no))
				opts.cancel = function (here) {
		            return no && no.call(this, here);
		        };
			var options = $.extend({
		    	title: "操作提示",
		        id: "dialog_info",
		        fixed: true,
		        lock: true,
		        opacity: .3,
		        content: content !== null && typeof content === "object" ? content : content+""
		    }, opts);
			return $.dialog(options);// this.dialog.through(options);
		},


		/**
		 * 警告
		 * @param	{String}	消息内容
		 * @param	{Function}	确定按钮回调函数
		 */
		alert : function (content, callback) {
			return $.info(content, {
		        id: "dialog_alert",
		        icon: "warning",
		        ok: true,
		        close: callback
		    });
		},
		
		/**
		 * 警告   调用ztree  遮罩层 优先级
		 * @param	{String}	消息内容
		 * @param	{Function}	确定按钮回调函数
		 */
		alerttips : function (content, callback,time) {
			return $.info(content, {
		        id: "dialog_alert",
		        //icon: "warning",
		        cancel: false,
		        title: false,
		        close: callback
		    })
			.time(time || 1.5);
		},

		/**
		 * 确认
		 * @param	{String}	消息内容
		 * @param	{Function}	确定按钮回调函数
		 * @param	{Function}	取消按钮回调函数
		 */
		confirm : function (content, yes, no) {
			return $.info(content, {
		        id: "dialog_confirm",
		        icon: "question",
		        ok: function (here) {
		            return yes.call(this, here);
		        },
		        cancel: function (here) {
		            return no && no.call(this, here);
		        }
		    });
		},

		/**
		 * 提问
		 * @param	{String}	提问内容
		 * @param	{Function}	回调函数. 接收参数：输入值
		 * @param	{String}	默认值
		 */
		prompt : function (content, yes, value) {
		    value = value || "";
		    var input;
		    return $.info([
	            "<div style='margin-bottom:5px;font-size:12px'>",
                content,
	            "</div>",
	            "<div>",
	                "<input value='",
	                    value,
	                "' style='width:18em;padding:5px 5px;border:1px solid;border-redius:3px;margin-top:3px' />",
	            "</div>"
	            ].join(""), {
		        id: "dialog_prompt",
		        icon: "question",
		        init: function () {
		            input = this.DOM.content.find("input")[0];
		            input.select();
		            input.focus();
		        },
		        ok: function (here) {
		            return yes && yes.call(this, input.value, here);
		        },
		        cancel: true
		    });
		},

		/**
		 * 短暂提示
		 * @param	{String}	提示内容
		 * @param	{Number}	显示时间 (默认1.5秒)
		 */
		tips : function (content, callback, time) {
		    return $.info("", {
		        id: "dialog_tips",
		        title: false,
		        cancel: false,
		        close: callback,
		        zIndex: 999999999
		    })
		    .content("<div style='padding: 0 1em;'>" + content + "</div>")
		    .time(time || 5);
		},

		/**
		 * 等待
		 * @param	{String}	提示内容 默认为:正在执行操作，请稍后...
		 * @param   {Number}	等待超时时间 20 秒
		 */
		loading : function (content, timeout) {
		    return $.info("", {
		        id: "dialog_loading",
		        title: false,
		        cancel: false,
		        esc: false,
		        init: function(){
		        	this._lockMask.unbind("dblclick");
		        	$.loading.timeSec = isNaN(timeout) ? 20 : timeout;
		        	$.loading.timer = null;
		        	var fn = function(){
		        		$.loading.timeSec -= 1;
		        		if($.loading.timeSec == 0){
		        			$.tips("操作超时，请稍后重试！");
		        			$.loading.close();
		        		}
		        	};
		        	$.loading.timer = setInterval(fn, 1000);
		        },
		        close: function(){
		        	clearInterval($.loading.timer);
		        }
		    })
		    .content(["<div style='padding: 0 1em;text-align:center;'><img src='",
		              this.basePath, "/common/images/loading.gif' width='32' heigth='32'/><br/>",
		              (content || "正在执行操作，请稍候..."), "</div>"].join(""));
		},

		/**
		 * 显示信息
		 * @param	{String}	显示内容
		 * @param	{String}		标题
		 * @param	{funciton}	回调函数
		 */
		msg : function (content, title, callback) {
		    return $.info(content, {
		        id: "dialog_msg",
		        title: (title || "信息"),
		        close: callback
		    });
		},

		/**
		 * 四舍五入法截取一个小数
		 * @param float digit 要格式化的数字
		 * @param integer length 要保留的小数位数
		 * @return float
		 */
		round : function(digit, length) {
		    length = length ? parseInt(length) : 0;
		    if (length <= 0) return Math.round(digit);
		    digit = Math.round(digit * Math.pow(10, length)) / Math.pow(10, length);
		    return digit;
		},

		/**
		 * 舍去法截取一个小数
		 * @param float digit 要格式化的数字
		 * @param integer length 要保留的小数位数
		 * @return float
		 */
		floor : function(digit, length) {
		    length = length ? parseInt(length) : 0;
		    if (length <= 0) return Math.floor(digit);
		    digit = Math.floor(digit * Math.pow(10, length)) / Math.pow(10, length);
		    return digit;
		},

		/**
		 * 进一法截取一个小数
		 * @param float digit 要格式化的数字
		 * @param integer length 要保留的小数位数
		 * @return float
		 */
		ceil : function(digit, length) {
		    length = length ? parseInt(length) : 0;
		    if (length <= 0) return Math.ceil(digit);
		    digit = Math.ceil(digit * Math.pow(10, length)) / Math.pow(10, length);
		    return digit;
		},

		/**
		 * 字符串截取
		 * @param string s 要格式化的字符串
		 * @param integer max 要保留的字符串最大长度
		 * @return boolean isPrint 是否打印在原页面上
		 */
		strLimit : function(s, max, isPrint){
			var str = s;
			if(str.length > max){
				str = str.substring(0, max - 3)+"...";
			}
			if(isPrint)
				document.write(str);
			return str;
		},
		/**
		 * 可跨级调用的最高层的 window 对象
		 */
		top : function(){
			var top = window,
			test = function (name) {
				try {
					var doc = window[name].document;	// 跨域|无权限
					doc.getElementsByTagName; 			// chrome 本地安全限制
				} catch (e) {
					return false;
				};
				return window[name].jQuery
				// 框架集无法显示第三方元素
				&& doc.getElementsByTagName('frameset').length === 0;
			};
			if (test('top')) {
				top = window.top;
			} else if (test('parent')) {
				top = window.parent;
			};
			return top;
		}(),
		/**
		 * 跨框架数据共享接口
		 * @param	{String}	存储的数据名
		 * @param	{Any}		将要存储的任意数据(无此项则返回被查询的数据)
		 */
		share : function(name, value){
			var top = this.top,
			cache = top[_data] || {};
			top[_data] = cache;

			if (value !== undefined) {
				cache[name] = value;
			} else {
				return cache[name];
			};
			return cache;
		},
		/**
		 * 数据共享删除接口
		 * @param	{String}	删除的数据名
		 */
		removeShare : function(name){
			var cache = this.top[_data];
			if (cache && cache[name]) delete cache[name];
		}
	});

	/**
	 * fn extend
	 */
	$.fn.extend({
		/**
		 * 通用悬浮提示框
		 * @param	{String} 提示信息的字符组成，可以是纯文本，也可以是HTML代码
		 * @param	{Number} 提示框宽度
		 * @param	{Number} 提示框高度
		 */
		title:function(content, width, height){
			$(this).mousemove(function(){
				if($.trim(content)=="")
					return this;
				var _margin=14,h=height,w=width,strH=height,strW=width,
				x=event.clientX + (document.body.scrollLeft||document.documentElement.scrollLeft),y=event.clientY + (document.body.scrollTop||document.documentElement.scrollTop),
				maxWidth=document.documentElement.scrollWidth,//文档可见宽度
				maxHeight=document.documentElement.scrollHeight,//文档可见高度
				_info=$("#_title__info");
				//判断提示框是否存在，假如不存在则创建提示框
				if(_info.length==0){
					$("body").append("<div id=\"_title__info\"></div>");
				    _info=$("#_title__info");
				    if(width === undefined){
				    	strW="auto";
				    }
				    if(height === undefined){
				    	strH="auto";
				    }
					_info.css({
						width:strW,
						height:strH,
						position:"absolute",
						border:"1px solid #ccc",
						backgroundColor:"#FFFFFF",
						visibility:"visible",
						"z-index":9999,
						"-moz-border-radius": "5px",
						"-webkit-border-radius": "5px",
						"border-radius": "5px",
						"padding": "2px",
						"cursor": "default",
						"font-size": "11px"
					}).mouseout(function(){
						$(this).remove();
					}).click(function(){
						$(this).remove();
					}).html(content);
				}
		    	w=_info.innerWidth();
		    	h=_info.innerHeight();
				var tempWidth = x + w + _margin + 10;
				var tempHeight = y + h + _margin + 10;
				if(tempWidth >= maxWidth)
					_info.css("left", x - w -_margin);
				else
					_info.css("left", x + _margin);
				if(tempHeight >= maxHeight)
					_info.css("top", y - h - _margin);
				else
					_info.css("top", y+_margin);
			}).mouseout(function(){
				$("#_title__info").remove();
			});
			return this;
		}
	});

	$.popup.index = -1;
	/**
	 * @param	{String}	需要关闭的id,默认关闭(仅限于不指定ID的弹出层)最后一次打开的那个
	 */
	$.popup.close = function(id){
		if(!id){
			$.dialogClose("dialog_popup"+$.popup.index);
			$.popup.index -= 1;
		}else
			$.dialogClose(id);
	};
	$.info.close = function(){
		$.dialogClose("dialog_info");
	};
	$.alert.close = function(){
		$.dialogClose("dialog_alert");
	};
	$.confirm.close = function(){
		$.dialogClose("dialog_confirm");
	};
	$.prompt.close = function(){
		$.dialogClose("dialog_prompt");
	};
	$.tips.close = function(){
		$.dialogClose("dialog_tips");
	};
	$.loading.close = function(){
		$.dialogClose("dialog_loading");
	};
	$.msg.close = function(){
		$.dialogClose("dialog_msg");
	};
})(jQuery);
var zeroize = function Zeroize(num) {
	var reg = /^[0-9]$/;
	if(reg.test(num))
		num += ".0";
	return num;
};