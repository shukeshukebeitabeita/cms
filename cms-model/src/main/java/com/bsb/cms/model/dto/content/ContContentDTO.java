/**
 * @(#)ContContentDTO.java 2014-7-2
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
import java.math.BigDecimal;

import org.apache.commons.lang.StringUtils;

/**
 * 面向前台模板里的内容变量.
 * @author hongjian.liu
 * @version 1.0.0 2014-7-2
 * @since 1.0
 */
public class ContContentDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7303758321828092625L;

	private Long content_id;

    private String title;

    private String about;

    private String default_img;

    private String vedio;

    private String audio;

    private String link;

    private Long type_id;

    private Long attr_id;

    private Long template_id;

    private String author;

    private String publish_time;

    private Short has_hot;

    private Short has_latest;

    private Short has_top;

    private String meta_title;

    private String meta_keywords;

    private String meta_description;

//    private String tag;

    private String keyword;

//    private Integer sort;

    private String source;

    private BigDecimal price;

    private BigDecimal salePrice;

    private Integer stock;

    private BigDecimal discount;

    private String brand;

    private String goods_url;

//    private Integer status;

    private String title_style;
    
	private String ext_attr;

    private String content_body;
    
    private String url;

	/**
	 * @return the content_id
	 */
	public Long getContent_id() {
		return content_id;
	}

	/**
	 * @param content_id the content_id to set
	 */
	public void setContent_id(Long content_id) {
		this.content_id = content_id;
	}



	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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
	 * @return the default_img
	 */
	public String getDefault_img() {
		return default_img;
	}

	/**
	 * @param default_img the default_img to set
	 */
	public void setDefault_img(String default_img) {
		this.default_img = default_img;
	}

	/**
	 * @return the vedio
	 */
	public String getVedio() {
		return vedio;
	}

	/**
	 * @param vedio the vedio to set
	 */
	public void setVedio(String vedio) {
		this.vedio = vedio;
	}

	/**
	 * @return the audio
	 */
	public String getAudio() {
		return audio;
	}

	/**
	 * @param audio the audio to set
	 */
	public void setAudio(String audio) {
		this.audio = audio;
	}

	/**
	 * @return the link
	 */
	public String getLink() {
		return link;
	}

	/**
	 * @param link the link to set
	 */
	public void setLink(String link) {
		this.link = link;
	}

	/**
	 * @return the type_id
	 */
	public Long getType_id() {
		return type_id;
	}

	/**
	 * @param type_id the type_id to set
	 */
	public void setType_id(Long type_id) {
		this.type_id = type_id;
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

	/**
	 * @return the template_id
	 */
	public Long getTemplate_id() {
		return template_id;
	}

	/**
	 * @param template_id the template_id to set
	 */
	public void setTemplate_id(Long template_id) {
		this.template_id = template_id;
	}

	/**
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}

	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
	}

	/**
	 * @return the publish_time
	 */
	public String getPublish_time() {
		if(StringUtils.isNotBlank(publish_time)){
			publish_time = publish_time.substring(0, 16);
		}
		return publish_time;
	}

	/**
	 * @param publish_time the publish_time to set
	 */
	public void setPublish_time(String publish_time) {
		this.publish_time = publish_time;
	}

	/**
	 * @return the has_hot
	 */
	public Short getHas_hot() {
		return has_hot;
	}

	/**
	 * @param has_hot the has_hot to set
	 */
	public void setHas_hot(Short has_hot) {
		this.has_hot = has_hot;
	}

	/**
	 * @return the has_latest
	 */
	public Short getHas_latest() {
		return has_latest;
	}

	/**
	 * @param has_latest the has_latest to set
	 */
	public void setHas_latest(Short has_latest) {
		this.has_latest = has_latest;
	}

	/**
	 * @return the has_top
	 */
	public Short getHas_top() {
		return has_top;
	}

	/**
	 * @param has_top the has_top to set
	 */
	public void setHas_top(Short has_top) {
		this.has_top = has_top;
	}

	/**
	 * @return the meta_title
	 */
	public String getMeta_title() {
		return meta_title;
	}

	/**
	 * @param meta_title the meta_title to set
	 */
	public void setMeta_title(String meta_title) {
		this.meta_title = meta_title;
	}

	/**
	 * @return the meta_keywords
	 */
	public String getMeta_keywords() {
		return meta_keywords;
	}

	/**
	 * @param meta_keywords the meta_keywords to set
	 */
	public void setMeta_keywords(String meta_keywords) {
		this.meta_keywords = meta_keywords;
	}

	/**
	 * @return the meta_description
	 */
	public String getMeta_description() {
		return meta_description;
	}

	/**
	 * @param meta_description the meta_description to set
	 */
	public void setMeta_description(String meta_description) {
		this.meta_description = meta_description;
	}


	/**
	 * @return the keyword
	 */
	public String getKeyword() {
		return keyword;
	}

	/**
	 * @param keyword the keyword to set
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	/**
	 * @return the source
	 */
	public String getSource() {
		return source;
	}

	/**
	 * @param source the source to set
	 */
	public void setSource(String source) {
		this.source = source;
	}

	/**
	 * @return the price
	 */
	public BigDecimal getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	/**
	 * @return the salePrice
	 */
	public BigDecimal getSalePrice() {
		return salePrice;
	}

	/**
	 * @param salePrice the salePrice to set
	 */
	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	/**
	 * @return the stock
	 */
	public Integer getStock() {
		return stock;
	}

	/**
	 * @param stock the stock to set
	 */
	public void setStock(Integer stock) {
		this.stock = stock;
	}

	/**
	 * @return the discount
	 */
	public BigDecimal getDiscount() {
		return discount;
	}

	/**
	 * @param discount the discount to set
	 */
	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}

	/**
	 * @return the brand
	 */
	public String getBrand() {
		return brand;
	}

	/**
	 * @param brand the brand to set
	 */
	public void setBrand(String brand) {
		this.brand = brand;
	}

	/**
	 * @return the goods_url
	 */
	public String getGoods_url() {
		return goods_url;
	}

	/**
	 * @param goods_url the goods_url to set
	 */
	public void setGoods_url(String goods_url) {
		this.goods_url = goods_url;
	}

	/**
	 * @return the title_style
	 */
	public String getTitle_style() {
		return title_style;
	}

	/**
	 * @param title_style the title_style to set
	 */
	public void setTitle_style(String title_style) {
		this.title_style = title_style;
	}

	/**
	 * @return the ext_attr
	 */
	public String getExt_attr() {
		return ext_attr;
	}

	/**
	 * @param ext_attr the ext_attr to set
	 */
	public void setExt_attr(String ext_attr) {
		this.ext_attr = ext_attr;
	}

	/**
	 * @return the content_body
	 */
	public String getContent_body() {
		return content_body;
	}

	/**
	 * @param content_body the content_body to set
	 */
	public void setContent_body(String content_body) {
		this.content_body = content_body;
	}
    
    
}
