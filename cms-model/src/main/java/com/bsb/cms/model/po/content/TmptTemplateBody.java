package com.bsb.cms.model.po.content;

import java.io.Serializable;

/**
 * 模板内容
 * @author hongjian.liu
 * @version 1.0.0 2014-6-25
 * @since 1.0
 */
public class TmptTemplateBody implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -5462019680244333686L;

	private Long id;

    private Long templateId;

    private String templateBody;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Long templateId) {
        this.templateId = templateId;
    }

    public String getTemplateBody() {
        return templateBody;
    }

    public void setTemplateBody(String templateBody) {
        this.templateBody = templateBody == null ? null : templateBody.trim();
    }
}