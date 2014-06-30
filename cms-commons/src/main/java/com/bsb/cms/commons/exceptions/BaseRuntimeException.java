/**
 * @(#)${file_name} ${date}
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
 * @version 1.0.0 2014-6-6
 * @since 1.0
 */
public class BaseRuntimeException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8411900792418381885L;

	public BaseRuntimeException() {
		super();
	}

	public BaseRuntimeException(String msg) {
		super(msg);
	}

	public BaseRuntimeException(Throwable throwable) {
		super(throwable);
	}

	public BaseRuntimeException(String msg, Throwable throwable) {
		super(msg, throwable);
	}
}
