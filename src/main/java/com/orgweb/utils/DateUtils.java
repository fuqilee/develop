package com.orgweb.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.sound.sampled.Line;

import org.apache.commons.lang3.StringUtils;

/**
 * 日期帮助类
 *
 * @author hant
 * @date 2013-05-14 14:30:43
 *
 */
public class DateUtils {

	/**
	 * 日期格式中的特殊字符
	 */
	public static final String[][] DATE_SPECIAL_STRS = { { "．", "-" }, { "/", "-" }, { "／", "-" }, { ".", "-" }, { "：", ":" },
		{ "——", "-" }, {"－", "-"}, { "年", "-" }, { "月", "-" }, { "日", "" } };

	/**
	 * Excel读取日期为数值（从1899-12-30到当前日期的天数值）
	 */
	public static final Calendar cal = Calendar.getInstance();
	static{
		cal.set(Calendar.YEAR, 1899);
		cal.set(Calendar.MONTH, Calendar.DECEMBER);
		cal.set(Calendar.DAY_OF_MONTH, 30);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
	}

	/**
	 * Excel读取日期为数值（从1899-12-30到当前日期的天数值）最小支持的日期：1964-01-01
	 */
	public static final int MIN_DAY_1899_12_30 = 23377;

	/**
	 * Excel读取日期为数值（从1899-12-30到当前日期的天数值）最大支持的日期：2300-12-31
	 */
	public static final int MAX_DAY_1899_12_30 = 146463;

	private static ThreadLocal<Map<String, DateFormat>> threadLocal;

	static {
		synchronized (DateUtils.class) {
			threadLocal = new ThreadLocal<Map<String, DateFormat>>();
		}
	}

	public synchronized static DateFormat getDateFormat(String dateFormat) {
		Map<String, DateFormat> m = threadLocal.get();
		if (m == null) {
			m = new HashMap<String, DateFormat>();
			threadLocal.set(m);
		}
		DateFormat df = m.get(dateFormat);
		if (df == null) {
			df = new SimpleDateFormat(dateFormat);
			m.put(dateFormat, df);
			threadLocal.set(m);
		}
		return df;
	}

	public static Long milliSecondDateDiff(Date startDate, Date endDate) {
		if (startDate != null && endDate != null) {
			return endDate.getTime() - startDate.getTime();
		} else {
			return null;
		}
	}

	public static Long secondDateDiff(Date startDate, Date endDate) {
		if (startDate != null && endDate != null) {
			float temp = (float) (endDate.getTime() - startDate.getTime()) / 1000;
			return Long.valueOf(Math.round(temp));
		} else {
			return null;
		}
	}

	/**
	 * 判断是否为日期格式
	 *
	 * @param value
	 * @param sdf
	 * @return
	 */
	public static boolean isDate(String value, DateFormat sdf) {
		return isDate(value, sdf, false);
	}

