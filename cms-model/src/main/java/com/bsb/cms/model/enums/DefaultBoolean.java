/**
 * @(#)DefaultBoolean.java 2013-4-17
 *
 * Copyright (c) 2012-2013 UNS (China) Int'l Co., Ltd
 * 3855 shang nan Road. pu dong District.Shanghai 201302 China
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of UNS (China)
 *  Int'l Co., Ltd ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with UNS (China).
 */
package com.bsb.cms.model.enums;

/**
 * 默认的false,true状态整数值。
 * @author lhj
 * @version 1.0.0 2014-4-17
 * @since 1.0
 */
public enum DefaultBoolean {
	N(0,"否"),
	Y(1, "是")
	;

	
	private int code;
	private String description;
	
	DefaultBoolean(int code, String description) {
		this.code = code;
		this.description = description;
	}
	
	/**
	 * @return the code
	 */
	public int getCode() {
		return code;
	}
	
	/**
	 * @param code
	 *            the code to set
	 */
	public void setCode(int code) {
		this.code = code;
	}
	
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	
	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
}
