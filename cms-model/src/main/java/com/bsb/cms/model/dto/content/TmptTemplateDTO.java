/**
 * @(#)TmptTemplateDTO.java 2014-7-1
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
 * @version 1.0.0 2014-7-1
 * @since 1.0
 */
public class TmptTemplateDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 810532980201141385L;

	private Long id;

	private Long parent_id;

	private String name;

	private String file_dir;

	private Short status;

	private Short type;

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}


	/**
	 * @return the parent_id
	 */
	public Long getParent_id() {
		return parent_id;
	}

	/**
	 * @param parent_id the parent_id to set
	 */
	public void setParent_id(Long parent_id) {
		this.parent_id = parent_id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the file_dir
	 */
	public String getFile_dir() {
		return file_dir;
	}

	/**
	 * @param file_dir the file_dir to set
	 */
	public void setFile_dir(String file_dir) {
		this.file_dir = file_dir;
	}

	/**
	 * @return the status
	 */
	public Short getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(Short status) {
		this.status = status;
	}

	/**
	 * @return the type
	 */
	public Short getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(Short type) {
		this.type = type;
	}
	
	

}
