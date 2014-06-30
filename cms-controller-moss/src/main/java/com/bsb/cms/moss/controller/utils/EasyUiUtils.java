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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import com.bsb.cms.commons.page.PageContext;
import com.bsb.cms.model.dto.auth.SysModelDTO;
import com.bsb.cms.moss.controller.vo.EasyUiTreeObj;
import com.bsb.cms.moss.controller.vo.TreegridVO;

/**
 * easyui 工具类
 * 
 * @author hongjian.liu
 * @version 1.0.0 2014-6-8
 * @since 1.0
 */
public class EasyUiUtils {

	/**
	 * 组装easyui的分页
	 * 
	 * @param list
	 * @return
	 */
	public static <T> DataGridJsonData<T> getPageResult(List<T> list) {
		PageContext page = PageContext.getContext();
		return new DataGridJsonData<T>(list, page.getTotalRows());
	}

	//--------------菜单权限树 start
	/**
	 * 角色菜单权限树
	 * 
	 * @param menus
	 * @return
	 */
	public static List<TreegridVO> toMenuButonTree(List<SysModelDTO> menus) {
		List<TreegridVO> trees = new ArrayList<TreegridVO>();
		TreegridVO gen = new TreegridVO("-1", "所有权限");

		if (CollectionUtils.isNotEmpty(menus)) {
			List<TreegridVO> firstDethTrees = new ArrayList<TreegridVO>();
			TreegridVO checkTree;
			for (SysModelDTO o : menus) {
				if (o.getParentId().longValue() == 0L) {
					checkTree = new TreegridVO(
							String.valueOf(o.getSysModelId()), getCheckNode(
									String.valueOf(o.getSysModelId()),
									o.getModelName(), o.getSysRoleId()));
					getTreeChildren(menus, checkTree);
					firstDethTrees.add(checkTree);
				}
			}

			gen.setChildren(firstDethTrees);
		}

		trees.add(gen);
		return trees;

	}

	/*
	 * 取得checkTree的子节点 菜单比较少，没有采用效率比较高的算法。
	 */
	private static void getTreeChildren(List<SysModelDTO> menus,
			TreegridVO checkTree) {
		TreegridVO subCheckTree;
		List<TreegridVO> children = new ArrayList<TreegridVO>();
		for (SysModelDTO o : menus) {
			if (String.valueOf(o.getParentId()).equals(checkTree.getId())) {
				if ("1".equals(o.getType().toString())) {// 菜单
					subCheckTree = new TreegridVO(String.valueOf(o
							.getSysModelId()), getCheckNode(
							String.valueOf(o.getSysModelId()),
							o.getModelName(), o.getSysRoleId()));

					getTreeChildren(menus, subCheckTree);// 递归取得子菜单
					children.add(subCheckTree);
				} else {// 非菜单(按钮)
					setButton(checkTree, o);
				}
			}

		}

		if (CollectionUtils.isNotEmpty(children)) {
			checkTree.setChildren(children);
		}
	}

	private static String checkbox = "<input name=\"sysModelIds\" type=\"checkbox\" value=\"{id}\" {checked}/>{name}";

	/**
	 * 生成checkbox
	 * 
	 * @param id
	 * @param name
	 * @param roleId
	 * @return
	 */
	private static String getCheckNode(String id, String name, Long roleId) {
		String node = checkbox.replace("{name}", name);
		String checked = "checked=\"checked\"";
		if (roleId == null) {
			checked = "";
		}
		node = node.replace("{id}", id);
		node = node.replace("{checked}", checked);

		return node;
	}

	/**
	 * 组装Button，最多9个button.因为系统无需支持太多button.
	 * 
	 * @param checkTree
	 *            父节点
	 * @param o
	 *            子节点
	 */
	private static void setButton(TreegridVO checkTree, SysModelDTO o) {
		String button = getCheckNode(String.valueOf(o.getSysModelId()),
				o.getModelName(), o.getSysRoleId());
		if (StringUtils.isBlank(checkTree.getButton1())) {
			checkTree.setButton1(button);
		} else if (StringUtils.isBlank(checkTree.getButton2())) {
			checkTree.setButton2(button);
		} else if (StringUtils.isBlank(checkTree.getButton3())) {
			checkTree.setButton3(button);
		} else if (StringUtils.isBlank(checkTree.getButton4())) {
			checkTree.setButton4(button);
		} else if (StringUtils.isBlank(checkTree.getButton5())) {
			checkTree.setButton5(button);
		} else if (StringUtils.isBlank(checkTree.getButton6())) {
			checkTree.setButton6(button);
		} else if (StringUtils.isBlank(checkTree.getButton7())) {
			checkTree.setButton7(button);
		} else if (StringUtils.isBlank(checkTree.getButton8())) {
			checkTree.setButton8(button);
		} else if (StringUtils.isBlank(checkTree.getButton9())) {
			checkTree.setButton9(button);
		}
	}
	//--------------菜单权限树 end
	
	
	
