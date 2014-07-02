/**
 * @(#)ContAttributeDTO.java 2014-7-2
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
public class ContAttributeDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8929021495607895328L;

	private Long id;

    private Short has_image;

    private Short has_link;

    private Short has_vedio;

    private Short has_detail;

    private Short has_about;

    private Short has_ext_attribute;

    private Short has_keyword;

    private Short has_source;

    private Short has_showtime;

    private Short has_seo;

    private Short has_tag;

    private Short has_orderopt;
    
    private Short has_author;

    private String name;

    private String remark;
    
    private ContExtAttributeDTO ext_attrs;

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
	 * @return the has_image
	 */
	public Short getHas_image() {
		return has_image;
	}

	/**
	 * @param has_image the has_image to set
	 */
	public void setHas_image(Short has_image) {
		this.has_image = has_image;
	}



	/**
	 * @return the has_link
	 */
	public Short getHas_link() {
		return has_link;
	}

	/**
	 * @param has_link the has_link to set
	 */
	public void setHas_link(Short has_link) {
		this.has_link = has_link;
	}

	/**
	 * @return the has_vedio
	 */
	public Short getHas_vedio() {
		return has_vedio;
	}

	/**
	 * @param has_vedio the has_vedio to set
	 */
	public void setHas_vedio(Short has_vedio) {
		this.has_vedio = has_vedio;
	}

	/**
	 * @return the has_detail
	 */
	public Short getHas_detail() {
		return has_detail;
	}

	/**
	 * @param has_detail the has_detail to set
	 */
	public void setHas_detail(Short has_detail) {
		this.has_detail = has_detail;
	}

	/**
	 * @return the has_about
	 */
	public Short getHas_about() {
		return has_about;
	}

	/**
	 * @param has_about the has_about to set
	 */
	public void setHas_about(Short has_about) {
		this.has_about = has_about;
	}

	/**
	 * @return the has_ext_attribute
	 */
	public Short getHas_ext_attribute() {
		return has_ext_attribute;
	}

	/**
	 * @param has_ext_attribute the has_ext_attribute to set
	 */
	public void setHas_ext_attribute(Short has_ext_attribute) {
		this.has_ext_attribute = has_ext_attribute;
	}

	/**
	 * @return the has_keyword
	 */
	public Short getHas_keyword() {
		return has_keyword;
	}

	/**
	 * @param has_keyword the has_keyword to set
	 */
	public void setHas_keyword(Short has_keyword) {
		this.has_keyword = has_keyword;
	}

	/**
	 * @return the has_source
	 */
	public Short getHas_source() {
		return has_source;
	}

	/**
	 * @param has_source the has_source to set
	 */
	public void setHas_source(Short has_source) {
		this.has_source = has_source;
	}

	/**
	 * @return the has_showtime
	 */
	public Short getHas_showtime() {
		return has_showtime;
	}

	/**
	 * @param has_showtime the has_showtime to set
	 */
	public void setHas_showtime(Short has_showtime) {
		this.has_showtime = has_showtime;
	}

	/**
	 * @return the has_seo
	 */
	public Short getHas_seo() {
		return has_seo;
	}

	/**
	 * @param has_seo the has_seo to set
	 */
	public void setHas_seo(Short has_seo) {
		this.has_seo = has_seo;
	}

	/**
	 * @return the has_tag
	 */
	public Short getHas_tag() {
		return has_tag;
	}

	/**
	 * @param has_tag the has_tag to set
	 */
	public void setHas_tag(Short has_tag) {
		this.has_tag = has_tag;
	}

	/**
	 * @return the has_orderopt
	 */
	public Short getHas_orderopt() {
		return has_orderopt;
	}

	/**
	 * @param has_orderopt the has_orderopt to set
	 */
	public void setHas_orderopt(Short has_orderopt) {
		this.has_orderopt = has_orderopt;
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
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * @return the ext_attrs
	 */
	public ContExtAttributeDTO getExt_attrs() {
		return ext_attrs;
	}

	/**
	 * @param ext_attrs the ext_attrs to set
	 */
	public void setExt_attrs(ContExtAttributeDTO ext_attrs) {
		this.ext_attrs = ext_attrs;
	}

	/**
	 * @return the has_author
	 */
	public Short getHas_author() {
		return has_author;
	}

	/**
	 * @param has_author the has_author to set
	 */
	public void setHas_author(Short has_author) {
		this.has_author = has_author;
	}
    
}
