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

    private Short hasKeyword;

    private Short hasSource;

    private Short hasShowTime;

    private Short hasSEO;

    private Short hasTag;

    private Short hasOrderOpt;

    private String name;

    private String remark;
    
    private Short hasAuthor;


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

    /**
	 * @return the hasKeyword
	 */
	public Short getHasKeyword() {
		return hasKeyword;
	}

	/**
	 * @param hasKeyword the hasKeyword to set
	 */
	public void setHasKeyword(Short hasKeyword) {
		this.hasKeyword = hasKeyword;
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


    /**
	 * @return the hasSEO
	 */
	public Short getHasSEO() {
		return hasSEO;
	}

	/**
	 * @param hasSEO the hasSEO to set
	 */
	public void setHasSEO(Short hasSEO) {
		this.hasSEO = hasSEO;
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

	/**
	 * @return the hasAuthor
	 */
	public Short getHasAuthor() {
		return hasAuthor;
	}

	/**
	 * @param hasAuthor the hasAuthor to set
	 */
	public void setHasAuthor(Short hasAuthor) {
		this.hasAuthor = hasAuthor;
	}
  
}