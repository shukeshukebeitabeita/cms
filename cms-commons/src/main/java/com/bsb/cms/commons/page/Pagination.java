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

import java.io.Serializable;

/**
 * 分页Object
 * @author hongjian.liu
 * @version 1.0.0 2014-6-4
 * @since 1.0
 */
public class Pagination implements Serializable {
	private static final long serialVersionUID = 1L;
	protected int pageSize = 10;//每页多少条
	protected int currentPage = 1;//当前页
	protected int totalPages = 0;
	protected int totalRows = 0;//总记录数
//	protected int pageStartRow = 0;
//	protected int pageEndRow = 0;
	protected Boolean pagination = false;//是否需要分页
	protected Boolean hasNextPage = false;//是否有下一页
	protected Boolean hasPreviousPage = false;//是否有上一页
//	protected String pagedView;
//	private int begin;
//	private int end;
	protected String sortField = "";
	protected Boolean sortDESC = true;
	protected String orderBy = "";//= sortField + sortDESC
	//protected Object obj;

	public Pagination(int rows, int pageSize) {
		init(rows, pageSize);
	}

	public Pagination() {
	}

	public void init(int rows, int pageSize) {
		this.pageSize = pageSize;

		this.totalRows = rows;

		if (this.totalRows % pageSize == 0)
			this.totalPages = (this.totalRows / pageSize);
		else
			this.totalPages = (this.totalRows / pageSize + 1);

//		setBeginEnd();
	}

	public void init(int rows, int pageSize, int currentPage) {
		this.pageSize = pageSize;

		this.totalRows = rows;

		if (this.totalRows % pageSize == 0)
			this.totalPages = (this.totalRows / pageSize);
		else
			this.totalPages = (this.totalRows / pageSize + 1);

		if (currentPage != 0)
			gotoPage(currentPage);
		//setPagedView();
//		setBeginEnd();
	}

//	private void setBeginEnd() {
//		if (this.totalPages < 10) {
//			this.begin = 1;
//			this.end = this.totalPages;
//		} else if (this.currentPage <= 5) {
//			this.begin = 1;
//			this.end = 10;
//		} else if (this.totalPages > this.currentPage + 4) {
//			this.begin = (this.currentPage - 5);
//			this.end = (this.currentPage + 4);
//		} else {
//			this.begin = (this.totalPages - 9);
//			this.end = this.totalPages;
//		}
//	}

	private void calculatePage() {
		if (this.currentPage - 1 > 0)
			this.hasPreviousPage = true;
		else {
			this.hasPreviousPage = false;
		}

		if (this.currentPage >= this.totalPages)
			this.hasNextPage = false;
		else {
			this.hasNextPage = true;
		}
//
//		if (this.currentPage * this.pageSize < this.totalRows) {
//			this.pageEndRow = (this.currentPage * this.pageSize);
//			this.pageStartRow = (this.pageEndRow - this.pageSize);
//		} else {
//			this.pageEndRow = this.totalRows;
//			this.pageStartRow = (this.pageSize * (this.totalPages - 1));
//		}
	}

	public void gotoPage(int page) {
		if (page > this.totalPages)
			this.currentPage = 1;
		else {
			this.currentPage = page;
		}

		calculatePage();
	}

