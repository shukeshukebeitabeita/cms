/**
 * @(#)ContContentAllDTO.java 2014-7-2
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
package com.bsb.cms.model.dto.content;

import com.bsb.cms.model.po.content.ContContent;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-2
 * @since 1.0
 */
public class ContContentAllDTO extends ContContent {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5259902414040567369L;

	private String extAttrBody;

    private String contentBody;
    
    private Long bodyId;

	/**
	 * @return the extAttrBody
	 */
	public String getExtAttrBody() {
		return extAttrBody;
	}

	/**
	 * @param extAttrBody the extAttrBody to set
	 */
	public void setExtAttrBody(String extAttrBody) {
		this.extAttrBody = extAttrBody;
	}

	

	/**
	 * @return the contentBody
	 */
	public String getContentBody() {
		return contentBody;
	}

	/**
	 * @param contentBody the contentBody to set
	 */
	public void setContentBody(String contentBody) {
		this.contentBody = contentBody;
	}

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
    
}
