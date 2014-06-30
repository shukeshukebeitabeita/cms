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
package com.bsb.cms.commons.page;

import java.util.Map;

import org.apache.commons.lang.StringUtils;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-6-4
 * @since 1.0
 */
public class PageContext extends Pagination {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6223073784177560932L;
	//private static final Logger logger = Logger.getLogger(PageContext.class);
	private static ThreadLocal<PageContext> context = new ThreadLocal<PageContext>();
	private static String lastUrl;

	public static PageContext getContext() {
		PageContext ci = (PageContext) context.get();
		if (ci == null) {
			ci = new PageContext();
			context.set(ci);
		}
		return ci;
	}

	public static void initPageSize(int pageSize) {
		getContext().setPageSize(pageSize);
	}

	public static void removeContext() {
		context.remove();
	}

	protected void initialize() {
	}

	public static String getLastUrl() {
		return lastUrl;
	}

	public static void setLastUrl(String _lastUrl) {
		lastUrl = _lastUrl;
	}

	public static void initSort(String field) {
		PageContext context = getContext();

		if ((field == null) || ("".equals(field)))
			return;

		if (field.equals(context.sortField))
			context.sortDESC = (!(context.sortDESC));
		context.sortField = field;
		
		if(StringUtils.isNotBlank(context.sortField))
		context.orderBy = field + " "
				+ ((context.sortDESC) ? "DESC" : "ASC");
	}

//	public static void processSort(Map<String, String> mapper) {
//		PageContext context = getContext();
//
//		if ((context.sortField == null) || ("".equals(context.sortField))
//				|| (mapper == null)) {
//			context.orderBy = null;
//			return;
//		}
//
//		String columnName = (String) mapper.get(context.sortField);
//		if ((columnName != null) && (!("".equals(columnName))))
//			context.orderBy = columnName + " "
//					+ ((context.sortDESC) ? "DESC" : "ASC");
//	}
}