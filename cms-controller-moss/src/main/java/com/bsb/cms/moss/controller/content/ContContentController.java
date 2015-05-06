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

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bsb.cms.commons.exceptions.RenameRuntimeException;
import com.bsb.cms.commons.web.JSONResultDTO;
import com.bsb.cms.content.service.content.ContAttributeCacheService;
import com.bsb.cms.content.service.content.ContAttributeService;
import com.bsb.cms.content.service.content.ContContentPublisherService;
import com.bsb.cms.content.service.content.ContContentService;
import com.bsb.cms.content.service.content.ContTypeCacheService;
import com.bsb.cms.content.service.content.TmptTemplateCacheService;
import com.bsb.cms.content.service.utils.PublishUtil;
import com.bsb.cms.controller.upload.ImgRemot2Location;
import com.bsb.cms.model.dto.content.ContContentAllDTO;
import com.bsb.cms.model.dto.content.ContTypeDTO;
import com.bsb.cms.model.enums.ContentEnum;
import com.bsb.cms.model.enums.OperateTypeEnum;
import com.bsb.cms.model.po.content.ContContent;
import com.bsb.cms.model.po.content.ContContentBody;
import com.bsb.cms.model.vo.content.ContentSearchVO;
import com.bsb.cms.moss.controller.log.LogController;
import com.bsb.cms.moss.controller.utils.ContentAndTypeUtils;
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
	private static final String EDIT= "/page/content/cont_content_edit";
	private static final String LIST= "/page/content/cont_content_list";
	
	private ContContentService contContentService;
	@Resource(name="contTypeCacheService")
	private ContTypeCacheService contTypeCacheService;
	@Resource(name="tmptTemplateCacheService")
	private TmptTemplateCacheService tmptTemplateCacheService;
	@Resource(name="contAttributeService")
	private ContAttributeService contAttributeService;
	@Resource(name="contAttributeCacheService")
	private ContAttributeCacheService contAttributeCacheService;
	@Resource(name="contContentPublisherService")
	private ContContentPublisherService contContentPublisherService;
	@Value("${common.static}")
	private String staticPath;
	@Autowired
	private ImgRemot2Location imgRemot2Location;
	
	/**
	 * 跳转到首页
	 * 
	 * @return
	 */
	@RequestMapping("index.htm")
	public String index(String typeId, ModelMap modelMap) {
		modelMap.put("typeId", typeId);
		modelMap.put("staticPath", staticPath);
		
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
	public DataGridJsonData<ContContent> list(ContentSearchVO conditions) {
		//PageContext.initSort("UPDATE_DATE");
		List<ContContent> contents = contContentService.findListPage(conditions);
		if(contents != null) {
			for(ContContent c: contents) {
				c.setTypeName(contTypeCacheService.getById(c.getTypeId()).getTitle());
				c.setAttributeName(contAttributeCacheService.getById(c.getAttrId()).getName());
			}
		}
		return EasyUiUtils.getPageResult(contents);
	}
	
	

	/**
	 * 跳转到添加页面。
	 * 
	 * @param id    模板id
	 * @return
	 */
	@RequestMapping(value = "create.htm", method = RequestMethod.GET)
	public String toCreate(Long typeId, ModelMap modelMap) {
		ContTypeDTO type = contTypeCacheService.getById(Long.valueOf(typeId));
		modelMap.put("type", type);
		modelMap.put("template", tmptTemplateCacheService.getById(type.getContent_template_id()));
		modelMap.put("attribute", contAttributeService.findById(type.getAttr_id()));
		modelMap.put("extAttribute", null);//TODO
		
		return EDIT;
	}
	
	/**
	 *  to update page 
	 * @param contentId
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "update.htm", method = RequestMethod.GET)
	public String toUpdate(Long contentId, ModelMap modelMap) {
		ContContentAllDTO content = contContentService.findContentById(contentId);
		modelMap.put("type", contTypeCacheService.getById(content.getTypeId()));
		modelMap.put("template", tmptTemplateCacheService.getById(content.getTemplateId()));
		modelMap.put("attribute", contAttributeService.findById(content.getAttrId()));
		modelMap.put("extAttribute", null);//TODO
		modelMap.put("content", content);
		
		return EDIT;
	}

	/**
	 * 添加。
	 * 
	 * @param content  
	 * @param contentBody 详细内容
	 * @param modelMap  
	 * @return
	 */
	@RequestMapping(value = "create.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONResultDTO create(ContContent content, String contentBody, ModelMap modelMap) {
		JSONResultDTO result = new JSONResultDTO();
		ContContentBody contContentBody = null;
		try {
			if(StringUtils.isNotBlank(contentBody)) {
				String[] htmls = imgRemot2Location.transfer(contentBody, content.getcTag());
				contContentBody = new ContContentBody(htmls[1]);
				if(StringUtils.isNotBlank(htmls[0])){
					content.setDefaultImg("/" + htmls[0]);
				}
			}
			try {
				ContentAndTypeUtils.setAllParentId(contTypeCacheService, content);//设置1到4级栏目id
				content.setStatus(ContentEnum.DEPLOY.getCode());
				content.setContentUrl(PublishUtil.getCtURL(null));
				Long id = contContentService.create(content, contContentBody);
				content.setContentUrl(content.getContentUrl() + id.toString() + ".html");//TODO
				contContentPublisherService.publishContent(PublishUtil.translateContent(content, contContentBody));
				
				log(OperateTypeEnum.CONTENT_CREATE, "id:" + id, "新增内容");
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

	
	@RequestMapping(value = "update.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONResultDTO update(ContContent content, ContContentBody contContentBody, ModelMap modelMap) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			try {
				String contentBody = contContentBody.getContentBody();
				if(StringUtils.isNotBlank(contentBody)) {
					String[] htmls = imgRemot2Location.transfer(contentBody, content.getcTag());
					contContentBody.setContentBody(htmls[1]);
					if(StringUtils.isNotBlank(htmls[0])){
						content.setDefaultImg("/" + htmls[0]);
					}
				}
				content.setStatus(ContentEnum.DEPLOY.getCode());
				contContentService.updateById(content, contContentBody);
				content.setContentUrl(content.getContentUrl() + content.getId() + ".html");//TODO
				contContentPublisherService.publishContent(PublishUtil.translateContent(content, contContentBody));
				
				log(OperateTypeEnum.CONTENT_UPDATE, "id:" + content.getId(), "编辑内容");
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

	/**
	 * @param contContentService the contContentService to set
	 */
	@Resource(name="contContentService")
	public void setContContentService(ContContentService contContentService) {
		this.contContentService = contContentService;
	}
	
}
