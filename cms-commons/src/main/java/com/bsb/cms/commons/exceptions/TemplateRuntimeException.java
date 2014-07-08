/**
 * @(#)TemplateRuntimeException.java 2014-7-7
 *
 * Copyright (c) 2014-2015 BuShangBan (China) Int'l Co., Ltd
 * yongtai Road. pu dong District.Shanghai China
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of BuShangBan (China)
 *  Int'l Co., Ltd ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with BuShangBan (China).
 */
package com.bsb.cms.commons.exceptions;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-7
 * @since 1.0
 */
public class TemplateRuntimeException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8435732683042299485L;

	/**
	 * 
	 */
	public TemplateRuntimeException() {
		super();
	}

	/**
	 * @param message
	 * @param cause
	 */
	public TemplateRuntimeException(String message, Throwable cause) {
		super(message, cause);
	}

	/**
	 * @param message
	 */
	public TemplateRuntimeException(String message) {
		super(message);
	}

	/**
	 * @param cause
	 */
	public TemplateRuntimeException(Throwable cause) {
		super(cause);
	}

}
