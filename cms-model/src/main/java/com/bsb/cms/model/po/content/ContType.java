package com.bsb.cms.model.po.content;

import com.bsb.cms.model.po.Entity;
/**
 * 栏目
 * @author hongjian.liu
 * @version 1.0.0 2014-6-25
 * @since 1.0
 */
public class ContType  extends Entity {
    /**
	 * 
	 */
	private static final long serialVersionUID = 5634599155927367377L;

	private Long id;

    private String about;

    private String typeImg;

    private String typeName;

    private String showName;

    private Long parentId;

    private String remark;

    private String fileDir;

    private String fileName;

    private Short typeSort;
    
    private Long listTemplate;
    
    private Long attrId;
    
    private Long contentTemplate;

    private Long typeTemplate;

    private Short depth;
    
    private Short status;
    
    private String metaTitle;

    private String metaKeywords;

    private String metaDescription;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    /**
	 * @return the listTemplate
	 */
	public Long getListTemplate() {
		return listTemplate;
	}

	/**
	 * @param listTemplate the listTemplate to set
	 */
	public void setListTemplate(Long listTemplate) {
		this.listTemplate = listTemplate;
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

	public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about == null ? null : about.trim();
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

	public String getTypeImg() {
        return typeImg;
    }

    public void setTypeImg(String typeImg) {
        this.typeImg = typeImg == null ? null : typeImg.trim();
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public String getShowName() {
        return showName;
    }

    public void setShowName(String showName) {
        this.showName = showName == null ? null : showName.trim();
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getFileDir() {
        return fileDir;
    }

    public void setFileDir(String fileDir) {
        this.fileDir = fileDir == null ? null : fileDir.trim();
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public Short getTypeSort() {
        return typeSort;
    }

    public void setTypeSort(Short typeSort) {
        this.typeSort = typeSort;
    }

    public Long getContentTemplate() {
        return contentTemplate;
    }

    public void setContentTemplate(Long contentTemplate) {
        this.contentTemplate = contentTemplate;
    }

    public Long getTypeTemplate() {
        return typeTemplate;
    }

    public void setTypeTemplate(Long typeTemplate) {
        this.typeTemplate = typeTemplate;
    }

    public Short getDepth() {
        return depth;
    }

    public void setDepth(Short depth) {
        this.depth = depth;
    }

	/**
	 * @return the metaTitle
	 */
	public String getMetaTitle() {
		return metaTitle;
	}

	/**
	 * @param metaTitle the metaTitle to set
	 */
	public void setMetaTitle(String metaTitle) {
		this.metaTitle = metaTitle;
	}

	/**
	 * @return the metaKeywords
	 */
	public String getMetaKeywords() {
		return metaKeywords;
	}

	/**
	 * @param metaKeywords the metaKeywords to set
	 */
	public void setMetaKeywords(String metaKeywords) {
		this.metaKeywords = metaKeywords;
	}

	/**
	 * @return the metaDescription
	 */
	public String getMetaDescription() {
		return metaDescription;
	}

	/**
	 * @param metaDescription the metaDescription to set
	 */
	public void setMetaDescription(String metaDescription) {
		this.metaDescription = metaDescription;
	}


}