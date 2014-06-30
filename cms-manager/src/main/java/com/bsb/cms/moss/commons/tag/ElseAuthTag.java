/**
 * @(#)${file_name} ${date}
 *
 * Copyright (c) 2014-2015 BuShangBan (China) Int'l Co., Ltd
 * yongtai Road. pu dong District.Shanghai China
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of BuShangBan (China)
 *  Int'l Co., Ltd ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with BuShangBan (China).
 */
package com.bsb.cms.moss.commons.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.Tag;


/**
 *  权限判断else标签
 *  可配合IfAuthButtonTag使用
 * @author hongjian.liu
 * @version 1.0.0 2014-6-19
 * @since 1.0
 */
public class ElseAuthTag extends BodyTagSupport {

    /**
     * 
     */
    private static final long serialVersionUID = 346184497443624795L;

    /*
     * (non-Javadoc)
     * 
     * @see javax.servlet.jsp.tagext.BodyTagSupport#doStartTag()
     */
    @Override
    public int doStartTag() throws JspException {
        Tag parent = getParent();
        if (parent == null || !(parent instanceof IfAuthButtonTag)) {
            throw new JspTagException("else tag must inside if tag");
        }

        IfAuthButtonTag iftag = (IfAuthButtonTag) parent;
        if (iftag.isSucceeded()) {// 如果if返回成功
            iftag.setBody();
        } else {// 如果if返回失败，则清空if之前的输出
            iftag.getBodyContent().clearBody();
            iftag.succeeded();
        }
        return super.doStartTag();
    }

    /*
     * (non-Javadoc)
     * 
     * @see javax.servlet.jsp.tagext.BodyTagSupport#release()
     */
    /*
     * (non-Javadoc)
     * 
     * @see javax.servlet.jsp.tagext.BodyTagSupport#release()
     */
    @Override
    public void release() {
        super.release();
    }

}
