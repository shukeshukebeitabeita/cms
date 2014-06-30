/**
 * @(#)LoginDTO.java 2013-5-30
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
package com.bsb.cms.model.vo;

import java.io.Serializable;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;


/**
 * 登录用dto
 * @author hongjian.liu
 * @version 1.0.0 2014-5-30
 * @since 1.0
 */
public class LoginVO implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 5556502647823336700L;
    @NotBlank
    @Length(max=20)
    private String name;
    @NotBlank
    @Length(max=20)
    private String password;

    
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    
    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    
    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    
    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
    

}
