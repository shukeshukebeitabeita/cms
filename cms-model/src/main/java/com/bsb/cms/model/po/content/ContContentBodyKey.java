package com.bsb.cms.model.po.content;

import java.io.Serializable;

public class ContContentBodyKey implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -214819002857069443L;

	private Long id;

    private Long contentId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getContentId() {
        return contentId;
    }

    public void setContentId(Long contentId) {
        this.contentId = contentId;
    }
}