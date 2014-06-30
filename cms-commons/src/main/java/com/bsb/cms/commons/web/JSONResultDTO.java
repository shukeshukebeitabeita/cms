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
package com.bsb.cms.commons.web;

import java.io.Serializable;

/**
 * json 返回数据对象
 * 
 * @author hongjian.liu
 * 
 */
public class JSONResultDTO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8831095618919132566L;
	public final static String SUCCESS = "Y";
	public final static String ERROR = "N";
	// 返回数据状态 Y 正常,N 非正常
	private String result = SUCCESS;
	// 信息描述
	private String message;
	// 数据对象
	private Object data;

	/**
     * @param result
     * @param message
     */
    public JSONResultDTO(String result, String message) {
        super();
        this.result = result;
        this.message = message;
    }

    /**
	 * @param message
	 */
	public JSONResultDTO(String message) {
		super();
		this.message = message;
	}

	/**
     * 
     */
    public JSONResultDTO() {
        super();
    }

    public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