	public void debug1() {
		System.out.println("要显示的页面数据已经封装,具体信息如下：");
		String debug = "共有数据数:" + this.totalRows + "共有页数:" + this.totalPages
				+ "当前页数为:" + this.currentPage + "是否有前一页:"
				+ this.hasPreviousPage + "是否有下一页:" + this.hasNextPage 
//				+ "开始行数:"
//				+ this.pageStartRow + "终止行数:" + this.pageEndRow
				;
		System.out.println(debug);
	}

//	public void setPagedView(String path) {
//		StringBuffer sb = new StringBuffer();
//		sb.append("<TABLE width='100%'  class='content9'>");
//		sb.append("<TBODY>");
//		sb.append("<TR>");
//		sb.append("<TD align=left width='50%'>");
//		sb.append("&nbsp;&nbsp;&nbsp;&nbsp;");
//
//		if (this.hasPreviousPage) {
//			sb.append("<a href='"
//					+ path
//					+ "page=1'><IMG title='第一页' src='../../images/0.gif' border=0></a>");
//			sb.append("&nbsp;&nbsp;");
//			sb.append("<a href='"
//					+ path
//					+ "page="
//					+ (this.currentPage - 1)
//					+ "'><IMG title='上一页' src='../../images/1.gif' border=0></a>");
//		} else {
//			sb.append("<IMG title='第一页' src='../../images/0.gif' border=0>");
//			sb.append("&nbsp;&nbsp;");
//			sb.append("<IMG title='上一页' src='../../images/1.gif' border=0>");
//		}
//		sb.append("&nbsp;&nbsp;");
//
//		if (this.hasNextPage) {
//			sb.append("<a href='"
//					+ path
//					+ "page="
//					+ (this.currentPage + 1)
//					+ "'><IMG title='下一页' src='../../images/2.gif' border=0></a>");
//			sb.append("&nbsp;&nbsp;");
//			sb.append("<a href='"
//					+ path
//					+ "page="
//					+ this.totalPages
//					+ "'><IMG title='最末页' src='../../images/3.gif' border=0></a>");
//		} else {
//			sb.append("<IMG title='下一页' src='../../images/2.gif' border=0>");
//			sb.append("&nbsp;&nbsp;");
//			sb.append("<IMG title='最末页' src='../../images/3.gif' border=0>");
//		}
//		sb.append("</TD>");
//		sb.append("<TD align=right width='50%'>");
//		sb.append("&nbsp;每页<INPUT type=text size=5 name=pageSize value="
//				+ this.pageSize + " class='form' style='width:30px;'>");
//		sb.append("文档总数: " + this.totalRows + ", 共" + this.totalPages + "页, 第"
//				+ this.currentPage + "页, 转到 ");
//		sb.append("<INPUT type=text size=5 name=page value=" + this.currentPage
//				+ ">");
//		sb.append("&nbsp;");
//		sb.append("<INPUT onclick='submit_pagedForm()' type=button class='button2' value=' GO '>");
//		sb.append("&nbsp;&nbsp;&nbsp;&nbsp;");
//		sb.append("<INPUT name=totalPages type=hidden value='"
//				+ this.totalPages + "'>");
//		sb.append("&nbsp;&nbsp;");
//		sb.append("<INPUT name=totalRows type=hidden value='" + this.totalRows
//				+ "'>");
//		sb.append("&nbsp;&nbsp;");
//
//		sb.append("</TD>");
//		sb.append("</TR>");
//		sb.append("</TBODY>");
//		sb.append("</TABLE>");
//
//		sb.append("<script type=\"text/javascript\">\n");
//		sb.append("function submit_pagedForm(){\n");
//		sb.append(" var page = document.forms[0].page.value;\n");
//		sb.append("var reg=eval('/^[0-9]+$/');\n");
//		sb.append("var flag = reg.test(page);\n");
//		sb.append("if(!flag){\nalert('跳转页必须是数字');\nreturn false;}\n");
//		sb.append("var pageSize = document.forms[0].pageSize.value;\n");
//		sb.append("var reg=eval('/^[0-9]+$/');\n");
//		sb.append("var flag = reg.test(pageSize);\n");
//		sb.append("if(!flag){alert('每页显示数必须是数字');\nreturn false;}\n");
//		sb.append("var totalPages = 0;\n");
//		sb.append("totalPages = document.forms[0].totalPages.value;\n");
//		sb.append("if (parseInt(page) > parseInt(totalPages) || parseInt(page) <1) {page =1;}\n");
//		sb.append("document.forms[0].submit();\n");
//		sb.append("}\n");
//		sb.append("function search_pagedForm(page) {\n");
//		sb.append("document.pagedForm.page.value = page;\n");
//		sb.append("document.pagedForm.target='_self';\n");
//		sb.append("document.pagedForm.submit();\n");
//		sb.append("}\n");
//		sb.append("</script>\n");
//		this.pagedView = sb.toString();
//	}

//	public void setPagedView() {
//		StringBuffer sb = new StringBuffer();
//		sb.append("<TABLE width='100%' class='content9' cellpadding='0' cellspacing='0'>");
//		sb.append("<TBODY>");
//		sb.append("<TR>");
//		sb.append("<TD align=left width='40%'>");
//		sb.append("&nbsp;&nbsp;");
//		if (this.hasPreviousPage) {
//			sb.append("<input type='button' value='首页' class='button' onclick='search_pagedForm(1);return false;'>");
//			sb.append("&nbsp;&nbsp;");
//			sb.append("<input type='button' value='上一页' class='button' onclick='search_pagedForm("
//					+ (this.currentPage - 1) + ");return false;'>");
//		} else {
//			sb.append("<input type='button' value='首页' class='button' onclick='search_pagedForm(1);return false;' disabled='disabled'>");
//			sb.append("&nbsp;&nbsp;");
//			sb.append("<input type='button' value='上一页' class='button' onclick='search_pagedForm("
//					+ (this.currentPage - 1)
//					+ ");return false;' disabled='disabled'>");
//		}
//
//		sb.append("&nbsp;&nbsp;");
//		if (this.hasNextPage) {
//			sb.append("<input type='button' value='下一页' class='button' onclick='search_pagedForm("
//					+ (this.currentPage + 1) + ");return false;'>");
//
//			sb.append("&nbsp;&nbsp;");
//			sb.append("<input type='button' value='末页' class='button' onclick='search_pagedForm("
//					+ this.totalPages + ");return false;'>");
//		} else {
//			sb.append("<input type='button' value='下一页' class='button' onclick='search_pagedForm("
//					+ (this.currentPage + 1)
//					+ ");return false;' disabled='disabled'>");
//			sb.append("&nbsp;&nbsp;");
//			sb.append("<input type='button' value='末页' class='button' onclick='search_pagedForm("
//					+ this.totalPages + ");return false;' disabled='disabled'>");
//		}
//
//		sb.append("</TD>");
//		sb.append("<TD align=right width='60%'>");
//
//		sb.append("文档总数: " + this.totalRows + ", 共" + this.totalPages + "页, 第"
//				+ this.currentPage + "页, 转到 ");
//		sb.append("<INPUT type=text size=5 name=page value=" + this.currentPage
//				+ " class='form'  style='width:30px;'>");
//		sb.append("&nbsp;");
//		sb.append("&nbsp;每页<INPUT type=text size=5 name=pageSize value="
//				+ this.pageSize + " class='form' style='width:30px;'>");
//		sb.append("<INPUT name=totalPages type=hidden value='"
//				+ this.totalPages + "'>");
//		sb.append("&nbsp;&nbsp;");
//		sb.append("<INPUT name=totalRows type=hidden value='" + this.totalRows
//				+ "'>");
//		sb.append("&nbsp;&nbsp;");
//		sb.append("<INPUT onclick='submit_pagedForm()' type=button value='GO' class='button2'>");
//		sb.append("&nbsp;&nbsp;");
//		sb.append("</TD>");
//		sb.append("</TR>");
//		sb.append("</TBODY>");
//		sb.append("</TABLE>");
//
//		sb.append("<script type=\"text/javascript\">\n");
//		sb.append("function submit_pagedForm(){\n");
//		sb.append(" var page = document.forms[0].page.value;\n");
//		sb.append("var reg=eval('/^[0-9]+$/');\n");
//		sb.append("var flag = reg.test(page);\n");
//		sb.append("if(!flag){\nalert('跳转页必须是数字');\nreturn false;}\n");
//		sb.append("var pageSize = document.forms[0].pageSize.value;\n");
//		sb.append("var reg=eval('/^[0-9]+$/');\n");
//		sb.append("var flag = reg.test(pageSize);\n");
//		sb.append("if(!flag){alert('每页显示数必须是数字');\nreturn false;}\n");
//		sb.append("var totalPages = 0;\n");
//		sb.append("totalPages = document.forms[0].totalPages.value;\n");
//		sb.append("if (parseInt(page) > parseInt(totalPages) ) {document.pagedForm.page.value =totalPages;}\n");
//		sb.append("if(parseInt(page) <1) {document.pagedForm.page.value =1;}\n");
//		sb.append("document.forms[0].submit();\n");
//		sb.append("}\n");
//		sb.append("function search_pagedForm(page) {\n");
//		sb.append("document.pagedForm.page.value = page;\n");
//		sb.append("document.pagedForm.target='_self';\n");
//		sb.append("document.pagedForm.submit();\n");
//		sb.append("}\n");
//		sb.append("</script>\n");
//		this.pagedView = sb.toString();
//	}
//
//	public void setPagedView1() {
//		StringBuffer sb = new StringBuffer();
//
//		sb.append("<TABLE width='100%' class='content9'>");
//		sb.append("<TBODY>");
//		sb.append("<TR>");
//		sb.append("<TD align=left width='20%'>");
//		sb.append("&nbsp;&nbsp;");
//		if (this.hasPreviousPage) {
//			sb.append("<a href='#' onclick='search_pagedForm(1);return false;'><IMG title='第一页' src='../images/0.gif' border=0></a>");
//			sb.append("&nbsp;&nbsp;");
//			sb.append("<a href='#' onclick='search_pagedForm("
//					+ (this.currentPage - 1)
//					+ ");return false;'><IMG title='上一页' src='../images/1.gif' border=0></a>");
//		} else {
//			sb.append("<IMG title='第一页' src='../images/0.gif' border=0>");
//			sb.append("&nbsp;&nbsp;");
//			sb.append("<IMG title='上一页' src='../images/1.gif' border=0>");
//		}
//		sb.append("&nbsp;&nbsp;");
//		if (this.hasNextPage) {
//			sb.append("<a href='#' onclick='search_pagedForm("
//					+ (this.currentPage + 1)
//					+ ");return false;'><IMG title='下一页' src='../images/2.gif' border=0></a>");
//			sb.append("&nbsp;&nbsp;");
//			sb.append("<a href='#' onclick='search_pagedForm("
//					+ this.totalPages
//					+ ");return false;'><IMG title='最末页' src='../images/3.gif' border=0></a>");
//		} else {
//			sb.append("<IMG title='下一页' src='../images/2.gif' border=0>");
//			sb.append("&nbsp;&nbsp;");
//			sb.append("<IMG title='最末页' src='../images/3.gif' border=0>");
//		}
//		sb.append("</TD>");
//		sb.append("<TD align=right width='80%'>");
//		sb.append("文档总数: " + this.totalRows + ", 共" + this.totalPages + "页, 第"
//				+ this.currentPage + "页, 转到 ");
//		sb.append("<INPUT type=text size=5 name=page value=" + this.currentPage
//				+ " class='form'  style='width:30px;'>");
//		sb.append("&nbsp;");
//		sb.append("&nbsp;每页<INPUT type=text size=5 name=pageSize value="
//				+ this.pageSize + " class='form' style='width:30px;'>");
//		sb.append("<INPUT name=totalPages type=hidden value='"
//				+ this.totalPages + "'>");
//		sb.append("&nbsp;&nbsp;");
//		sb.append("<INPUT name=totalRows type=hidden value='" + this.totalRows
//				+ "'>");
//		sb.append("&nbsp;&nbsp;");
//		sb.append("<INPUT onclick='submit_pagedForm()' type=button value=' GO ' class='button2'>");
//		sb.append("&nbsp;&nbsp;");
//		sb.append("</TD>");
//		sb.append("</TR>");
//		sb.append("</TBODY>");
//		sb.append("</TABLE>");
//
//		sb.append("<script type=\"text/javascript\">\n");
//		sb.append("function submit_pagedForm(){\n");
//		sb.append(" var page = document.forms[0].page.value;\n");
//		sb.append("var reg=eval('/^[0-9]+$/');\n");
//		sb.append("var flag = reg.test(page);\n");
//		sb.append("if(!flag){\nalert('跳转页必须是数字');\nreturn false;}\n");
//		sb.append("var pageSize = document.forms[0].pageSize.value;\n");
//		sb.append("var reg=eval('/^[0-9]+$/');\n");
//		sb.append("var flag = reg.test(pageSize);\n");
//		sb.append("if(!flag){alert('每页显示数必须是数字');\nreturn false;}\n");
//		sb.append("var totalPages = 0;\n");
//		sb.append("totalPages = document.forms[0].totalPages.value;\n");
//		sb.append("if (parseInt(page) > parseInt(totalPages) || parseInt(page) <1) {page =1;}\n");
//		sb.append("document.forms[0].submit();\n");
//		sb.append("}\n");
//		sb.append("function search_pagedForm(page) {\n");
//		sb.append("document.pagedForm.page.value = page;\n");
//		sb.append("document.pagedForm.target='_self';\n");
//		sb.append("document.pagedForm.submit();\n");
//		sb.append("}\n");
//		sb.append("</script>\n");
//		this.pagedView = sb.toString();
//	}
//
//	public void setPagedView1(String path) {
//		StringBuffer sb = new StringBuffer();
//		sb.append("&nbsp;");
//		if (this.hasPreviousPage)
//			sb.append("<a href=\""
//					+ path
//					+ "page=1\"><img src=\"../images/houtui.gif\" border=0></a>&nbsp;&nbsp;<a href=\""
//					+ path + "page=" + (this.currentPage - 1)
//					+ "\"><img src=\"../images/houtui2.gif\" border=0></a>");
//		else
//			sb.append("<img src=\"../images/houtui.gif\" border=0>&nbsp;&nbsp;<img src=\"../images/houtui2.gif\" border=0>");
//		sb.append("&nbsp;&nbsp;");
//		if (this.hasNextPage)
//			sb.append("<a href=\""
//					+ path
//					+ "page="
//					+ (this.currentPage + 1)
//					+ "\"><img src=\"../images/qianjin.gif\" border=0></a>&nbsp;&nbsp;<a href=\""
//					+ path + "page=" + this.totalPages
//					+ "\"><img src=\"../images/qianjin2.gif\" border=0></a>");
//		else
//			sb.append("<img src=\"../images/qianjin.gif\" border=0>&nbsp;&nbsp;<img src=\"../images/qianjin2.gif\" border=0>");
//		sb.append("&nbsp;&nbsp;&nbsp;&nbsp;");
//		sb.append("当前页/总页数:");
//		sb.append(this.currentPage);
//		sb.append("/");
//		sb.append(this.totalPages);
//		sb.append("&nbsp;");
//
//		sb.append("<script type=\"text/javascript\">\n");
//		sb.append("function submit_pagedForm(){\n");
//		sb.append(" var page = document.forms[0].page.value;\n");
//		sb.append("var reg=eval('/^[0-9]+$/');\n");
//		sb.append("var flag = reg.test(page);\n");
//		sb.append("if(!flag){\nalert('跳转页必须是数字');\nreturn false;}\n");
//		sb.append("var pageSize = document.forms[0].pageSize.value;\n");
//		sb.append("var reg=eval('/^[0-9]+$/');\n");
//		sb.append("var flag = reg.test(pageSize);\n");
//		sb.append("if(!flag){alert('每页显示数必须是数字');\nreturn false;}\n");
//		sb.append("var totalPages = 0;\n");
//		sb.append("totalPages = document.forms[0].totalPages.value;\n");
//		sb.append("if (parseInt(page) > parseInt(totalPages) || parseInt(page) <1) {page =1;}\n");
//		sb.append("document.forms[0].submit();\n");
//		sb.append("}\n");
//		sb.append("function search_pagedForm(page) {\n");
//		sb.append("document.pagedForm.page.value = page;\n");
//		sb.append("document.pagedForm.target='_self';\n");
//		sb.append("document.pagedForm.submit();\n");
//		sb.append("}\n");
//		sb.append("</script>\n");
//		this.pagedView = sb.toString();
//	}

//	public String getPagedView() {
//		return this.pagedView;
//	}

