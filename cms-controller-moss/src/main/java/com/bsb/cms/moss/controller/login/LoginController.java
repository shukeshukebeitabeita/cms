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
package com.bsb.cms.moss.controller.login;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bsb.cms.commons.web.JSONResultDTO;
import com.bsb.cms.commons.web.MossActionUtils;
import com.bsb.cms.content.service.content.ContTypeService;
import com.bsb.cms.content.service.tmpt.TmptTemplateService;
import com.bsb.cms.model.dto.auth.SysModelDTO;
import com.bsb.cms.model.enums.DefaultBoolean;
import com.bsb.cms.model.po.auth.SysUser;
import com.bsb.cms.model.po.content.ContType;
import com.bsb.cms.model.po.content.TmptTemplate;
import com.bsb.cms.model.vo.LoginVO;
import com.bsb.cms.model.vo.User;
import com.bsb.cms.moss.controller.utils.EasyUiUtils;
import com.bsb.cms.moss.controller.utils.EasyUiUtils.EasyTreeAdapter;
import com.bsb.cms.moss.controller.vo.EasyUiTreeObj;
import com.bsb.cms.moss.service.auth.SysModelService;
import com.bsb.cms.moss.service.auth.SysUserService;

/**
 * 登录
 * 
 * @author hongjian.liu
 * @version 1.0.0 2013-5-30
 * @since 1.0
 */
@Controller
public class LoginController {

	// log
	private static final Log log = LogFactory.getLog(LoginController.class);

	/** 登录成功后的页面。 */
	public static final String VIEW_MAIN = "/page/login/main";
	public static final String VIEW_LOGIN = "/page/login/login";
	public static final String URL_LOGIN_INDEX = "/login/index.htm";
	public static final String URL_LOGIN_SUCC = "/moss/login/toMain.htm";

	@Resource(name = "sysUserService")
	private SysUserService sysUserService;
	@Resource(name = "sysModelService")
	private SysModelService sysModelService;
	@Resource(name = "contTypeService")
	private ContTypeService contTypeService;


	/**
	 * 登录页面。
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(URL_LOGIN_INDEX)
	public ModelAndView index() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(VIEW_LOGIN);
		return mav;
	}

	/**
	 * 登录验证。
	 * 
	 * @param loginDTO
	 *            登录参数
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login/check.htm")
	@ResponseBody
	public JSONResultDTO login(@Valid LoginVO loginVO,
			BindingResult bindingResult, ModelMap model) {
		JSONResultDTO result;
		try {
			if (bindingResult.hasErrors()) {
				result = new JSONResultDTO(JSONResultDTO.ERROR, "输入的信息不合法");
				return result;
			}

			SysUser sysUser = sysUserService.login(loginVO.getName(),
					loginVO.getPassword());
			if (sysUser == null) {
				result = new JSONResultDTO(JSONResultDTO.ERROR, "用户名或密码有误");
				return result;
			}
			User user = new User();
			user.setSysUser(sysUser);
			MossActionUtils.setUserInSession(user);
			result = new JSONResultDTO("登录成功");
		} catch (Exception e) {
			result = new JSONResultDTO(JSONResultDTO.ERROR, "登录失败.系统出错，请稍候再试");
			e.printStackTrace();
			log.error(e.getMessage());
		}

		return result;
	}

	/**
	 * 登录成功后跳转。
	 * 
	 * @return
	 */
	@RequestMapping(URL_LOGIN_SUCC)
	public ModelAndView toMain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(VIEW_MAIN);
		return mav;
	}

	/**
	 * 取得用户菜单。
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/moss/login/treeMenu.htm")
	public List<EasyUiTreeObj> getMenu(HttpServletRequest request) {
		List<SysModelDTO> modelList;
		List<EasyTreeAdapter> menus = new ArrayList<EasyUiUtils.EasyTreeAdapter>();
		List<EasyUiTreeObj> menuTrees = new ArrayList<EasyUiTreeObj>();
		String contextPath = request.getContextPath();
		log.debug(request.getRequestURL());

		try {
			modelList = MossActionUtils.getUser().getMenus();
			if (CollectionUtils.isEmpty(modelList)) {
				if (MossActionUtils.isAdmin()) {
					modelList = sysModelService.findByRoleId(null);
				} else {
					modelList = sysModelService.findModelByRoleId(Long
							.valueOf(MossActionUtils.getUser().getSysUser()
									.getRoleId()));
				}
				MossActionUtils.getUser().setMenus(modelList);
			}

			if (CollectionUtils.isNotEmpty(modelList)) {
				EasyTreeAdapter easyTree;
				for (SysModelDTO o : modelList) {
					easyTree = new EasyUiUtils().new EasyTreeAdapter();
					easyTree.setId(o.getSysModelId());
					easyTree.setNodeName(o.getModelName());
					easyTree.setParentId(o.getParentId());
					easyTree.setType(o.getType());
					easyTree.setHtmlA(EasyUiUtils.getHref(o.getModelName(), o.getUrl(), contextPath, null));

					menus.add(easyTree);
				}
			}
			menuTrees = EasyUiUtils.getLeftMenu(menus, contextPath);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
		}

		return menuTrees;
	}

	/**
	 * 左边栏目
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/moss/login/type_tree.htm")
	public List<EasyUiTreeObj> getTypeTree(HttpServletRequest request) {
		List<ContType> modelList;
		List<EasyTreeAdapter> menus = new ArrayList<EasyUiUtils.EasyTreeAdapter>();
		List<EasyUiTreeObj> menuTrees = new ArrayList<EasyUiTreeObj>();
		try {
			modelList = contTypeService.findByUser(MossActionUtils.getUserId());
			if (CollectionUtils.isNotEmpty(modelList)) {
				EasyTreeAdapter easyTree;
				String url;
				for (ContType o : modelList) {
					easyTree = new EasyUiUtils().new EasyTreeAdapter();
					easyTree.setId(o.getId());
					easyTree.setNodeName(o.getTypeName());
					easyTree.setParentId(o.getParentId());
					easyTree.setType(1);
					url = "/moss/cont/index.htm?typeId=" + o.getId();
					easyTree.setHtmlA(EasyUiUtils.getHref(o.getTypeName(), url, request.getContextPath(), "type"));
					easyTree.setOneAttribute("url", url);
					easyTree.setOneAttribute("name", o.getTypeName());
					
					menus.add(easyTree);
				}
			}
			menuTrees = EasyUiUtils.getLeftMenu(menus, request.getContextPath());
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
		}

		return menuTrees;
	}
	
}