	/**
	 *
	 * @param value
	 * @param sdf
	 * @param isLenient
	 *            是否严格验证
	 * @return
	 */
	public static boolean isDate(String value, DateFormat sdf, boolean isLenient) {
		ParsePosition pos = new ParsePosition(0);// 指定从所传字符串的首位开始解析
		if (value == null || sdf == null) {
			return false;
		}
		try {
			if (!isLenient) {
				value = DateUtils.replaceSpecial(value);
			}
			sdf.setLenient(false);
			Date date = sdf.parse(value, pos);
			if (date == null) {
				return false;
			} else {
				// 更为严谨的日期,如2011-03-024认为是不合法的
				if (pos.getIndex() > sdf.format(date).length()) {
					return false;
				}
				return true;
			}
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 *
	 * @param value
	 * @param format
	 * @param isLenient
	 *            是否严格验证
	 * @return
	 */
	public static boolean isDate(String value, String format, boolean isLenient) {
		if (value == null || format == null || "".equals(format)) {
			return false;
		}
		return isDate(value, getDateFormat(format), isLenient);
	}

	/**
	 * 字符串转换成日期
	 *
	 * @param strDate
	 * @param formater
	 * @return
	 */
	public static Date str2Date(String strDate, String formater) {
		if (strDate == null) {
			return null;
		}
		if (formater == null) {
			formater = "yyyy-MM-dd";
		}
		DateFormat df = getDateFormat(formater);
		Date date = new Date();
		try {
			date = df.parse(strDate);
		} catch (ParseException pe) {
			pe.getStackTrace();
		}
		return date;
	}

	public static String getToday() {
		return formaterDate(new Date(), "yyyy-MM-dd");
	}

	/**
	 * 格式化日期
	 *
	 * @param date
	 * @param formater
	 * @return
	 */
	public static String formaterDate(Date date, String formater) {
		if (date == null) {
			return "";
		}
		if (formater == null) {
			formater = "yyyy-MM-dd";
		}
		SimpleDateFormat sdf = new SimpleDateFormat(formater);
		return sdf.format(date);
	}

	/**
	 * 格式化日期
	 *
	 * @return yyyy-MM-dd 格式日期
	 */
	public static Date formatDate(Date date) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = df.parse(df.format(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * 获取当前时间 不带时分秒
	 *
	 * @return
	 */
	public static Date getTodayDD() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String today = getToday();
		Date date = null;
		try {
			date = df.parse(today);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public static int getaaa(Date date1, Date date2) {
		String strDate = formaterDate(date1, null);
		String year = strDate.substring(0, 4);
		String month = strDate.substring(5, 7);
		int intYear = Integer.parseInt(year);
		if ("01".equals(month) || "02".equals(month) || "03".equals(month)) {
			strDate = String.valueOf(intYear) + "-03-31";
		} else {
			strDate = String.valueOf(intYear + 1) + "-03-31";
		}
		Date date3 = str2Date(strDate, null);
		int compar = compartToDate(date2, date3);
		if (compar == 1) {
			return 2;
		} else if (compar == -1) {
			return 1;
		} else {
			return 3;
		}
	}

	/**
	 * 获取当前月最后一天数字
	 *
	 * @return
	 */
	public static int getCurrentMonthLastDay() {
		Calendar a = Calendar.getInstance();
		a.set(Calendar.DATE, 1);// 把日期设置为当月第一天
		a.roll(Calendar.DATE, -1);// 日期回滚一天，也就是最后一天
		int maxDate = a.get(Calendar.DATE);
		return maxDate;
	}

	/**
	 * 获取月份最后一天数字
	 *
	 * @return
	 */
	public static int getCurrentMonthLastDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DATE, 1);// 把日期设置为当月第一天
		calendar.roll(Calendar.DATE, -1);// 日期回滚一天，也就是最后一天
		int maxDate = calendar.get(Calendar.DATE);
		return maxDate;
	}

	/**
	 * 获取某年某月的最后一天数字
	 *
	 * @param year
	 * @param month
	 * @return
	 */
	public static int getMonthLastDay(int year, int month) {
		Calendar a = Calendar.getInstance();
		a.set(Calendar.YEAR, year);
		a.set(Calendar.MONTH, month - 1);
		a.set(Calendar.DATE, 1);// 把日期设置为当月第一天
		a.roll(Calendar.DATE, -1);// 日期回滚一天，也就是最后一天
		int maxDate = a.get(Calendar.DATE);
		return maxDate;
	}

	public static String getNewDayNumDate(String strDate, int days) {
		String[] date = strDate.split("-"); // 将要转换的日期字符串拆分成年月日
		int year, month, day;
		year = Integer.parseInt(date[0]);
		month = Integer.parseInt(date[1]) - 1;
		day = Integer.parseInt(date[2]);
		GregorianCalendar d = new GregorianCalendar(year, month, day);
		d.add(Calendar.DATE, days);
		return DateFormat.getDateInstance().format(d.getTime());
	}

	/**
	 * 日期累加天数
	 *
	 * @param date
	 * @param days
	 * @return 计算后的日期
	 */
	public static Date getNewDayDate(Date date, int days) {
		if (date != null) {
			Calendar c = Calendar.getInstance();
			c.setTime(date);
			c.add(Calendar.DAY_OF_MONTH, days);
			return c.getTime();
		}
		return null;
	}

	/**
	 * 返回两个日期间隔的天数
	 *
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static int getDayNumBetween2Date(Date d1, Date d2) {
		if (isEqualsInYMD(d1, d2)) {
			return 0;
		}
		long l = d2.getTime() - d1.getTime();
		int day = (int) (l / (24 * 60 * 60 * 1000));
		if (day < 0) {
			day = (-day);
		}
		int m = (int) (l % (24 * 60 * 60 * 1000));
		Calendar c = Calendar.getInstance();
		if (d1.compareTo(d2) <= 0) {
			c.setTime(d1);
			c.add(Calendar.MILLISECOND, m);
			if (isEqualsInYMD(d1, c.getTime())) {
				return day;
			} else {
				return day + 1;
			}
		} else {
			c.setTime(d2);
			c.add(Calendar.MILLISECOND, m);
			if (isEqualsInYMD(d2, c.getTime())) {
				return day;
			} else {
				return day + 1;
			}
		}
	}

	public static boolean isEqualsInYMD(Date d1, Date d2) {
		Calendar c = Calendar.getInstance();
		c.setTime(d1);
		int year1 = c.get(Calendar.YEAR);
		int dayOfYear1 = c.get(Calendar.DAY_OF_YEAR);
		c.setTime(d2);
		int year2 = c.get(Calendar.YEAR);
		int dayOfYear2 = c.get(Calendar.DAY_OF_YEAR);
		if (year1 != year2) {
			return false;
		}
		if (dayOfYear1 != dayOfYear2) {
			return false;
		}
		return true;
	}

	/**
	 * 计算日期
	 *
	 * @param date
	 *            日期
	 * @param days
	 *            减去的天数
	 * @return
	 */
	public static Date getNewDayPrevDate(Date date, int days) {
		if (date != null) {
			Calendar c = Calendar.getInstance();
			c.setTime(date);
			c.add(c.DAY_OF_MONTH, -days);
			return c.getTime();
		}
		return null;
	}

	public static int compartToDate(Date date1, Date date2) {
		if (date1 != null && date2 != null) {
			if (date1.getTime() > date2.getTime()) {
				return 1;
			} else if (date1.getTime() < date2.getTime()) {
				return -1;
			} else {
				return 0;
			}
		}
		return 0;
	}

	// 计算当月最后一天,返回字符串
	public static String getMonthLastDay() {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.DATE, 1);// 设为当前月的1号
		c.add(Calendar.MONTH, 1);// 加一个月，变为下月的1号
		c.add(Calendar.DATE, -1);// 减去一天，变为当月最后一天
		return ymd(c.getTime());
	}

	// 计算当月第一天,返回字符串
	public static String getMonthFirstDay() {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.DATE, 1);// 设为当前月的1号
		return ymd(c.getTime());
	}

	public static String ymd(Date date) {
		return formaterDate(date, null);
	}

	public static Date ymdStr2Date(String strDate) {
		String formater = "yyyy-MM-dd";
		return str2Date(strDate, formater);
	}

	public static String getAfterSomeDayYms(String date, int day) {
		Calendar c = Calendar.getInstance();
		c.setTime(DateUtils.ymdStr2Date(date));
		c.set(Calendar.DAY_OF_YEAR, c.get(Calendar.DAY_OF_YEAR) + day);
		return ymd(c.getTime());
	}

	@SuppressWarnings("unchecked")
	public static List getDateList(String startDate, String endDate) throws ParseException {
		List<String> dateList = new ArrayList<String>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH); // 设定格式
		Date start = dateFormat.parse(startDate);
		Date end = dateFormat.parse(endDate);
		long day = ((end.getTime() - start.getTime()) / 1000);// 秒数
		day = day / (60 * 60 * 24); // 天数
		for (int i = 0; i <= day; i++) {
			String date = getAfterSomeDayYms(startDate, i);
			dateList.add(date);
		}
		return dateList;
	}

