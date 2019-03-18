http://www.my97.net/dp/demo/
版本:4.8 Beta2

		<script language="javascript" type="text/javascript" src="datepicker/WdatePicker.js"></script>
		
		文本框:
		<input id="d11" type="text" onClick="WdatePicker()"/>
		
		图标触发:
		<input id="d12" type="text"/>
		<img onclick="WdatePicker({el:'d12'})" src="../skin/datePicker.gif" width="16" height="22" align="absmiddle">
		注意:只需要传入控件的id即可
		
		周显示简单应用 
		<input id="d121" type="text" onfocus="WdatePicker({isShowWeek:true})"/>
		
		设置readOnly属性 true 或 false 可指定日期框是否只读 
		设置highLineWeekDay属性 ture 或 false 可指定是否高亮周末 
		
		最好把readOnly置为true,否则即使隐藏了清空按钮,用户依然可以在输入框里把值delete掉
		<input class="Wdate" type="text" id="d15" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
		
		
		通过position属性,自定义弹出位置
		使用positon属性指定,弹出日期的坐标为{left:100,top:50}
		<input class="Wdate" type="text" id="d16" onfocus="WdatePicker({position:{left:100,top:50}})"/>


自定义格式 
yMdHmswW分别代表年月日时分秒星期周,你可以任意组合这些元素来自定义你个性化的日期格式. 


日期格式表 格式 说明 
y 将年份表示为最多两位数字。如果年份多于两位数，则结果中仅显示两位低位数。 
yy  同上，如果小于两位数，前面补零。 
yyy 将年份表示为三位数字。如果少于三位数，前面补零。 
yyyy 将年份表示为四位数字。如果少于四位数，前面补零。 
M 将月份表示为从 1 至 12 的数字 
MM 同上，如果小于两位数，前面补零。 
MMM 返回月份的缩写 一月 至 十二月 (英文状态下 Jan to Dec) 。 
MMMM 返回月份的全称 一月 至 十二月 (英文状态下 January to December) 。 
d 将月中日期表示为从 1 至 31 的数字。 
dd 同上，如果小于两位数，前面补零。 
H  将小时表示为从 0 至 23 的数字。 
HH 同上，如果小于两位数，前面补零。 
m 将分钟表示为从 0 至 59 的数字。 
mm 同上，如果小于两位数，前面补零。 
s 将秒表示为从 0 至 59 的数字。 
ss 同上，如果小于两位数，前面补零。 
w 返回星期对应的数字 0 (星期天) - 6 (星期六) 。 
D 返回星期的缩写 一 至 六 (英文状态下 Sun to Sat) 。 
DD 返回星期的全称 星期一 至 星期六 (英文状态下 Sunday to Saturday) 。 
W 返回周对应的数字 (1 - 53) 。 
WW 同上，如果小于两位数，前面补零 (01 - 53) 。 

示例
格式字符串 值 
yyyy-MM-dd HH:mm:ss 2008-03-12 19:20:00 
yy年M月 08年3月 
yyyyMMdd 20080312 
今天是:yyyy年M年d HH时mm分  今天是:2008年3月12日 19时20分 
H:m:s 19:20:0 
y年 8年 
MMMM d, yyyy 三月 12, 2008 

示例 2-4-1: 年月日时分秒
 
<input type="text" id="d241" onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日 HH时mm分ss秒'})" class="Wdate" style="width:300px"/>

注意:点两次才能选择日期的原因,详见 autoPickDate 属性

示例 2-4-2 时分秒
 
<input type="text" id="d242" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'H:mm:ss'})" class="Wdate"/>

注意:这里提前使用了皮肤(skin)属性,所以你会看到一个不同的皮肤,皮肤属性详见自定义和动态切换皮肤 

示例 2-4-3 年月
 
<input type="text" id="d243" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy年MM月'})" class="Wdate"/>

示例 2-4-4 取得系统可识别的日期值(重要)
类似于 1999年7月5日 这样的日期是不能够被系统识别的,他必须转换为能够识别的类型如 1999-07-05 

 真实的日期值是:  
<input id="d244" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2'})"/>
<input id="d244_2" type="text" />

注意:在实际应用中,一般会把vel指定为一个hidden控件,这里是为了把真实值展示出来,所以使用文本框
关键属性: vel 指定一个控件或控件的ID,必须具有value属性(如input),用于存储真实值(也就是realDateFmt和realTimeFmt格式化后的值)





各目录及文件的用途: 
>WdatePicker.js 配置文件,在调用的地方仅需使用该文件,可多个共存,以xx_WdatePicker.js方式命名

>config.js 语言和皮肤配置文件,无需引入(4.8以后合并入WdatePicker.js)

>calendar.js 日期库主文件,无需引入

>My97DatePicker.htm 临时页面文件,不可删除(4.8以后不存在此文件)

>目录lang 存放语言文件,你可以根据需要清理或添加语言文件

>目录skin 存放皮肤的相关文件,你可以根据需要清理或添加皮肤文件包 

>当WdatePicker.js里的属性:$wdate=true时,在input里加上class="Wdate"就会在选择框右边出现日期图标,
如果您不喜欢这个样式,可以把class="Wdate"去掉,另外也可以通过修改skin目录下的WdatePicker.css文件来修改样式 