<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑操作员</title>
<%@ include file="../include/head.jsp"%>
<script type="text/javascript" src="${rc.contextPath}/js/auth/role.js"></script>
</head>
<body>
	<div style="margin:10px 0;"></div>
	 <form id="ff" method="post">
	 <c:if test="${not empty sysRole }">
	<input type="hidden" name="sysRoleId" value="${sysRole.sysRoleId }"/>
	</c:if>
          <span> <b> 角色名：</b></span> <input type="text" class="easyui-validatebox" name="roleName" value="${sysRole.roleName }" data-options="required:true,validType:['length[2,16]']"/>
	<div style="margin:10px 0;"></div>
	<div class="easyui-panel jbackground tabcont">
		<div style="padding:10px 0 10px 10px" id="fenlifloat">
	    	<table title="" class="easyui-treegrid" style="width:670px;height:950px"
			data-options="
				url: <c:if test="${not empty sysRole }">'${rc.contextPath }/moss/role/getMemu.htm?sysRoleId=${sysRole.sysRoleId }'</c:if><c:if test="${empty sysRole }">'${rc.contextPath }/moss/role/getMemu.htm'</c:if>,
				rownumbers: true,
				idField: 'id',
				treeField: 'name'
			">
				<thead>
					<tr>
						<th data-options="field:'name'" width="200">菜单</th>
						<th data-options="field:'button1'" width="60" align="center"></th>
						<th data-options="field:'button2'" width="60" align="center"></th>
						<th data-options="field:'button3'" width="60" align="center"></th>
						<th data-options="field:'button4'" width="60" align="center"></th>
						<th data-options="field:'button5'" width="60" align="center"></th>
						<th data-options="field:'button6'" width="60" align="center"></th>
						<th data-options="field:'button7'" width="60" align="center"></th>
						<!-- 	<th data-options="field:'button8'" width="60"></th>
						<th data-options="field:'button9'" width="60"></th> -->
					</tr>
				</thead>
			</table>
		 	
			<div  style="width:100%;text-align: center;">
			    <div style="text-align:center;padding:30px;">
			    	<c:choose>
			    		<c:when test="${empty sysRole }">
			    		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitAddForm()">确 定</a>
			    	    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" onclick="closeAddWin()">取 消</a>
			    		</c:when>
			    		<c:otherwise>
			    		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitUpdateForm()">确 定</a>
			    		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" onclick="closeUpdateWin()">取 消</a>
			    		</c:otherwise>
			    	</c:choose>
			    	
			    </div>
			</div>
	    </div>
	    </form>
	</div>
</body>

</html>