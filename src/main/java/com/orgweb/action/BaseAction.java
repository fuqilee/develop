package com.orgweb.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.orgweb.utils.Constant;


public abstract class BaseAction {
	private static final long serialVersionUID = 1L;
	private static Logger log = LoggerFactory.getLogger(BaseAction.class);
	/**
	 * 获取请求对象.
	 *
	 * @return
	 */
	public static HttpServletRequest getRequest() {
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
	}
	/**
	 * 设置 request 的属性.
	 *
	 * @param name
	 *            属性名
	 * @param value
	 *            属性值
	 */
	public static void setAttribute(String name, Object value) {
		((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().setAttribute(name, value);
	}
	
	public static String getParameter(final String name) {
		return getParameter(name, false);
	}

	public static String getParameter(final String name, final boolean emptyStringsOK) {
		String temp = getRequest().getParameter(name);
		if (temp != null) {
			if (temp.equals("") && !emptyStringsOK) {
				return null;
			} else {
				return temp;
			}
		} else {
			return null;
		}
	}

	public static boolean isBlank(final String str) {
		return (str == null) || (str.trim().length() <= 0);
	}

	public static String getParameter(final String name, final String defaultValue) {
		String temp = getRequest().getParameter(name);
		if (temp == null)
			return defaultValue;
		else
			return temp;
	}

	public static boolean getParameterBoolean(final String name) {
		return getParameterBoolean(name, false);
	}

	public static boolean getParameterBoolean(final String name, final boolean defaultVal) {
		String temp = getRequest().getParameter(name);
		if ("true".equals(temp) || "on".equals(temp)) {
			return true;
		} else if ("false".equals(temp) || "off".equals(temp)) {
			return false;
		} else {
			return defaultVal;
		}
	}

	public static int getParameterInt(final String name, final int defaultNum) {
		String temp = getRequest().getParameter(name);
		if (temp != null && !temp.equals("")) {
			int num = defaultNum;
			try {
				num = Integer.parseInt(temp);
			}
			catch (Exception ignored) {}
			return num;
		} else {
			return defaultNum;
		}
	}

	public static int[] getParametersInt(final String name, final int defaultNum) {
		String[] paramValues = getRequest().getParameterValues(name);
		if (paramValues == null) {
			return null;
		}
		if (paramValues.length < 1) {
			return new int[0];
		}
		int[] values = new int[paramValues.length];
		for (int i = 0; i < paramValues.length; i++) {
			try {
				values[i] = Integer.parseInt(paramValues[i]);
			}
			catch (Exception e) {
				values[i] = defaultNum;
			}
		}
		return values;
	}

	public static double getParameterDouble(final String name, final double defaultNum) {
		String temp = getRequest().getParameter(name);
		if (temp != null && !temp.equals("")) {
			double num = defaultNum;
			try {
				num = Double.parseDouble(temp);
			}
			catch (Exception ignored) {}
			return num;
		} else {
			return defaultNum;
		}
	}

	public static long getParameterLong(final String name, final long defaultNum) {
		String temp = getRequest().getParameter(name);
		if (temp != null && !temp.equals("")) {
			long num = defaultNum;
			try {
				num = Long.parseLong(temp);
			}
			catch (Exception ignored) {}
			return num;
		} else {
			return defaultNum;
		}
	}

	public static long[] getParametersLong(final String name, final long defaultNum) {
		String[] paramValues = getRequest().getParameterValues(name);
		if (paramValues == null) {
			return null;
		}
		if (paramValues.length < 1) {
			return new long[0];
		}
		long[] values = new long[paramValues.length];
		for (int i = 0; i < paramValues.length; i++) {
			try {
				values[i] = Long.parseLong(paramValues[i]);
			}
			catch (Exception e) {
				values[i] = defaultNum;
			}
		}
		return values;
	}
	public static double[] getParametersDouble(final String name, final double defaultNum) {
		String[] paramValues = getRequest().getParameterValues(name);
		if (paramValues == null) {
			return null;
		}
		if (paramValues.length < 1) {
			return new double[0];
		}
		double[] values = new double[paramValues.length];
		for (int i = 0; i < paramValues.length; i++) {
			try {
				values[i] = Double.parseDouble(paramValues[i]);
			}
			catch (Exception e) {
				values[i] = defaultNum;
			}
		}
		return values;
	}

	public static String getAttribute(final String name, final boolean emptyStringsOK) {
		String temp = (String) getRequest().getAttribute(name);
		if (temp != null) {
			if (temp.equals("") && !emptyStringsOK) {
				return null;
			} else {
				return temp;
			}
		} else {
			return null;
		}
	}

	public static boolean getAttributeBoolean(final String name) {
		String temp = (String) getRequest().getAttribute(name);
		if (temp != null && temp.equals("true")) {
			return true;
		} else {
			return false;
		}
	}

	public static int getAttributeInt(final String name, final int defaultNum) {
		String temp = (String) getRequest().getAttribute(name);
		if (temp != null && !temp.equals("")) {
			int num = defaultNum;
			try {
				num = Integer.parseInt(temp);
			}
			catch (Exception ignored) {}
			return num;
		} else {
			return defaultNum;
		}
	}

	public static long getAttributeLong(final String name, final long defaultNum) {
		String temp = (String) getRequest().getAttribute(name);
		if (temp != null && !temp.equals("")) {
			long num = defaultNum;
			try {
				num = Long.parseLong(temp);
			}
			catch (Exception ignored) {}
			return num;
		} else {
			return defaultNum;
		}
	}

	public static String[] getParameters(final String name, final String defaultNum) {
		String[] paramValues = getRequest().getParameterValues(name);
		if (paramValues == null || paramValues.length < 1) {
			return new String[0];
		}
		String[] values = new String[paramValues.length];
		for (int i = 0; i < paramValues.length; i++) {
			try {
				values[i] = paramValues[i];
			}
			catch (Exception e) {
				values[i] = defaultNum;
			}
		}
		return values;
	}

	public static String[] getParameters(final String name) {
		return getRequest().getParameterValues(name);
	}

	public static Timestamp getParameterTimestamp(	final String name,
													final String suffix,
													final String dateFormat,
													final Timestamp defaultVal) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		Timestamp tst = null;
		try {
			tst = new Timestamp(sdf.parse(getParameter(name) + suffix).getTime());
		}
		catch (Exception e) {
			try {
				if(defaultVal != null)
					tst = new Timestamp(sdf.parse(sdf.format(defaultVal)).getTime());
			}
			catch (Exception e1) {}
		}
		return tst;
	}

	public static int getParameterInt(final String name){
		return getParameterInt(name, 0);
	}

	public static double getParameterDouble(final String name){
		return getParameterDouble(name, 0d);
	}

	public static Timestamp getParameterTimestamp(	final String name,
													final String dateFormat,
													final Timestamp defaultVal) {
		return getParameterTimestamp(name, "", dateFormat, defaultVal);
	}

	public static Timestamp getParameterTimestampDate(final String name, final Timestamp defaultVal) {
		return getParameterTimestamp(name, Constant.DEFAULT_DATE_FORMAT_DATE, defaultVal);
	}

	public static Timestamp getParameterTimestampDatetime(	final String name,
															final Timestamp defaultVal) {
		return getParameterTimestamp(name, Constant.DEFAULT_DATE_FORMAT_DATETIME, defaultVal);
	}

	/**
	 * 转换失败默认为当前时间
	 *
	 * @param name
	 * @param dateFormat
	 * @return
	 */
	public static Timestamp getParameterTimestamp(final String name, final String dateFormat) {
		return getParameterTimestamp(name, dateFormat, getCurTimestamp());
	}

	/**
	 * 转换失败默认为当前时间
	 *
	 * @param name
	 * @return
	 */
	public static Timestamp getParameterTimestampDate(final String name) {
		return getParameterTimestamp(name, Constant.DEFAULT_DATE_FORMAT_DATE, getCurTimestamp());
	}

	/**
	 * 转换失败默认为当前时间
	 *
	 * @param name
	 * @return
	 */
	public static Timestamp getParameterTimestampDatetime(final String name) {
		return getParameterTimestamp(name, Constant.DEFAULT_DATE_FORMAT_DATETIME, getCurTimestamp());
	}

	
	
	
	/**
	 * 获取当前日期时间
	 */
	public static Timestamp getCurTimestamp() {
		return new Timestamp(System.currentTimeMillis());
	}

	/**
	 * 获取1900-01-01 00:00:00.000日期时间
	 */
	public static Timestamp getMinTimestamp() {
		return Timestamp.valueOf("1900-01-01 00:00:00.000");
	}

	/**
	 * 获取2999-12-31 23:59:59.999日期时间
	 */
	public static Timestamp getMaxTimestamp() {
		return Timestamp.valueOf("2999-12-31 23:59:59.999");
	}

	/**
	 * 开始时间类型默认加时间后缀:[00:00:00]
	 */
	public static Timestamp getParameterTimestampStart(final String name, final Timestamp defaultVal) {
		return getParameterTimestamp(name, " 00:00:00", Constant.DEFAULT_DATE_FORMAT_DATETIME, defaultVal);
	}

	/**
	 * 结束时间类型默认加时间后缀:[23:59:59]
	 */
	public static Timestamp getParameterTimestampEnd(final String name, final Timestamp defaultVal) {
		return getParameterTimestamp(name, " 23:59:59", Constant.DEFAULT_DATE_FORMAT_DATETIME, defaultVal);
	}
	
}