	public int getCurrentPage() {
		return this.currentPage;
	}

	public Boolean isHasNextPage() {
		return this.hasNextPage;
	}

	public Boolean isHasPreviousPage() {
		return this.hasPreviousPage;
	}

//	public int getPageEndRow() {
//		return this.pageEndRow;
//	}

	public int getPageSize() {
		return this.pageSize;
	}

//	public int getPageStartRow() {
//		return this.pageStartRow;
//	}

	public int getTotalPages() {
		return this.totalPages;
	}

	public int getTotalRows() {
		return this.totalRows;
	}

	public void setTotalPages(int i) {
		this.totalPages = i;
	}

	public void setCurrentPage(int i) {
		this.currentPage = i;
	}

	public void setHasNextPage(Boolean b) {
		this.hasNextPage = b;
	}

	public void setHasPreviousPage(Boolean b) {
		this.hasPreviousPage = b;
	}
//
//	public void setPageEndRow(int i) {
//		this.pageEndRow = i;
//	}

	public void setPageSize(int i) {
		this.pageSize = i;
	}

//	public void setPageStartRow(int i) {
//		this.pageStartRow = i;
//	}

	public void setTotalRows(int i) {
		this.totalRows = i;
	}

	public Boolean isPagination() {
		return this.pagination;
	}

	public void setPagination(Boolean pagination) {
		this.pagination = pagination;
	}

//	public int getBegin() {
//		return this.begin;
//	}
//
//	public void setBegin(int begin) {
//		this.begin = begin;
//	}
//
//	public int getEnd() {
//		return this.end;
//	}

//	public void setEnd(int end) {
//		this.end = end;
//	}

	public String getOrderBy() {
		return this.orderBy;
	}

	/**
	 * @return the sortField
	 */
	public String getSortField() {
		return sortField;
	}

	/**
	 * @param sortField the sortField to set
	 */
	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

	/**
	 * @return the sortDESC
	 */
	public Boolean getSortDESC() {
		return sortDESC;
	}

	/**
	 * @param sortDESC the sortDESC to set
	 */
	public void setSortDESC(Boolean sortDESC) {
		this.sortDESC = sortDESC;
	}
	
	
}