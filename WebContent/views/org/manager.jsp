<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<k:section name="title">文件管理</k:section>

<k:section name="head">
	<script type="text/javascript" src="${root}/views/org/manager.js"></script>
	<script type="text/javascript">
		$(function() {
			jctx.init("${root}");
		});
	</script>
</k:section>

<k:section name="body">
	<k:dock region="center" border="false" style="padding: 2px;">
	<k:layout id="ctx" fit="true">
		<k:dock region="west" split="true" border="true" style="padding: 10px; width: 200px;">
			<k:tree id="tv" />
		</k:dock>
		<k:dock region="center" border="false">
			<k:datagrid id="tg" fit="true" rownumbers="true" toolbar="#tb" pagination="true" singleSelect="true"
				pageSize="10" idField="orgId">
				<k:column field="ck" checkbox="true" />
				<k:column field="code" title="组织代码" width="100" />
				<k:column field="displayName" title="组织名称" width="180" />
				<k:column field="orgTypeName" title="组织类型" align="center" width="80" />
				<k:column field="serial" title="排序码" align="center" width="80" />
			</k:datagrid>
			<div id="tb">
				<k:linkbutton id="tbaddcompany" onClick="jctx.addCompany()" disabled="true" iconCls="icon-company" plain="true" text="添加公司" />
				<k:linkbutton id="tbadddepart" onClick="jctx.addDepart()" disabled="true" iconCls="icon-depart" plain="true" text="添加部门" />
				<k:linkbutton id="tbaddposition" onClick="jctx.addPosition()" disabled="true" iconCls="icon-position" plain="true" text="添加岗位" />
				<div style="float:right;">
				<k:textbox id="search" prompt="搜索：代码、名称" style="width:250px;height:24px;" />
				</div>
			</div>
			<div id="mm" class="easyui-menu" style="width: 120px;">
				<div id="mmaddcompany" onclick="jctx.addCompany()" data-options="iconCls:'icon-company'">添加公司</div>
				<div id="mmadddepart" onclick="jctx.addDepart()" data-options="iconCls:'icon-depart'">添加部门</div>
				<div id="mmaddposition" onclick="jctx.addPosition()" data-options="iconCls:'icon-position'">添加岗位</div>
				<div class="menu-sep"></div>
				<div id="mmedit" onclick="jctx.edit()" data-options="iconCls:'icon-edit'">编辑</div>
				<div id="mmremove" onclick="jctx.remove()" data-options="iconCls:'icon-remove'">删除</div>
				<div class="menu-sep"></div>
				<div onclick="expand()">展开</div>
				<div onclick="collapse()">收缩</div>
			</div>
		</k:dock>
	</k:layout>
	</k:dock>
</k:section>

<%@ include file="/views/shared/_simple.jsp"%>