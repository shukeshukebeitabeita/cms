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
package com.bsb.cms.commons.page.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.bsb.cms.commons.page.PageContext;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-6-4
 * @since 1.0
 */
public class PageFilter implements Filter {

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
	    HttpServletRequest hRequest = (HttpServletRequest)request;
	    String uri = hRequest.getRequestURL().toString();
	    if (uri.toLowerCase().endsWith(".jsp")) {
	      chain.doFilter(request, response);
	      return;
	    }
	  /*  if (!(uri.toLowerCase().endsWith("list.htm"))) {//TODO
	    //if (!(uri.toLowerCase().contains("list"))) {//TODO
	      PageContext.removeContext();
	      chain.doFilter(request, response);
	      return;
	    }*/
	    if (!(uri.equals(PageContext.getLastUrl())))
	      PageContext.removeContext();

	    String pagec = hRequest.getParameter("page");//当前页，第几页
	    //String pageSize = hRequest.getParameter("pageSize");//每页多少条记录
	    String pageSize = hRequest.getParameter("rows");//每页多少条记录. easyui
	    
	    String sortField = hRequest.getParameter("sort");//sortField
	    String order = hRequest.getParameter("order");//desc/asc
	   
	    pageSize = (StringUtils.isEmpty(pageSize)) ? "10" : pageSize;
	    PageContext.setLastUrl(uri);
	    PageContext page = PageContext.getContext();//-----------

	    if (pagec == null)
	      page.setCurrentPage(1);
	    else
	      page.setCurrentPage(Integer.parseInt(pagec));

	    page.setPageSize(Integer.parseInt(pageSize));
	    page.setPagination(true);

	    
	    if("DESC".equalsIgnoreCase(order)) {
	    	page.setSortDESC(true);
	    } else if("ASC".equalsIgnoreCase(order)) {
	    	page.setSortDESC(false);
	    }
	    if ((sortField != null) && (!("".equals(sortField))))
	      PageContext.initSort(sortField);

	    request.setAttribute("page", page);//-----------------
	    chain.doFilter(request, response);
		
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	@Override
	public void destroy() {
		
	}

}
