/**
 * @(#)OperateTypeEnum.java 2013-5-30
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
 * 操作日志中操作类型的枚举
 * 
 * @author lhj
 * @version 1.0.0 2014-5-30
 * @since 1.0
 */
public enum OperateTypeEnum {

	RESET_PWD(13, "重置密码"),

	DELETE_OPERATOR(14, "删除操作员"),

	CREATE_OPERATOR(17, "创建操作员"),

	UPDATE_ROLE(15, "修改角色"),

	DELETE_ROLE(16, "删除角色"),

	CREATE_ROLE(18, "创建角色"),

	;

	private Integer code;
	private String description;

	OperateTypeEnum(Integer code, String description) {
		this.code = code;
		this.description = description;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
