package com.bsb.cms.model.po.content;

import java.io.Serializable;

/**
 * 内容属性值
 * @author hongjian.liu
 * @version 1.0.0 2014-6-25
 * @since 1.0
 */
public class ContExtAttrValue implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -4640015913919643265L;

	private Long valueId;

    private Long attrId;

    private Long contentId;

    private Long extAttrId;

    private Long attrValue;

    public Long getValueId() {
        return valueId;
    }

    public void setValueId(Long valueId) {
        this.valueId = valueId;
    }

    public Long getAttrId() {
        return attrId;
    }

    public void setAttrId(Long attrId) {
        this.attrId = attrId;
    }

    public Long getContentId() {
        return contentId;
    }

    public void setContentId(Long contentId) {
        this.contentId = contentId;
    }

    public Long getExtAttrId() {
        return extAttrId;
    }

    public void setExtAttrId(Long extAttrId) {
        this.extAttrId = extAttrId;
    }

    public Long getAttrValue() {
        return attrValue;
    }

    public void setAttrValue(Long attrValue) {
        this.attrValue = attrValue;
    }
}