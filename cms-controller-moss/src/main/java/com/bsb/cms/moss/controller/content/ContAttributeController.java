/**
 * @(#)ContAttributeController.java 2014-7-3
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

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bsb.cms.commons.exceptions.RenameRuntimeException;
import com.bsb.cms.commons.web.JSONResultDTO;
import com.bsb.cms.content.service.content.ContAttributeService;
import com.bsb.cms.model.enums.OperateTypeEnum;
import com.bsb.cms.model.po.content.ContAttribute;
import com.bsb.cms.moss.controller.log.LogController;
import com.bsb.cms.moss.controller.utils.DataGridJsonData;
import com.bsb.cms.moss.controller.utils.EasyUiUtils;

/**
 * 内容类型/属性/栏目类型
 * @author hongjian.liu
 * @version 1.0.0 2014-7-3
 * @since 1.0
 */
@Controller
@RequestMapping("/moss/attr/")
public class ContAttributeController extends LogController {
	// log
	private static final Log log = LogFactory.getLog(ContAttributeController.class);
	private static final String EDIT= "/page/attribute/cont_attr_edit";
	private static final String LIST= "/page/attribute/cont_attr_list";
	@Resource(name="contAttributeService")
	private ContAttributeService contAttributeService;
	
	/**
	 * 跳转到首页
	 * 
	 * @return
	 */
	@RequestMapping("index.htm")
	public String index(String typeId, ModelMap modelMap) {
		modelMap.put("typeId", typeId);
		
		return LIST;
	}

	/**
	 * 列表页面。
	 * 
	 * @param conditions
	 * @return
	 */
	@RequestMapping("list.htm")
	@ResponseBody
	public DataGridJsonData<ContAttribute> list(ContAttribute conditions) {

		return EasyUiUtils.getPageResult(contAttributeService.findListPage(conditions));
	}
	

	/**
	 * 跳转到添加页面。
	 * 
	 * @return
	 */
	@RequestMapping(value = "create.htm", method = RequestMethod.GET)
	public String toCreate() {
		
		return EDIT;
	}
	
	/**
	 *  to update page 
	 * @param id
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "update.htm", method = RequestMethod.GET)
	public String toUpdate(Long id, ModelMap modelMap) {
		modelMap.put("attribute", contAttributeService.findById(id));
		modelMap.put("extAttribute", null);//TODO
		
		return EDIT;
	}

	/**
	 * 添加。
	 * 
	 * @param attribute  
	 * @param modelMap  
	 * @return
	 */
	@RequestMapping(value = "create.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONResultDTO create(ContAttribute attribute,  ModelMap modelMap) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			try {
				Long id = contAttributeService.create(attribute);
				log(OperateTypeEnum.ATTRIBUTE_CREATE, "id:" + id, "新增类型");
			} catch (RenameRuntimeException e) {
				result.setMessage("标题名已经存在");
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
	 * update
	 * @param attribute
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "update.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONResultDTO update(ContAttribute attribute, ModelMap modelMap) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			try {
				contAttributeService.updateById(attribute);
				log(OperateTypeEnum.ATTRIBUTE_UPDATE, "id:" + attribute.getId(), "编辑类型");
			} catch (RenameRuntimeException e) {
				result.setMessage("标题名已经存在");
				result.setResult(JSONResultDTO.ERROR);
			}
		} catch (Exception e) {
			result.setMessage("编辑失败.请重试或联系管理员。");
			result.setResult(JSONResultDTO.ERROR);
			log.error(e.getMessage(), e.getCause());
			e.printStackTrace();
		}

		return result;
	}
}
