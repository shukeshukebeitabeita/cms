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
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.collections.CollectionUtils;

import com.bsb.cms.commons.web.MossActionUtils;
import com.bsb.cms.model.dto.auth.SysModelDTO;
import com.bsb.cms.model.vo.User;

/**
 * 权限判断if标签 可配合ElseAuthTag使用
 * 
 * @author hongjian.liu
 * @version 1.0.0 2014-6-15
 * @since 1.0
 */
public class IfAuthButtonTag extends BodyTagSupport {

    /**
     * 
     */
    private static final long serialVersionUID = 2495750488285372692L;
    private String code;// 模块code
    private boolean subTagSucceeded;

    /**
     * 
     */
    public IfAuthButtonTag() {
        super();
        init();
    }

    private void init() {
        subTagSucceeded = false;
        body = null;
    }

    /*
     * (non-Javadoc)
     * 
     * @see javax.servlet.jsp.tagext.BodyTagSupport#doStartTag()
     */
    @Override
    public int doStartTag() throws JspException {
        if (isHasOperate((HttpServletRequest) pageContext.getRequest(), code)) {
            this.succeeded();
        }

        return super.doStartTag();
    }

    /*
     * (non-Javadoc)
     * 
     * @see javax.servlet.jsp.tagext.BodyTagSupport#doEndTag()
     */
    @Override
    public int doEndTag() throws JspException {
        if (subTagSucceeded) {
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

    /**
     * 判断是否有权限
     * 
     * @param req
     * @param code 权限值
     * @return true:有
     */
    public static boolean isHasOperate(HttpServletRequest req, String code) {
        boolean isHasOperate = false;
        if (MossActionUtils.isAdmin(req.getSession())) {
            isHasOperate = true;
        } else {
            User user = MossActionUtils.getUser(req.getSession());
            List<SysModelDTO> menus = user.getMenus();
            if (CollectionUtils.isNotEmpty(menus)) {
                for (SysModelDTO menu : menus) {
                    if (code.equals(menu.getModelCode())) {
                        isHasOperate = true;
                        break;
                    }
                }
            }
        }
        return isHasOperate;
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
     * @param isSucceeded the isSucceeded to set
     */
    public void succeeded() {
        subTagSucceeded = true;
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

    /**
     * @return the isSucceeded
     */
    public boolean isSucceeded() {
        return subTagSucceeded;
    }

}
