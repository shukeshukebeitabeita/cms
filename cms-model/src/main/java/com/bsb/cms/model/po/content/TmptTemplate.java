package com.bsb.cms.model.po.content;

import com.bsb.cms.model.po.Entity;
/**
 * 模板
 * @author hongjian.liu
 * @version 1.0.0 2014-6-25
 * @since 1.0
 */
public class TmptTemplate  extends Entity {
    /**
	 * 
	 */
	private static final long serialVersionUID = -7549741716467612626L;

	private Long id;

    private Long parentId;

    private String templateName;

    private String fileDir;

    private String description;

    private Short status;

    private Short templateType;
    
    private Short hasLeaf;
    
    private String templateBody;//temp , no db column

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


	/**
	 * @return the templateBody
	 */
	public String getTemplateBody() {
		return templateBody;
	}

	/**
	 * @param templateBody the templateBody to set
	 */
	public void setTemplateBody(String templateBody) {
		this.templateBody = templateBody;
	}

	/**
	 * @return the hasLeaf
	 */
	public Short getHasLeaf() {
		return hasLeaf;
	}

	/**
	 * @param hasLeaf the hasLeaf to set
	 */
	public void setHasLeaf(Short hasLeaf) {
		this.hasLeaf = hasLeaf;
	}

	/**
	 * @return the parentId
	 */
	public Long getParentId() {
		return parentId;
	}

	/**
	 * @param parentId the parentId to set
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName == null ? null : templateName.trim();
    }

    public String getFileDir() {
        return fileDir;
    }

    public void setFileDir(String fileDir) {
        this.fileDir = fileDir == null ? null : fileDir.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Short getTemplateType() {
        return templateType;
    }

    public void setTemplateType(Short templateType) {
        this.templateType = templateType;
    }
}