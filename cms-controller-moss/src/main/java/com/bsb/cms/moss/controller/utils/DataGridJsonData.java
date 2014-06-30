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
package com.bsb.cms.moss.controller.utils;

import java.io.Serializable;
import java.util.Collection;

/**
 * easy ui 还回前台json数据对象
 * 
 * @author lhj
 * @version 1.0.0 2014-5-29
 * @since 1.0
 */
public class DataGridJsonData<T> implements Serializable {

	/**
     * 
     */
	private static final long serialVersionUID = 5197426831984115328L;
	private Integer total;
	private Collection<T> rows;
//	private Integer pageNumber;
//	private Integer pageSize;

	public DataGridJsonData() {
		super();
	}

	/**
	 * constructor
	 * 
	 * @param rows
	 * @param total
	 */
	public DataGridJsonData(Collection<T> rows, Integer total) {
		super();
		if (total == null)
			this.total = rows.size();
		else
			this.rows = rows;
		this.total = total;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Collection<T> getRows() {
		return rows;
	}

	public void setRows(Collection<T> rows) {
		this.rows = rows;
	}

}
