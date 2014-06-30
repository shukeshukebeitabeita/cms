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
package com.bsb.cms.mapper;

import java.util.List;

import com.bsb.cms.model.po.Blog;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-5-21
 * @since 1.0
 */
public interface BlogMapper {

	public Blog selectBlog(int id);

	public List<Blog> blogListPage(int id);
}
