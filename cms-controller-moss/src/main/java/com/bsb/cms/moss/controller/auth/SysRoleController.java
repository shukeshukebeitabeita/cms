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

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bsb.cms.commons.exceptions.RenameRuntimeException;
import com.bsb.cms.commons.page.PageContext;
import com.bsb.cms.commons.web.JSONResultDTO;
import com.bsb.cms.commons.web.MossActionUtils;
import com.bsb.cms.model.dto.auth.SysModelDTO;
import com.bsb.cms.model.dto.auth.SysRoleDTO;
import com.bsb.cms.model.enums.OperateTypeEnum;
import com.bsb.cms.model.po.auth.SysRole;
import com.bsb.cms.moss.controller.log.LogController;
import com.bsb.cms.moss.controller.utils.DataGridJsonData;
import com.bsb.cms.moss.controller.utils.EasyUiUtils;
import com.bsb.cms.moss.controller.vo.TreegridVO;
import com.bsb.cms.moss.service.auth.SysModelService;
import com.bsb.cms.moss.service.auth.SysRoleService;

/**
 * 系统角色管理。
 * 
 * @author hongjian.liu
 * @version 1.0.0 2013-6-8
 * @since 1.0
 */
@Controller
@RequestMapping("/moss/role/")
public class SysRoleController extends LogController {

	// log
	private static final Log log = LogFactory.getLog(SysRoleController.class);

	@Resource(name = "sysRoleService")
	private SysRoleService sysRoleService;
	@Resource(name = "sysModelService")
	private SysModelService sysModelService;

	/**
	 * 跳转到首页
	 * 
	 * @return
	 */
	@RequestMapping("index.htm")
	public String index() {
		return "/page/auth/role_list";
	}

	/**
	 * 列表页面。
	 * 
	 * @param conditions
	 * @return
	 */
	@RequestMapping("list.htm")
	@ResponseBody
	public DataGridJsonData<SysRoleDTO> list(SysRoleDTO conditions) {
		PageContext.initSort("r.UPDATE_DATE");

		return EasyUiUtils.getPageResult(sysRoleService.findByPage(conditions));
	}

	/**
	 * 删除功能。
	 * 
	 * @param sysRoleId
	 * @return
	 */
	@RequestMapping("delete.htm")
	@ResponseBody
	public JSONResultDTO delete(Long sysRoleId) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			sysRoleService.deleteById(sysRoleId);
			log(OperateTypeEnum.DELETE_ROLE, "角色id:" + sysRoleId, "角色");
			result.setMessage("删除成功");
			result.setResult(JSONResultDTO.SUCCESS);
		} catch (Exception e) {
			result.setMessage("删除失败.");
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
	public String toCreate(Long sysRoleId, ModelMap model) {
		return "/page/auth/role_edit";
	}

	/**
	 * 添加角色。
	 * 
	 * @param sysRole
	 *            角色
	 * @param sysModelIds
	 *            选择的权限的id
	 * @return
	 */
	@RequestMapping("create.htm")
	@ResponseBody
	public JSONResultDTO create(SysRole sysRole, String[] sysModelIds) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			if (sysModelIds == null || sysRole == null
					|| StringUtils.isBlank(sysRole.getRoleName())
					|| sysRole.getRoleName().length() > 16) {
				result.setMessage("输入信息不合法。");
				result.setResult(JSONResultDTO.ERROR);
				return result;
			}

			try {
				sysRole.setCreator(MossActionUtils.getUserName());
				Long sysRoleId = sysRoleService.create(sysRole, sysModelIds);
				log(OperateTypeEnum.CREATE_ROLE, "角色id:" + sysRoleId, "角色新增");
				result.setMessage("创建成功");
				result.setResult(JSONResultDTO.SUCCESS);
			} catch (RenameRuntimeException e) {
				result.setMessage("角色名已经存在");
				result.setResult(JSONResultDTO.ERROR);
			}

		} catch (Exception e) {
			result.setMessage("创建失败.请重试或联系管理员。");
			result.setResult(JSONResultDTO.ERROR);
			log.error(e.getMessage(), e.getCause());
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * 跳转到编辑页面
	 * 
	 * @param sysRoleId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "update.htm", params = "m=toUpdate")
	public String toUpdate(Long sysRoleId, ModelMap model) {
		model.addAttribute("sysRole", sysRoleService.getById(sysRoleId));
		return "/page/auth/role_edit";
	}

	/**
	 * 修改一个角色信息.
	 * 
	 * @param sysRole
	 * @param sysModelIds
	 * @return
	 */
	@RequestMapping("update.htm")
	@ResponseBody
	public JSONResultDTO update(SysRole sysRole, String[] sysModelIds) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			if (sysModelIds == null || sysRole == null
					|| StringUtils.isBlank(sysRole.getRoleName())
					|| sysRole.getRoleName().length() > 16) {
				result.setMessage("输入信息不合法。");
				result.setResult(JSONResultDTO.ERROR);
				return result;
			}

			try {
				sysRole.setCreator(MossActionUtils.getUserName());
				sysRoleService.update(sysRole, sysModelIds);
				log(OperateTypeEnum.UPDATE_ROLE,
						"角色id:" + sysRole.getSysRoleId(), "角色修改");
				result.setMessage("修改成功");
				result.setResult(JSONResultDTO.SUCCESS);
			} catch (RenameRuntimeException e) {
				result.setMessage("角色名已经存在");
				result.setResult(JSONResultDTO.ERROR);
			}

		} catch (Exception e) {
			result.setMessage("修改失败.请重试或联系管理员。");
			result.setResult(JSONResultDTO.ERROR);
			log.error(e.getMessage(), e.getCause());
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * 取得所有模块，组装成easyui的treegrid对象。
	 * 
	 * @param sysRoleId
	 * @return
	 */
	@RequestMapping("getMemu.htm")
	@ResponseBody
	public List<TreegridVO> getMenu(Long sysRoleId) {
		List<SysModelDTO> menus = sysModelService.findByRoleId(sysRoleId);
		return EasyUiUtils.toMenuButonTree(menus);
	}
}