	public static String getCurrentSeasonLastDate(String year, String monthInNum) {
		if ("01".equals(monthInNum) || "02".equals(monthInNum) || "03".equals(monthInNum)) {
			return year + "-03-31";
		} else if ("04".equals(monthInNum) || "05".equals(monthInNum) || "06".equals(monthInNum)) {
			return year + "-06-30";
		} else if ("07".equals(monthInNum) || "08".equals(monthInNum) || "09".equals(monthInNum)) {
			return year + "-09-30";
		} else {
			return year + "-12-31";
		}
	}

	/**
	 * 为日期新增月份
	 *
	 * @param date
	 *            日期
	 * @param addNum
	 *            新增月数
	 * @return 返回（yyyy-MM-dd）格式的日期字符串
	 */
	public static String addMonth(Date date, int addNum) {
		if (date == null)
			return null;
		return formaterDate(addMonths(date, addNum), null);
	}

	/**
	 * 为日期减月份
	 *
	 * @param date
	 *            日期
	 * @param addNum
	 *            新增月数
	 * @return 返回（yyyy-MM-dd）格式的日期字符串
	 */
	public static String subMonth(Date date, int addNum, String formatStr) {
		if (date == null)
			return null;
		return formaterDate(addMonths(date, -addNum), formatStr);
	}

