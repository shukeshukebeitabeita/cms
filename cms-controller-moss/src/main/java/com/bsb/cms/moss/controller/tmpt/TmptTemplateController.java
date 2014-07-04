/**
 * @(#)TmptTemplateController.java 2014-7-4
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
package com.bsb.cms.moss.controller.tmpt;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bsb.cms.content.service.tmpt.TmptTemplateService;
import com.bsb.cms.model.enums.DefaultBoolean;
import com.bsb.cms.model.po.content.TmptTemplate;
import com.bsb.cms.moss.controller.vo.EasyUiTreeObj;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-4
 * @since 1.0
 */
@Controller
@RequestMapping("/moss/template/")
public class TmptTemplateController {
	// log
	private static final Log log = LogFactory.getLog(TmptTemplateController.class);
	private static final String EDIT= "/page/template/tmpt_template_edit";
	@Resource(name = "tmptTemplateService")
	private TmptTemplateService tmptTemplateService;
	
	/**
	 * 左边模板
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("index.htm")
	public List<EasyUiTreeObj> getTemplateTree(String id, HttpServletRequest request) {
		List<TmptTemplate> modelList;
		List<EasyUiTreeObj> menuTrees = new ArrayList<EasyUiTreeObj>();
		try {
			if(StringUtils.isBlank(id))
				id = "0";
			modelList = tmptTemplateService.findChildrenById(Long.valueOf(id));
			if (CollectionUtils.isNotEmpty(modelList)) {
				EasyUiTreeObj easyTree;
				for (TmptTemplate o : modelList) {
					easyTree = new EasyUiTreeObj();
					easyTree.setId(String.valueOf(o.getId()));
					easyTree.setText(o.getTemplateName());
					if(o.getHasLeaf().intValue() == DefaultBoolean.N.getCode()) {
						easyTree.setState(EasyUiTreeObj.CLOSED);
					}
					easyTree.setOneAttribute("isTemplate", String.valueOf(o.getHasLeaf()));
					
					menuTrees.add(easyTree);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
		}

		return menuTrees;
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
//	
//	/**
//	 *  to update page 
//	 * @param id
//	 * @param modelMap
//	 * @return
//	 */
//	@RequestMapping(value = "update.htm", method = RequestMethod.GET)
//	public String toUpdate(Long id, ModelMap modelMap) {
//		modelMap.put("attribute", contAttributeService.findById(id));
//		modelMap.put("extAttribute", null);//TODO
//		
//		return EDIT;
//	}
//
//	/**
//	 * 添加角色。
//	 * 
//	 * @param attribute  
//	 * @param modelMap  
//	 * @return
//	 */
//	@RequestMapping(value = "create.htm", method = RequestMethod.POST)
//	@ResponseBody
//	public JSONResultDTO create(ContAttribute attribute,  ModelMap modelMap) {
//		JSONResultDTO result = new JSONResultDTO();
//		try {
//			try {
//				Long id = contAttributeService.create(attribute);
//				log(OperateTypeEnum.ATTRIBUTE_CREATE, "id:" + id, "新增类型");
//			} catch (RenameRuntimeException e) {
//				result.setMessage("标题名已经存在");
//				result.setResult(JSONResultDTO.ERROR);
//			}
//
//		} catch (Exception e) {
//			result.setMessage("创建失败.请重试或联系管理员。");
//			result.setResult(JSONResultDTO.ERROR);
//			log.error(e.getMessage(), e.getCause());
//			e.printStackTrace();
//		}
//
//		return result;
//	}
//
//	/**
//	 * 
//	 * @param attribute
//	 * @param modelMap
//	 * @return
//	 */
//	@RequestMapping(value = "update.htm", method = RequestMethod.POST)
//	@ResponseBody
//	public JSONResultDTO update(ContAttribute attribute, ModelMap modelMap) {
//		JSONResultDTO result = new JSONResultDTO();
//		try {
//			try {
//				contAttributeService.updateById(attribute);
//				log(OperateTypeEnum.ATTRIBUTE_UPDATE, "id:" + attribute.getId(), "编辑类型");
//			} catch (RenameRuntimeException e) {
//				result.setMessage("标题名已经存在");
//				result.setResult(JSONResultDTO.ERROR);
//			}
//		} catch (Exception e) {
//			result.setMessage("编辑失败.请重试或联系管理员。");
//			result.setResult(JSONResultDTO.ERROR);
//			log.error(e.getMessage(), e.getCause());
//			e.printStackTrace();
//		}
//
//		return result;
//	}
}
