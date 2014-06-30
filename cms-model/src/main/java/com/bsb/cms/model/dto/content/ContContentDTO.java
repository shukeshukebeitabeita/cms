/**
 * @(#)ContContentDTO.java 2014-6-27
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
import java.util.Date;

/**
 * 运营后台-内容Object
 * @author hongjian.liu
 * @version 1.0.0 2014-6-27
 * @since 1.0
 */
public class ContContentDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5590712741902222342L;

	private Long id;

    private String title;

//    private String about;

    private String defaultImg;

//    private String vedio;

//    private String audio;

    private String link;

    private Long typeId;

    private Long attrId;

    private Long templateId;

    private String author;

    private Date publishTime;

    private Short hasHot;

    private Short hasLatest;

    private Short hasTop;

//    private String metaTitle;

//    private String metaKeywords;

//    private String metaDescription;

//    private String cTag;

//    private String keyword;

    private Integer sort;

//    private String source;

//    private BigDecimal price;

    private BigDecimal salePrice;

//    private Integer stock;

    private BigDecimal discount;

//    private String brand;

    private String goodsUrl;

    private Short status;

    private String titleStyle;
    
    private String typeName;
    
    private String attributeName;

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
	 * @return the defaultImg
	 */
	public String getDefaultImg() {
		return defaultImg;
	}

	/**
	 * @param defaultImg the defaultImg to set
	 */
	public void setDefaultImg(String defaultImg) {
		this.defaultImg = defaultImg;
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
	 * @return the typeId
	 */
	public Long getTypeId() {
		return typeId;
	}

	/**
	 * @param typeId the typeId to set
	 */
	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	/**
	 * @return the attrId
	 */
	public Long getAttrId() {
		return attrId;
	}

	/**
	 * @param attrId the attrId to set
	 */
	public void setAttrId(Long attrId) {
		this.attrId = attrId;
	}

	/**
	 * @return the templateId
	 */
	public Long getTemplateId() {
		return templateId;
	}

	/**
	 * @param templateId the templateId to set
	 */
	public void setTemplateId(Long templateId) {
		this.templateId = templateId;
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
	 * @return the publishTime
	 */
	public Date getPublishTime() {
		return publishTime;
	}

	/**
	 * @param publishTime the publishTime to set
	 */
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	/**
	 * @return the hasHot
	 */
	public Short getHasHot() {
		return hasHot;
	}

	/**
	 * @param hasHot the hasHot to set
	 */
	public void setHasHot(Short hasHot) {
		this.hasHot = hasHot;
	}

	/**
	 * @return the hasLatest
	 */
	public Short getHasLatest() {
		return hasLatest;
	}

	/**
	 * @param hasLatest the hasLatest to set
	 */
	public void setHasLatest(Short hasLatest) {
		this.hasLatest = hasLatest;
	}

	/**
	 * @return the hasTop
	 */
	public Short getHasTop() {
		return hasTop;
	}

	/**
	 * @param hasTop the hasTop to set
	 */
	public void setHasTop(Short hasTop) {
		this.hasTop = hasTop;
	}

	/**
	 * @return the sort
	 */
	public Integer getSort() {
		return sort;
	}

	/**
	 * @param sort the sort to set
	 */
	public void setSort(Integer sort) {
		this.sort = sort;
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
	 * @return the goodsUrl
	 */
	public String getGoodsUrl() {
		return goodsUrl;
	}

	/**
	 * @param goodsUrl the goodsUrl to set
	 */
	public void setGoodsUrl(String goodsUrl) {
		this.goodsUrl = goodsUrl;
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
	 * @return the titleStyle
	 */
	public String getTitleStyle() {
		return titleStyle;
	}

	/**
	 * @param titleStyle the titleStyle to set
	 */
	public void setTitleStyle(String titleStyle) {
		this.titleStyle = titleStyle;
	}

	/**
	 * @return the typeName
	 */
	public String getTypeName() {
		return typeName;
	}

	/**
	 * @param typeName the typeName to set
	 */
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	/**
	 * @return the attributeName
	 */
	public String getAttributeName() {
		return attributeName;
	}

	/**
	 * @param attributeName the attributeName to set
	 */
	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}
    
    
}
