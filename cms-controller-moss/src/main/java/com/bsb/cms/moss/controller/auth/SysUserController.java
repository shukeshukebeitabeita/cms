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
package com.bsb.cms.moss.controller.auth;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bsb.cms.commons.exceptions.BaseException;
import com.bsb.cms.commons.exceptions.RenameRuntimeException;
import com.bsb.cms.commons.page.PageContext;
import com.bsb.cms.commons.security.SecurityService;
import com.bsb.cms.commons.web.JSONResultDTO;
import com.bsb.cms.commons.web.MossActionUtils;
import com.bsb.cms.model.enums.DefaultStatus;
import com.bsb.cms.model.enums.OperateTypeEnum;
import com.bsb.cms.model.po.auth.SysUser;
import com.bsb.cms.model.vo.ComboboxJsonVO;
import com.bsb.cms.moss.controller.log.LogController;
import com.bsb.cms.moss.controller.utils.DataGridJsonData;
import com.bsb.cms.moss.controller.utils.EasyUiUtils;
import com.bsb.cms.moss.service.auth.SysRoleService;
import com.bsb.cms.moss.service.auth.SysUserService;

/**
 * 系统用户管理。
 * 
 * @author hongjian.liu
 * @version 1.0.0 2013-6-6
 * @since 1.0
 */
@Controller
@RequestMapping("/moss/user/")
public class SysUserController extends LogController {

	// log
	private static final Log log = LogFactory.getLog(SysUserController.class);
	private static final Long ADMIN_ID = 1L;

	@Resource(name = "sysUserService")
	private SysUserService sysUserService;

	@Resource(name = "securityService")
	private SecurityService securityService;

	@Resource(name = "sysRoleService")
	private SysRoleService sysRoleService;

	/**
	 * 跳转到首页
	 * 
	 * @return
	 */
	@RequestMapping("index.htm")
	public String index() {
		return "/page/auth/user_list";
	}

	/**
	 * 列表页面。
	 * 
	 * @param conditions
	 * @param req
	 * @return
	 */
	@RequestMapping("list.htm")
	@ResponseBody
	public DataGridJsonData<SysUser> list(SysUser conditions,
			HttpServletRequest req) {
		conditions.setStatus(DefaultStatus.VALID.getCode());
		PageContext page = PageContext.getContext();
		if ("ROLENAME".equalsIgnoreCase(page.getSortField())) {
			PageContext.initSort("r.ROLE_NAME");
		} else {
			PageContext.initSort("t.UPDATE_DATE");
		}
		List<SysUser> list = sysUserService.findByPage(conditions);

		return EasyUiUtils.getPageResult(list);
	}

	/**
	 * 逻辑删除功能。
	 * 
	 * @param sysUserId
	 * @return
	 */
	@RequestMapping("delete.htm")
	@ResponseBody
	public JSONResultDTO delete(Long sysUserId) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			if (sysUserId.equals(ADMIN_ID)) {
				result.setMessage("不能删除高级管理员");
				result.setResult(JSONResultDTO.ERROR);
			} else {
				sysUserService.deleteById(sysUserId);
				log(OperateTypeEnum.DELETE_OPERATOR, "操作员id:" + sysUserId,
						"操作员");
				result.setMessage("删除成功");
				result.setResult(JSONResultDTO.SUCCESS);
			}
		} catch (Exception e) {
			result.setMessage("删除失败");
			result.setResult(JSONResultDTO.ERROR);
			log.error(e.getMessage());
		}
		return result;
	}

	/**
	 * 跳转到添加页面。
	 * 
	 * @param id
	 *            模板id
	 * @return
	 */
	@RequestMapping(value = "create.htm", params = "m=toCreate")
	public String toCreate(String id, ModelMap model) {
		return "/page/auth/user_edit";
	}

	/**
	 * 取得角色
	 * 
	 * @return
	 */
	@RequestMapping(value = "create.htm", params = "m=getRole")
	@ResponseBody
	public List<ComboboxJsonVO> getRole() {
		List<ComboboxJsonVO> list = new ArrayList<ComboboxJsonVO>();
		try {
			list = sysRoleService.getRoles();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return list;
	}

	/**
	 * 添加操作员。
	 * 
	 * @param sysUser
	 * @return
	 */
	@RequestMapping("create.htm")
	@ResponseBody
	public JSONResultDTO create(SysUser sysUser) {
		boolean isValidSucc = true;
		JSONResultDTO result = new JSONResultDTO();
		try {
			if (StringUtils.isBlank(sysUser.getName())
					|| sysUser.getName().length() > 16) {
				isValidSucc = false;
			} else if (StringUtils.isBlank(sysUser.getPassword())
					|| sysUser.getPassword().length() > 18) {
				isValidSucc = false;
			}

			if (isValidSucc) {
				sysUser.setPassword(securityService.encPassword(sysUser
						.getPassword()));
				sysUser.setLoginName(sysUser.getName());
				sysUser.setStatus(DefaultStatus.VALID.getCode());
				sysUser.setCreator(MossActionUtils.getUserName());
				try {
					Long userId = sysUserService.create(sysUser);
					log(OperateTypeEnum.CREATE_OPERATOR, "操作员id:" + userId,
							"操作员");
					result.setMessage("创建成功");
					result.setResult(JSONResultDTO.SUCCESS);
				} catch (RenameRuntimeException e) {
					result.setMessage("操作员姓名已经存在");
					result.setResult(JSONResultDTO.ERROR);
				}
			} else {
				result.setMessage("输入信息不合法。");
				result.setResult(JSONResultDTO.ERROR);
			}

		} catch (Exception e) {
			result.setMessage("创建失败.请重试或联系管理员。");
			result.setResult(JSONResultDTO.ERROR);
			log.error(e.getMessage());
		}
		return result;
	}

	/**
	 * 修改一个用户的修改密码
	 * 
	 * @param password
	 *            要修改的密码
	 * @param sysUserId
	 *            根据用户id为条件修改
	 * @return
	 */
	@RequestMapping("updatePwd.htm")
	@ResponseBody
	public JSONResultDTO updatePwd(String password, Long sysUserId) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			if (sysUserId == null || StringUtils.isBlank(password)) {
				result.setMessage("操作员id和密码不能为空!");
				result.setResult(JSONResultDTO.ERROR);
			} else {
				sysUserService.updatePwd(sysUserId,
						securityService.encPassword(password));
				log(OperateTypeEnum.RESET_PWD, "操作员id:" + sysUserId, "操作员");
				result.setMessage("密码修改成功");
				result.setResult(JSONResultDTO.SUCCESS);
			}
		} catch (Exception e) {
			result.setMessage("密码修改失败.");
			result.setResult(JSONResultDTO.ERROR);
			log.error(e.getMessage());
		}
		return result;
	}

	@RequestMapping("/updatePasswordForUser")
	@ResponseBody
	public JSONResultDTO updatePasswordForUser(String oldPwd, String newPwd)
			throws BaseException {
		long userId = MossActionUtils.getUserId();
		String comparePwd = MossActionUtils.getUser().getSysUser()
				.getPassword();
		String oldPassword = this.securityService.encPassword(oldPwd);
		if (oldPassword.equals(comparePwd)) {
			return this.updatePwd(newPwd, userId);
		} else {
			JSONResultDTO json = new JSONResultDTO();
			json.setMessage("旧密码输入错误");
			if (StringUtils.isEmpty(oldPwd)) {
				json.setMessage("旧密码不能为空");
			}
			json.setResult(JSONResultDTO.ERROR);
			return json;

		}
	}
}
