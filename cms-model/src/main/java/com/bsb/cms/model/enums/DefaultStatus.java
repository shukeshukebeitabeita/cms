/**
 * @(#)DefaultStatus.java 2013-4-22
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
 * @author hongjian.liu
 * @version 1.0.0 2014-5-22
 * @since 1.0
 */
public enum DefaultStatus {
	VALID(1,"可用"),//or 1 未删除 ；2 已删除 
	INVALID(2, "不可用")
	;

	
	private int code;
	private String description;
	
	DefaultStatus(int code, String description) {
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
