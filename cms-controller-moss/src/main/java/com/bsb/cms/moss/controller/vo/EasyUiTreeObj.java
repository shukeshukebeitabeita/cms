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
package com.bsb.cms.moss.controller.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 树形菜单对象。
 * 
 * @author hongjian.liu
 * @version 1.0.0 2014-5-30
 * @since 1.0
 */
public class EasyUiTreeObj {
	public static final String OPEN = "open";
	public static final String CLOSED = "closed";
	
    private String id;// id
    private String text;// 节点名
    private String state = OPEN;// closed:关闭；open:打开
    private List<EasyUiTreeObj> children = new ArrayList<EasyUiTreeObj>();// 子菜单
    private Map<String, String> attributes;//自定义属性
    

    
    /**
     * 构造函数
     * 
     * @param id
     * @param text
     * @param state
     * @param children
     */
    public EasyUiTreeObj(String id, String text, String state, List<EasyUiTreeObj> children, Map<String, String> attributes) {
        super();
        this.id = id;
        this.text = text;
        this.state = state;
        this.children = children;
        this.attributes =attributes;
    }


    /**
     * 构造函数
     * 
     * @param id
     * @param text
     * @param children
     */
    public EasyUiTreeObj(String id, String text, List<EasyUiTreeObj> children, Map<String, String> attributes) {
        super();
        this.id = id;
        this.text = text;
        this.children = children;
        this.attributes =attributes;
    }

    
    /**
     * 构造函数
     */
    public EasyUiTreeObj() {
        super();
    }

    /**
     * @param id
     * @param text
     */
    public EasyUiTreeObj(String id, String text, Map<String, String> attributes) {
        super();
        this.id = id;
        this.text = text;
        this.attributes =attributes;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the text
     */
    public String getText() {
        return text;
    }

    /**
     * @param text the text to set
     */
    public void setText(String text) {
        this.text = text;
    }

    /**
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * @return the children
     */
    public List<EasyUiTreeObj> getChildren() {
        return children;
    }

    /**
     * @param children the children to set
     */
    public void setChildren(List<EasyUiTreeObj> children) {
        this.children = children;
    }


	/**
	 * @return the attributes
	 */
	public Map<String, String> getAttributes() {
		return attributes;
	}


	/**
	 * @param attributes the attributes to set
	 */
	public void setAttributes(Map<String, String> attributes) {
		this.attributes = attributes;
	}

	public void setOneAttribute(String key, String value) {
		if(attributes == null)
			attributes = new HashMap<String, String>();
		this.attributes.put(key, value);
	}
}
