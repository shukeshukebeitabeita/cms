package com.bsb.cms.model.po.content;

/**
 * 详细内容对象
 * @author hongjian.liu
 * @version 1.0.0 2014-6-25
 * @since 1.0
 */
public class ContContentBody extends ContContentBodyKey {
    /**
	 * 
	 */
	private static final long serialVersionUID = -2068631243863047618L;

	private String extAttrBody;

    private String body;

    public String getExtAttrBody() {
        return extAttrBody;
    }

    public void setExtAttrBody(String extAttrBody) {
        this.extAttrBody = extAttrBody == null ? null : extAttrBody.trim();
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body == null ? null : body.trim();
    }
}