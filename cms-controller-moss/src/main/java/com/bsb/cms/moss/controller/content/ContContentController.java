/**
 * @(#)ContContentController.java 2014-6-26
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
package com.bsb.cms.moss.controller.content;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.annotations.Result;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bsb.cms.commons.exceptions.RenameRuntimeException;
import com.bsb.cms.commons.web.JSONResultDTO;
import com.bsb.cms.commons.web.MossActionUtils;
import com.bsb.cms.content.service.content.ContContentService;
import com.bsb.cms.model.dto.content.ContContentDTO;
import com.bsb.cms.model.enums.OperateTypeEnum;
import com.bsb.cms.model.po.auth.SysRole;
import com.bsb.cms.model.vo.content.ContentSearchVO;
import com.bsb.cms.moss.controller.log.LogController;
import com.bsb.cms.moss.controller.utils.DataGridJsonData;
import com.bsb.cms.moss.controller.utils.EasyUiUtils;

/**
 * content management controller.
 * 
 * @author hongjian.liu
 * @version 1.0.0 2014-6-26
 * @since 1.0
 */
@Controller
@RequestMapping("/moss/cont/")
public class ContContentController extends LogController {
	// log
	private static final Log log = LogFactory.getLog(ContContentController.class);
	
	private ContContentService contContentService;
	
	/**
	 * 跳转到首页
	 * 
	 * @return
	 */
	@RequestMapping("index.htm")
	public String index(String typeId, ModelMap modelMap) {
		modelMap.put("typeId", typeId);
		
		return "/page/content/cont_content_list";
	}

	/**
	 * 列表页面。
	 * 
	 * @param conditions
	 * @return
	 */
	@RequestMapping("list.htm")
	@ResponseBody
	public DataGridJsonData<ContContentDTO> list(ContentSearchVO conditions) {
		//PageContext.initSort("c.UPDATE_DATE");

		return EasyUiUtils.getPageResult(contContentService.findListPage(conditions));
	}
	
	

	/**
	 * 跳转到添加页面。
	 * 
	 * @param id
	 *            模板id
	 * @return
	 */
	@RequestMapping(value = "create.htm", method = RequestMethod.GET)
	public String toCreate(Long sysRoleId, ModelMap model) {
		return "/page/content/cont_content_edit";
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
	@RequestMapping(value = "create.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONResultDTO create(SysRole sysRole, String[] sysModelIds) {
		JSONResultDTO result = new JSONResultDTO();
//		try {
//			if (sysModelIds == null || sysRole == null
//					|| StringUtils.isBlank(sysRole.getRoleName())
//					|| sysRole.getRoleName().length() > 16) {
//				result.setMessage("输入信息不合法。");
//				result.setResult(JSONResultDTO.ERROR);
//				return result;
//			}
//
//			try {
//				sysRole.setCreator(MossActionUtils.getUserName());
//				Long sysRoleId = sysRoleService.create(sysRole, sysModelIds);
//				log(OperateTypeEnum.CREATE_ROLE, "角色id:" + sysRoleId, "角色新增");
//				result.setMessage("创建成功");
//				result.setResult(JSONResultDTO.SUCCESS);
//			} catch (RenameRuntimeException e) {
//				result.setMessage("角色名已经存在");
//				result.setResult(JSONResultDTO.ERROR);
//			}
//
//		} catch (Exception e) {
//			result.setMessage("创建失败.请重试或联系管理员。");
//			result.setResult(JSONResultDTO.ERROR);
//			log.error(e.getMessage(), e.getCause());
//			e.printStackTrace();
//		}

		return result;
	}


	/**
	 * @param contContentService the contContentService to set
	 */
	@Resource(name="contContentService")
	public void setContContentService(ContContentService contContentService) {
		this.contContentService = contContentService;
	}
	
}
