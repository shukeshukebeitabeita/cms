/**
 * 
 */
package com.bsb.cms.model.po;

import java.util.Date;

import org.apache.commons.lang.time.DateFormatUtils;

/**
 * 公共实体类。持久对象继承此类。
 * 
 * @author lhj
 * @version 1.0.0 2013-4-10
 * @since 1.0
 */
public class Entity implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4024799824550539608L;

	private Date createDate;

	private Date updateDate;
	
    private String createUser;
    
    private String updateUser;

	// private Date createTime;
	//
	// private Date updateTime;

	/**
	 * @author chen.nie
	 * @return
	 */
	public String getCreateDateStr() {
		if (null != this.getCreateDate()) {
			return DateFormatUtils.format(this.getCreateDate(),
					"yyyy-MM-dd HH:mm:ss");
		}
		return "";
	}

	/**
	 * @author chen.nie
	 * @return
	 */
	public String getUpdateDateStr() {
		if (null != this.getUpdateDate()) {
			return DateFormatUtils.format(this.getUpdateDate(),
					"yyyy-MM-dd HH:mm:ss");
		}
		return "";
	}

	/**
	 * @return the createDate
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate
	 *            the createDate to set
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return the updateDate
	 */
	public Date getUpdateDate() {
		return updateDate;
	}

	/**
	 * @param updateDate
	 *            the updateDate to set
	 */
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	/**
	 * @return the createUser
	 */
	public String getCreateUser() {
		return createUser;
	}

	/**
	 * @param createUser the createUser to set
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	/**
	 * @return the updateUser
	 */
	public String getUpdateUser() {
		return updateUser;
	}

	/**
	 * @param updateUser the updateUser to set
	 */
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

}
