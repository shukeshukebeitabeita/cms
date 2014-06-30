package com.bsb.cms.model.po.content;

import java.io.Serializable;

public class ContExtAttributeKey implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -897202843984685305L;

	private Long extId;

    private Long attrId;

    public Long getExtId() {
        return extId;
    }

    public void setExtId(Long extId) {
        this.extId = extId;
    }

    public Long getAttrId() {
        return attrId;
    }

    public void setAttrId(Long attrId) {
        this.attrId = attrId;
    }
}