	/**
	 * 为日期新增月份
	 *
	 * @param date
	 *            日期
	 * @param addNum
	 *            新增月数
	 * @return 返回（yyyy-MM-dd）格式的日期
	 */
	public static Date addMonths(Date date, int addNum) {
		if (date == null)
			return date;
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.MONTH, addNum);
		return c.getTime();
	}

	/**
	 * 计算月份差值
	 *
	 * @param beginDate
	 *            开始日期
	 * @param endDate
	 *            结束日期
	 * @return
	 */
	public static int countMonths(Date beginDate, Date endDate) {
		String begin_year = formaterDate(beginDate, "yyyy");
		String end_year = formaterDate(endDate, "yyyy");

		String begin_month = formaterDate(beginDate, "MM");
		String end_month = formaterDate(endDate, "MM");

		String begin_day = formaterDate(beginDate, "dd");
		String end_day = formaterDate(endDate, "dd");

		String end_day2 = null;
		if ("02".equals(end_month)) {
			end_day2 = DateUtils.getCurrentMonthLastDay(endDate) + "";
		}

		if (end_day.equals(begin_day) || end_day.equals(end_day2)) {
			int year = 0;
			if (!end_year.equals(begin_year)) {
				year = Integer.parseInt(end_year) - Integer.parseInt(begin_year);
			}
			return Integer.parseInt(end_month) + year * 12 - Integer.parseInt(begin_month);
		}
		return -1;
	}

	/**
	 * 向前地推日期，是一个相对于当前日期的连续的日期（天数相同）
	 *
	 * @param monthSize
	 *            所需月份数量
	 * @param formatStr
	 *            格式化文本，例如"yyyy-MM-dd"
	 * @return 一个连续日期的List集合
	 */
	public static List<String> monthList(int monthSize, String formatStr) {
		List<String> dateList = new ArrayList<String>();
		Date date = new Date();
		String dat = "";
		for (int i = monthSize - 1; i >= 0; i--) {
			dat = subMonth(date, i, formatStr);
			if (!"null".equals(dat))
				dateList.add(dat);
		}
		return dateList;
	}

	/**
	 * 全角半角的日期分隔符处理为统一的: "-"，":"<br>
	 * 详细支持的格式请查看单元测试<br>
	 * 将会把所有全角的空格转换为半角的空格，并且trim一次，如上操作后为空字符的话返回null<br>
	 * 将Excel读出来的日期为距1899-12-30的天数处理为标准的日期<br>
	 *
	 * @see com.tg.framework.util.DateUtils#MIN_DAY_1899_12_30
	 * @see com.tg.framework.util.DateUtils#MAX_DAY_1899_12_30
	 * @param s
	 * @return
	 */
	public static String replaceSpecial(String s) {
		if (s == null || s.length() == 0) {
			return null;
		}

		//处理1899-12-30的天数值
		if(StringUtils.isNumeric(s)){
			int c = (int) Double.parseDouble(s);
			if(c >= MIN_DAY_1899_12_30 && c <= MAX_DAY_1899_12_30){
				Calendar cur = (Calendar) cal.clone();
				cur.add(Calendar.DAY_OF_MONTH, c);
				s = getDateFormat("yyyy-MM-dd").format(cur.getTime());
			}
		}

		if(Pattern.matches("(^\\d+\\.{1}\\d+[Ee]{1}[+]?\\d+$)", s)){
			Double d = Double.parseDouble(s);
			s = ((Long)d.longValue()).toString().trim();
		}
		if(Pattern.matches("(^\\d+\\.{1}[0]++$)", s)){
			s = s.substring(0,s.indexOf("."));
		}
		//支持 201401格式
		StringBuilder  sb = new StringBuilder();
		if(s.length() == 6 && isInteger(s, false)){
			sb.append(s.substring(0, 4));
			sb.append("-");
			sb.append(s.substring(4));
			sb.append("-01");
			s = sb.toString();
		}
		//支持 20140101格式
		if(s.length() == 8 && isInteger(s, false)){
			sb.append(s.substring(0, 4));
			sb.append("-");
			sb.append(s.substring(4, 6));
			sb.append("-");
			sb.append(s.substring(6));
			s = sb.toString();
		}
		s =  extendTrim(s);
		for (String[] ss : DATE_SPECIAL_STRS) {
			if (s.contains(ss[0]))
				s = s.replace(ss[0], ss[1]);
		}
		if (s.indexOf("-") > 0 && s.indexOf("-") == s.lastIndexOf("-")) {
			s = s + "-01";
		}
		if( s.length() >=6 && s.length() <=8 && s.indexOf("-") > 0 && s.endsWith("-")){
			s = s + "01";
		}
		if(s.length()==9 || s.length()==8){
			Date d = null;
			try {
				d = getDateFormat("yyyy-MM-dd").parse(s);
				s = getDateFormat("yyyy-MM-dd").format(d);
			} catch (ParseException e) {
				s = "";
			}
		}
		return s != null && s.length() > 0 ? s : null;
	}

	/**
	 * 计算传入的两个日期的时间差，
	 * @return 返回值里面时间差类型有，天数，小时数，分钟数，秒数
	 */
	public static Map<String, Integer> get2DateCompareResult(Date startDate, Date endDate, boolean flag) {
		if(null == startDate || null == endDate){
			return null;
		}
		int compareResult = startDate.compareTo(endDate);
		if(compareResult > 0){//如果开始时间大于结束时间，那么呼唤位置
			Date tempDate = startDate;
			startDate = endDate;
			endDate = tempDate;
		}
		long different = endDate.getTime() - startDate.getTime();
		long secondsInMilli = 1000;
		long minutesInMilli = secondsInMilli * 60;
		long hoursInMilli = minutesInMilli * 60;
		long daysInMilli = hoursInMilli * 24;
		
		long elapsedDays = different / daysInMilli;
		if(flag){
			if(elapsedDays > 24839){
				return null;
			}
			different = different % daysInMilli;
		}
		
		long elapsedHours = different / hoursInMilli;
		if(flag){
			different = different % hoursInMilli;
		}
		
		long elapsedMinutes = different / minutesInMilli;
		if(flag){
			different = different % minutesInMilli;
		}
		
		long elapsedSeconds = different / secondsInMilli;
		
		Map<String, Integer> target = new HashMap<String, Integer>();
		target.put("days", Integer.parseInt(elapsedDays+""));
		target.put("hours", Integer.parseInt(elapsedHours+""));
		target.put("minutes", Integer.parseInt(elapsedMinutes+""));
		target.put("seconds", Integer.parseInt(elapsedSeconds+""));
		return target;
	}
	
	/**
	 * 取得指定日期的howMany个月前的日期
	 * @return 返回值日期
	 */
	public static Date getTargetMonthBefor(Date mydate , int howMany){
		 Calendar calendar = Calendar.getInstance();
		 calendar.setTime(mydate);
		 calendar.add(Calendar.MONTH, -howMany);
		Date newDate = calendar.getTime();
		return newDate;
	}
	
	/**
	 * 是否是整数
	 * @param s
	 * @param supportMinus 是否支持判断负数(为true: 正负整数都算，为false:只算正整数)
	 * @return
	 */
	public static boolean isInteger(String s, boolean supportMinus) {
		if (StringUtils.isEmpty(s)) {
			return false;
		}
		String p = "^(\\d+)$";
		if (supportMinus)
			p = "^(-?\\d+)$";
		Pattern ss = Pattern.compile(p);
		Matcher dd = ss.matcher(s);
		return dd.find();
	}
	/**
	 * 全角空格字符
	 */
	public static final String SBC_BLANK = "　";
	/**
	 * 半角空格字符
	 */
	public static final String DBC_BLANK = " ";
	/**
	 * 扩展的trim方法，将全角空格转换为半角空格在进行trim
	 *
	 * @param s
	 * @return
	 */
	public static String extendTrim(String s) {
		if (s == null || s.length() == 0)
			return s;
		if (s.contains(SBC_BLANK))
			s = s.replace(SBC_BLANK, DBC_BLANK);
		return s.trim();
	}
	
}