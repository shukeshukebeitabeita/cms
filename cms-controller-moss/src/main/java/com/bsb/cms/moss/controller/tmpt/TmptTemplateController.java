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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bsb.cms.commons.exceptions.RenameRuntimeException;
import com.bsb.cms.commons.web.JSONResultDTO;
import com.bsb.cms.content.service.content.TmptTemplateCacheService;
import com.bsb.cms.content.service.tmpt.TmptTemplateService;
import com.bsb.cms.model.enums.DefaultBoolean;
import com.bsb.cms.model.enums.OperateTypeEnum;
import com.bsb.cms.model.po.content.TmptTemplate;
import com.bsb.cms.model.po.content.TmptTemplateBody;
import com.bsb.cms.moss.controller.log.LogController;
import com.bsb.cms.moss.controller.utils.TemplateFileManager;
import com.bsb.cms.moss.controller.vo.EasyUiTreeObj;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-4
 * @since 1.0
 */
@Controller
@RequestMapping("/moss/template/")
public class TmptTemplateController extends LogController {
	// log
	private static final Log log = LogFactory.getLog(TmptTemplateController.class);
	private static final String EDIT= "/page/template/tmpt_template_edit";
	private static final String FOLDER_EDIT= "/page/template/tmpt_template_folder";
	@Resource(name = "tmptTemplateService")
	private TmptTemplateService tmptTemplateService;
	@Resource(name = "tmptTemplateCacheService")
	private TmptTemplateCacheService tmptTemplateCacheService;
	@Resource(name = "templateFileManager")
	private TemplateFileManager templateFileManager;
	
	/**
	 * 左边模板
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("index.htm")
	public List<EasyUiTreeObj> getTemplateTree(String id, HttpServletRequest request) {
		EasyUiTreeObj rootTree = null;
		List<TmptTemplate> modelList;
		List<EasyUiTreeObj> menuTrees = new ArrayList<EasyUiTreeObj>();
		List<EasyUiTreeObj> returnTrees = new ArrayList<EasyUiTreeObj>();
		try {
			if(StringUtils.isBlank(id)) {
				id = "0";
				rootTree = new EasyUiTreeObj();
				rootTree.setId(id);
				rootTree.setText("全部");
				rootTree.setOneAttribute("isTemplate", "0");
			}
			
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
			
			if(rootTree != null) {
				rootTree.setChildren(menuTrees);
				returnTrees.add(rootTree);
			} else {
				returnTrees = menuTrees;
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
		}

		return returnTrees;
	}
	
	/**
	 * 跳转到添加页面。
	 * @param parentId
	 * @return
	 */
	@RequestMapping(value = "create.htm", method = RequestMethod.GET)
	public String toCreate(Long parentId, String type, ModelMap modelMap) {
		modelMap.put("parentId", parentId);
		
		return "f".equals(type)?FOLDER_EDIT:EDIT;
	}
	
	/**
	 *  to update page 
	 * @param id
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "update.htm", method = RequestMethod.GET)
	public String toUpdate(Long id, String type, ModelMap modelMap) {
		TmptTemplate template = tmptTemplateService.findById(id);
		modelMap.put("template", template);
		modelMap.put("parentId", template==null?0:template.getParentId());
		if(!"f".equals(type)){
			modelMap.put("templateBody", tmptTemplateService.findBodyByTemplateId(template.getId()));
		}
		
		return "f".equals(type)?FOLDER_EDIT:EDIT;
	}

	/**
	 * 添加。
	 * 
	 * @param template  
	 * @param tmptTemplateBody
	 * @param modelMap  
	 * @return
	 */
	@RequestMapping(value = "create.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONResultDTO create(TmptTemplate template, TmptTemplateBody tmptTemplateBody, ModelMap modelMap, HttpServletRequest req) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			try {
				Long id = tmptTemplateService.create(template, tmptTemplateBody);
				if(template.getHasLeaf().intValue() == 1) {//如果是模板,设置缓存,并生存文件
					tmptTemplateCacheService.set(template);
					
					String dirPath = template.getFileDir();
					if (StringUtils.isBlank(dirPath)) {
						String realRootPath = req.getSession().getServletContext().getRealPath("/");
						dirPath = realRootPath + "/WEB-INF/classes/template/" + template.getParentId() + "/";
					}
					templateFileManager.createFreemarkFile(dirPath, String.valueOf(template.getId()), tmptTemplateBody.getTemplateBody());
				}
				log(OperateTypeEnum.TEMPLATE_CREATE, "id:" + id, "新增");
			} catch (RenameRuntimeException e) {
				result.setMessage("名称已经存在");
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
	 * @param template  
	 * @param tmptTemplateBody
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "update.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONResultDTO update(TmptTemplate template, TmptTemplateBody tmptTemplateBody, ModelMap modelMap, HttpServletRequest req) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			try {
				tmptTemplateService.update(template, tmptTemplateBody);
				if(template.getHasLeaf().intValue() == 1) {//如果是模板,设置缓存,并生存文件
					tmptTemplateCacheService.set(template);
					
					String dirPath = template.getFileDir();
					if (StringUtils.isBlank(dirPath)) {
						String realRootPath = req.getSession().getServletContext().getRealPath("/");
						dirPath = realRootPath + "/WEB-INF/classes/template/" + template.getParentId() + "/";
					}
					templateFileManager.createFreemarkFile(dirPath, String.valueOf(template.getId()), tmptTemplateBody.getTemplateBody());
				}
				log(OperateTypeEnum.TEMPLATE_UPDATE, "id:" + template.getId(), "编辑");
			} catch (RenameRuntimeException e) {
				result.setMessage("名称已经存在");
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
