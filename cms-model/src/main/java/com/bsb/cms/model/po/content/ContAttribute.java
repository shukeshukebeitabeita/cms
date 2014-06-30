package com.bsb.cms.model.po.content;

import com.bsb.cms.model.po.Entity;
/**
 * 栏目类型/属性
 * @author hongjian.liu
 * @version 1.0.0 2014-6-25
 * @since 1.0
 */
public class ContAttribute extends Entity {
    /**
	 * 
	 */
	private static final long serialVersionUID = 5702055939567621169L;

	private Long id;

    private Short hasImg;

    private Short hasOutLink;

    private Short hasVedio;

    private Short hasDetail;

    private Short hasAbout;

    private Short hasExtAttribute;

    private Short hasKeywore;

    private Short hasSource;

    private Short hasShowTime;

    private Short hasMetaTitle;

    private Short hasMetaKeywords;

    private Short hasMetaDescription;

    private Short hasTag;

    private Short hasOrderOpt;

    private String name;

    private String remark;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Short getHasImg() {
        return hasImg;
    }

    public void setHasImg(Short hasImg) {
        this.hasImg = hasImg;
    }

    public Short getHasOutLink() {
        return hasOutLink;
    }

    public void setHasOutLink(Short hasOutLink) {
        this.hasOutLink = hasOutLink;
    }

    public Short getHasVedio() {
        return hasVedio;
    }

    public void setHasVedio(Short hasVedio) {
        this.hasVedio = hasVedio;
    }

    public Short getHasDetail() {
        return hasDetail;
    }

    public void setHasDetail(Short hasDetail) {
        this.hasDetail = hasDetail;
    }

    public Short getHasAbout() {
        return hasAbout;
    }

    public void setHasAbout(Short hasAbout) {
        this.hasAbout = hasAbout;
    }

    public Short getHasExtAttribute() {
        return hasExtAttribute;
    }

    public void setHasExtAttribute(Short hasExtAttribute) {
        this.hasExtAttribute = hasExtAttribute;
    }

    public Short getHasKeywore() {
        return hasKeywore;
    }

    public void setHasKeywore(Short hasKeywore) {
        this.hasKeywore = hasKeywore;
    }

    public Short getHasSource() {
        return hasSource;
    }

    public void setHasSource(Short hasSource) {
        this.hasSource = hasSource;
    }

    public Short getHasShowTime() {
        return hasShowTime;
    }

    public void setHasShowTime(Short hasShowTime) {
        this.hasShowTime = hasShowTime;
    }

    public Short getHasMetaTitle() {
        return hasMetaTitle;
    }

    public void setHasMetaTitle(Short hasMetaTitle) {
        this.hasMetaTitle = hasMetaTitle;
    }

    public Short getHasMetaKeywords() {
        return hasMetaKeywords;
    }

    public void setHasMetaKeywords(Short hasMetaKeywords) {
        this.hasMetaKeywords = hasMetaKeywords;
    }

    public Short getHasMetaDescription() {
        return hasMetaDescription;
    }

    public void setHasMetaDescription(Short hasMetaDescription) {
        this.hasMetaDescription = hasMetaDescription;
    }

    public Short getHasTag() {
        return hasTag;
    }

    public void setHasTag(Short hasTag) {
        this.hasTag = hasTag;
    }

    public Short getHasOrderOpt() {
        return hasOrderOpt;
    }

    public void setHasOrderOpt(Short hasOrderOpt) {
        this.hasOrderOpt = hasOrderOpt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
  
}