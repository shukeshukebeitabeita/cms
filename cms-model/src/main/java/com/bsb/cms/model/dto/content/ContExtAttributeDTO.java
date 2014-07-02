/**
 * @(#)ContExtAttributeDTO.java 2014-7-2
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
package com.bsb.cms.model.dto.content;

import java.io.Serializable;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-2
 * @since 1.0
 */
public class ContExtAttributeDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1388734141711636961L;

	private String attr_name;

    private Short attr_type;

    private String default_value;

    private Short sort;

	/**
	 * @return the attr_name
	 */
	public String getAttr_name() {
		return attr_name;
	}

	/**
	 * @param attr_name the attr_name to set
	 */
	public void setAttr_name(String attr_name) {
		this.attr_name = attr_name;
	}

	/**
	 * @return the attr_type
	 */
	public Short getAttr_type() {
		return attr_type;
	}

	/**
	 * @param attr_type the attr_type to set
	 */
	public void setAttr_type(Short attr_type) {
		this.attr_type = attr_type;
	}

	/**
	 * @return the default_value
	 */
	public String getDefault_value() {
		return default_value;
	}

	/**
	 * @param default_value the default_value to set
	 */
	public void setDefault_value(String default_value) {
		this.default_value = default_value;
	}

	/**
	 * @return the sort
	 */
	public Short getSort() {
		return sort;
	}

	/**
	 * @param sort the sort to set
	 */
	public void setSort(Short sort) {
		this.sort = sort;
	}

}
