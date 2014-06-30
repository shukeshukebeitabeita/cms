/**
 * @(#)SysModelDTO.java 2013-6-8
 *
 * Copyright (c) 2013-2014 UNS (China) Int'l Co., Ltd
 * 3855 shang nan Road. pu dong District.Shanghai 201302 China
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of UNS (China)
 *  Int'l Co., Ltd ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with UNS (China).
 */
package com.bsb.cms.model.dto.auth;

import com.bsb.cms.model.po.auth.SysModel;


/**
 * 菜单查询。
 * @author hongjian.liu
 * @version 1.0.0 2014-6-8
 * @since 1.0
 */
public class SysModelDTO extends SysModel {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = -8925006113472715994L;
	private Long sysRoleId;
    private Long parentId;
    
    
    /**
     * @return the parentId
     */
    public Long getParentId() {
        return parentId;
    }


    
    /**
     * @param parentId the parentId to set
     */
    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }


    /**
     * @return the sysRoleId
     */
    public Long getSysRoleId() {
        return sysRoleId;
    }

    
    /**
     * @param sysRoleId the sysRoleId to set
     */
    public void setSysRoleId(Long sysRoleId) {
        this.sysRoleId = sysRoleId;
    }
    
    
}
