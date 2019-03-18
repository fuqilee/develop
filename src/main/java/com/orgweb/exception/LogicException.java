package com.orgweb.exception;

public class LogicException extends RuntimeException {
	public String errorCode;
	private static final long serialVersionUID = -360277845666981697L;

	public LogicException() {
		super();
	}

	public LogicException(String message, Throwable cause) {
		super(message, cause);
	}

	public LogicException(String message) {
		super(message);
	}

	public LogicException(String errorCode,String message) {
		super("错误编号:"+errorCode+";错误信息:"+message);
		this.errorCode=errorCode;
	}	
	
	public LogicException(Throwable cause) {
		super(cause);
	}

}
