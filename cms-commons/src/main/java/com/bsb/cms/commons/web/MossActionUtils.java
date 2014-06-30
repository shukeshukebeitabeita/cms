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
package com.bsb.cms.commons.web;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.bsb.cms.model.po.auth.SysUser;
import com.bsb.cms.model.vo.User;

/**
 * <p>
 * 运营后台专用工具类。
 * </p>
 * <ul>
 * <li>
 * 获取用户信息
 * <li>
 * <li>
 * 打印请求里的信息，测试用。
 * <li>
 * </ul>
 * 
 * @author hongjian.liu
 * @version 1.0.0 2014-5-29
 * @since 1.0
 */
public class MossActionUtils {

    public static final String USER_KEY = "USER_KEY";// 登陆用户map键
    public static final String USER_ID = "user_id";// 会员 id
    public static final String USER_NAME = "user_name";// 会员 登录名
    public static HttpSession session = null;

    /***
     * 取得登錄用戶id。
     * 
     * @return
     */
    public static Long getUserId() {
        Long memberId = null;
        Object o = getUserSession().getAttribute(USER_ID);
        if (o != null) {
            memberId = (Long) o;
        }
        return memberId;
    }

    /**
     * 从session中获取用户对象。
     * 
     * @return
     */
    public static User getUser() {
        User user = null;
        Object o = getUserSession().getAttribute(USER_KEY);
        if (o != null) {
            user = (User) o;
        }

        return user;
    }
    
    /**
     * 从session中获取用户对象。
     * @param session
     * @return
     */
    public static User getUser(HttpSession  session) {
        User user = null;
        Object o = session.getAttribute(USER_KEY);
        if (o != null) {
            user = (User) o;
        }

        return user;
    }

    /**
     * 从session中获取用户名。
     * 
     * @return
     */
    public static String getUserName() {
        String userName = null;
        Object o = getUserSession().getAttribute(USER_NAME);
        if (o != null) {
            userName = (String) o;
        }

        return userName;
    }

    /**
     * 设置用户信息到session
     * 
     * @param user 登录后的用户信息
     */
    public static void setUserInSession(User user) {
        if (user != null) {
            getUserSession().setAttribute(USER_KEY, user);
            SysUser sysUser = user.getSysUser();
            if (sysUser != null) {
                getUserSession().setAttribute(USER_ID, user.getSysUser().getSysUserId());
                getUserSession().setAttribute(USER_NAME, user.getSysUser().getLoginName());
            }
        }

    }

    /**
     * 是否为高级管理员
     * 
     * @return
     */
    public static boolean isAdmin() {
        Boolean isAdmin = false;
        String userName = getUserName();
        if ("admin".equalsIgnoreCase(userName)) {
            isAdmin = true;
        }

        return isAdmin;
    }
    
    /**
     * 是否为高级管理员
     * 
     * @return
     */
    public static boolean isAdmin(HttpSession session) {
        Boolean isAdmin = false;
        String userName = (String)session.getAttribute(USER_NAME);
        if ("admin".equalsIgnoreCase(userName)) {
            isAdmin = true;
        }

        return isAdmin;
    }

    /**
     * 销毁用户session
     */
    public static void destroySession() {
        getUserSession().removeAttribute(USER_KEY);
        getUserSession().removeAttribute(USER_ID);
        getUserSession().removeAttribute(USER_NAME);
    }

    /**
     * 
     * 获取session对象。
     * 
     * @return
     */
    private static HttpSession getUserSession() {
        final ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder
                .currentRequestAttributes();
        final HttpSession contextSession = attr == null ? session : attr.getRequest().getSession(true);

        return contextSession;
    }

    /**
     * 获取session对象。
     * 
     * @return
     */
    public static HttpSession getSession() {
        session = getUserSession();
        return session;
    }

    /**
     * 打印参数值。 前台大家可用<s:debug></s:debug> 标签调试。
     * 
     * @param req
     */
    @SuppressWarnings("all")
    @Deprecated
    public static void print(HttpServletRequest req) {
        // Application
        Map<String, Object> parameters = new WeakHashMap<String, Object>();

        // attributes in scope RequestParameter
        for (Enumeration e = req.getParameterNames(); e.hasMoreElements();) {
            String name = (String) e.nextElement();
            String[] v = req.getParameterValues(name);
            if (v.length == 1) {
                if (v[0].equals(""))
                    continue;
                parameters.put(name, v[0]);
            } else
                parameters.put(name, v);
        }

        // attributes in scope Request
        for (Enumeration e = req.getAttributeNames(); e.hasMoreElements();) {
            String name = (String) e.nextElement();
            Object v = req.getAttribute(name);
            parameters.put(name, v);
        }

        // attributes in scope Session
        HttpSession session = req.getSession();
        for (Enumeration e = session.getAttributeNames(); e.hasMoreElements();) {
            String name = (String) e.nextElement();
            Object v = session.getAttribute(name);
            parameters.put(name, v);
        }

        Set keys = parameters.keySet();
        Iterator it = keys.iterator();
        String key;
        Object value;
        while (it.hasNext()) {
            key = (String) it.next();
            value = parameters.get(key);
            System.out.println("key:" + key + ", value:" + value);
        }

    }
}
