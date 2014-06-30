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

import java.io.Serializable;
import java.util.List;


/**
 * easyui treegrid 对象。
 * @author hongjian.liu
 * @version 1.0.0 2014-6-8
 * @since 1.0
 */
public class TreegridVO implements Serializable{
    
    /**
     * 
     */
    private static final long serialVersionUID = -5471883360901632667L;
    private String id;//id
    private String name;//菜单名
    private String button1;//button
    private String button2;//button
    private String button3;//button
    private String button4;//button
    private String button5;//button
    private String button6;//button
    private String button7;//button
    private String button8;//button
    private String button9;//button
    
    
    private List<TreegridVO> children;
    


    /**
     * 
     */
    public TreegridVO() {
        super();
    }



    /**
     * @param id
     * @param name
     */
    public TreegridVO(String id, String name) {
        super();
        this.id = id;
        this.name = name;
    }



    /**
     * @return the children
     */
    public List<TreegridVO> getChildren() {
        return children;
    }


    
    /**
     * @param children the children to set
     */
    public void setChildren(List<TreegridVO> children) {
        this.children = children;
    }


    /**
     * @return the id
     */
    public String getId() {
        return id;
    }


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
     * @return the button1
     */
    public String getButton1() {
        return button1;
    }

    
    /**
     * @param button1 the button1 to set
     */
    public void setButton1(String button1) {
        this.button1 = button1;
    }

    
    /**
     * @return the button2
     */
    public String getButton2() {
        return button2;
    }

    
    /**
     * @param button2 the button2 to set
     */
    public void setButton2(String button2) {
        this.button2 = button2;
    }

    
    /**
     * @return the button3
     */
    public String getButton3() {
        return button3;
    }

    
    /**
     * @param button3 the button3 to set
     */
    public void setButton3(String button3) {
        this.button3 = button3;
    }

    
    /**
     * @return the button4
     */
    public String getButton4() {
        return button4;
    }

    
    /**
     * @param button4 the button4 to set
     */
    public void setButton4(String button4) {
        this.button4 = button4;
    }

    
    /**
     * @return the button5
     */
    public String getButton5() {
        return button5;
    }

    
    /**
     * @param button5 the button5 to set
     */
    public void setButton5(String button5) {
        this.button5 = button5;
    }

    
    /**
     * @return the button6
     */
    public String getButton6() {
        return button6;
    }

    
    /**
     * @param button6 the button6 to set
     */
    public void setButton6(String button6) {
        this.button6 = button6;
    }

    
    /**
     * @return the button7
     */
    public String getButton7() {
        return button7;
    }

    
    /**
     * @param button7 the button7 to set
     */
    public void setButton7(String button7) {
        this.button7 = button7;
    }

    
    /**
     * @return the button8
     */
    public String getButton8() {
        return button8;
    }

    
    /**
     * @param button8 the button8 to set
     */
    public void setButton8(String button8) {
        this.button8 = button8;
    }

    
    /**
     * @return the button9
     */
    public String getButton9() {
        return button9;
    }

    
    /**
     * @param button9 the button9 to set
     */
    public void setButton9(String button9) {
        this.button9 = button9;
    }

    
    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }
}