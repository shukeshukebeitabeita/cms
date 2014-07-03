package com.bsb.cms.model.po.content;

import java.io.Serializable;

/**
 * 详细内容对象
 * @author hongjian.liu
 * @version 1.0.0 2014-6-25
 * @since 1.0
 */
public class ContContentBody implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -2068631243863047618L;

	private Long bodyId;

    private Long contentId;
    
	private String extAttrBody;

    private String contentBody;

    /**
	 * @return the bodyId
	 */
	public Long getBodyId() {
		return bodyId;
	}

	/**
	 * @param bodyId the bodyId to set
	 */
	public void setBodyId(Long bodyId) {
		this.bodyId = bodyId;
	}

	public Long getContentId() {
        return contentId;
    }

    public void setContentId(Long contentId) {
        this.contentId = contentId;
    }


    /**
	 * @param body
	 */
	public ContContentBody(String body) {
		super();
		this.contentBody = body;
	}

	/**
	 * 
	 */
	public ContContentBody() {
		super();
	}

	/**
	 * @param extAttrBody
	 * @param body
	 */
	public ContContentBody(String extAttrBody, String body) {
		super();
		this.extAttrBody = extAttrBody;
		this.contentBody = body;
	}

	public String getExtAttrBody() {
        return extAttrBody;
    }

    public void setExtAttrBody(String extAttrBody) {
        this.extAttrBody = extAttrBody == null ? null : extAttrBody.trim();
    }

    public String getContentBody() {
        return contentBody;
    }

    public void setContentBody(String contentBody) {
        this.contentBody = contentBody == null ? null : contentBody.trim();
    }
}