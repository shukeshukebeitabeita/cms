/**
 * @(#)ContTypeDTO.java 2014-7-1
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
public class ContTypeDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1205839497041930692L;

	private Long id;

    private String about;

    private String image;

    private String title;//栏目前台显示标题
    
    private String hidden_name;//后台显示名

    private Long parent_id;

    private String file_dir;

    private String file_name;

    private Long attr_id;
    
    private Long content_template_id;

    private Long type_template_id;

    private Short status;
    private Short depth;
    

	public Short getDepth() {
		return depth;
	}

	public void setDepth(Short depth) {
		this.depth = depth;
	}

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
	 * @return the about
	 */
	public String getAbout() {
		return about;
	}

	/**
	 * @param about the about to set
	 */
	public void setAbout(String about) {
		this.about = about;
	}

	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}

	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}
	

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the hidden_name
	 */
	public String getHidden_name() {
		return hidden_name;
	}

	/**
	 * @param hidden_name the hidden_name to set
	 */
	public void setHidden_name(String hidden_name) {
		this.hidden_name = hidden_name;
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
	 * @return the file_name
	 */
	public String getFile_name() {
		return file_name;
	}

	/**
	 * @param file_name the file_name to set
	 */
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	/**
	 * @return the content_template_id
	 */
	public Long getContent_template_id() {
		return content_template_id;
	}

	/**
	 * @param content_template_id the content_template_id to set
	 */
	public void setContent_template_id(Long content_template_id) {
		this.content_template_id = content_template_id;
	}

	/**
	 * @return the type_template_id
	 */
	public Long getType_template_id() {
		return type_template_id;
	}

	/**
	 * @param type_template_id the type_template_id to set
	 */
	public void setType_template_id(Long type_template_id) {
		this.type_template_id = type_template_id;
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
	 * @return the attr_id
	 */
	public Long getAttr_id() {
		return attr_id;
	}

	/**
	 * @param attr_id the attr_id to set
	 */
	public void setAttr_id(Long attr_id) {
		this.attr_id = attr_id;
	}

}