	// --------------------左边菜单 start
	/**
	 * 运营后台主页面的左边菜单
	 * 
	 * @param menus
	 * @return
	 */
	public static List<EasyUiTreeObj> getLeftMenu(List<EasyTreeAdapter> menus,
			String contextPath) {
		List<EasyUiTreeObj> menuTrees = new ArrayList<EasyUiTreeObj>();
		EasyUiTreeObj rootMenuNode = new EasyUiTreeObj();
		rootMenuNode.setId("0");
		rootMenuNode.setState("open");
		//rootMenuNode.setText("所有菜单");
		rootMenuNode.setText("全部");

		if (CollectionUtils.isNotEmpty(menus)) {
			List<EasyUiTreeObj> firstDethTrees = new ArrayList<EasyUiTreeObj>();
			EasyUiTreeObj menuTree;
			for (EasyTreeAdapter o : menus) {
				if (o.getParentId().longValue() == 0L) {
					menuTree = new EasyUiTreeObj(String.valueOf(o.getId()),
							o.getHtmlA(), o.getAttributes());
					getMenuChildren(menus, menuTree, contextPath);
					firstDethTrees.add(menuTree);
				}
			}

			rootMenuNode.setChildren(firstDethTrees);
		}

		menuTrees.add(rootMenuNode);
		return menuTrees;

	}

	/*
	 * 取得checkTree的子节点 菜单比较少，没有采用效率比较高的算法。
	 */
	private static void getMenuChildren(List<EasyTreeAdapter> menus,
			EasyUiTreeObj menu, String contextPath) {
		EasyUiTreeObj subMenu;
		List<EasyUiTreeObj> children = new ArrayList<EasyUiTreeObj>();
		for (EasyTreeAdapter o : menus) {
			if (String.valueOf(o.getParentId()).equals(menu.getId())) {
				if ("1".equals(o.getType().toString())) {// 菜单
					subMenu = new EasyUiTreeObj(String.valueOf(o.getId()),
							o.getHtmlA(), o.getAttributes());

					getMenuChildren(menus, subMenu, contextPath);// 递归取得子菜单
					children.add(subMenu);
				} else {// 非菜单(按钮)
					// 暂时不处理
				}
			}

		}

		if (CollectionUtils.isNotEmpty(children)) {
			menu.setChildren(children);
			// menu.setState("closed");// add liuhongjian 2013-09-24
		}
	}

	/**
	 * 组装菜单URL。
	 * 
	 * @param title
	 * @param url
	 * @return
	 */
	public static String getHref(String title, String url, String contextPath, String flag) {
		if (StringUtils.isBlank(url)) {
			return title;
		}
		
		if (StringUtils.isBlank(flag)) {
			return "<a href='javascript:;' onclick='j.addTab(\" " + title
					+ "\", \" " + contextPath + "/" + url + "\");'>" + title
					+ "</a>";
		} else {
			return "<a href='javascript:;' onclick='j.addTab(\" " + title
					+ "\", \" " + contextPath + "/" + url + "\", \"" + flag + "\");'>" + title
					+ "</a>";
		}
		
	}

	// --------------------左边菜单 end

	public class EasyTreeAdapter {
		private Long id;
		private String nodeName;
		private Long parentId;
		private Integer type;
		private String htmlA;
		private Map<String, String> attributes = new HashMap<String, String>();//自定义属性

		/**
		 * @return the id
		 */
		public Long getId() {
			return id;
		}

		/**
		 * @param id
		 *            the id to set
		 */
		public void setId(Long id) {
			this.id = id;
		}

		/**
		 * @return the nodeName
		 */
		public String getNodeName() {
			return nodeName;
		}

		/**
		 * @param nodeName
		 *            the nodeName to set
		 */
		public void setNodeName(String nodeName) {
			this.nodeName = nodeName;
		}

		/**
		 * @return the parentId
		 */
		public Long getParentId() {
			return parentId;
		}

		/**
		 * @param parentId
		 *            the parentId to set
		 */
		public void setParentId(Long parentId) {
			this.parentId = parentId;
		}

		/**
		 * @return the type
		 */
		public Integer getType() {
			return type;
		}

		/**
		 * @param type
		 *            the type to set
		 */
		public void setType(Integer type) {
			this.type = type;
		}

		/**
		 * @return the htmlA
		 */
		public String getHtmlA() {
			return htmlA;
		}

		/**
		 * @param htmlA the htmlA to set
		 */
		public void setHtmlA(String htmlA) {
			this.htmlA = htmlA;
		}

		/**
		 * @return the attributes
		 */
		public Map<String, String> getAttributes() {
			return attributes;
		}

		/**
		 * @param attributes the attributes to set
		 */
		public void setAttributes(Map<String, String> attributes) {
			this.attributes = attributes;
		}

		public void setOneAttribute(String key, String value) {
			this.attributes.put(key, value);
		}

	}
}