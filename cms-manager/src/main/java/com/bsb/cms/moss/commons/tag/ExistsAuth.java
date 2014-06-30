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

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;


/**
 * 权限判断。 权限存在时返回body,否则不输出body。
 * 
 * @author hongjian.liu
 * @version 1.0.0 2014-6-19
 * @since 1.0
 */
public class ExistsAuth extends BodyTagSupport {

    /**
     * 
     */
    private static final long serialVersionUID = 2495750488285372692L;
    private String code;// 模块code
    private boolean isSucceeded;

    /**
     * 
     */
    public ExistsAuth() {
        super();
        init();
    }

    private void init() {
        isSucceeded = false;
        body = null;
    }

    /*
     * (non-Javadoc)
     * 
     * @see javax.servlet.jsp.tagext.BodyTagSupport#doStartTag()
     */
    @Override
    public int doStartTag() throws JspException {
        this.isSucceeded = IfAuthButtonTag.isHasOperate((HttpServletRequest) pageContext.getRequest(), code);

        return super.doStartTag();
    }

    /*
     * (non-Javadoc)
     * 
     * @see javax.servlet.jsp.tagext.BodyTagSupport#doEndTag()
     */
    @Override
    public int doEndTag() throws JspException {
        if (isSucceeded) {
            try {
                pageContext.getOut().write(getBody());
            } catch (IOException e) {
                throw new JspException(e.getMessage(), e);
            }
        }

        init();

        return super.doEndTag();
    }

    /*
     * (non-Javadoc)
     * 
     * @see javax.servlet.jsp.tagext.BodyTagSupport#release()
     */
    @Override
    public void release() {
        super.release();
        init();
    }

    /*
     * (non-Javadoc)
     * 
     * @see javax.servlet.jsp.tagext.BodyTagSupport#getBodyContent()
     */
    @Override
    public BodyContent getBodyContent() {
        return super.getBodyContent();
    }

    private String body = null;

    public String getBody() {
        if (body == null) {
            return bodyContent.getString().trim();
        } else {
            return body;
        }
    }

    public void setBody() {
        if (body == null) {
            bodyContent.getString().trim();
        }
    }

    /**
     * @return the code
     */
    public String getCode() {
        return code;
    }

    /**
     * @param code the code to set
     */
    public void setCode(String code) {
        this.code = code;
    }

}
