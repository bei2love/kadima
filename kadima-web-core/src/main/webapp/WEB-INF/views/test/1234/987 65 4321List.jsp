<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>主子表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/test/1234/987 65 4321/">主子表列表</a></li>
		<shiro:hasPermission name="test:1234:987 65 4321:edit"><li><a href="${ctx}/test/1234/987 65 4321/form">主子表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="987 65 4321" action="${ctx}/test/1234/987 65 4321/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>编号：</label>
			</li>
			<li><label>归属用户：</label>
				<sys:treeselect id="user" name="user.id" value="${987 65 4321.user.id}" labelName="user.name" labelValue="${987 65 4321.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${987 65 4321.office.id}" labelName="office.name" labelValue="${987 65 4321.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>归属区域：</label>
				<sys:treeselect id="area" name="area.id" value="${987 65 4321.area.id}" labelName="area.name" labelValue="${987 65 4321.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>名称：</label>
			</li>
			<li><label>性别：</label>
				<form:select path="sex" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>加入日期：</label>
				<input name="inDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${987 65 4321.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>创建者：</label>
			</li>
			<li><label>创建时间：</label>
				<input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${987 65 4321.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新者：</label>
			</li>
			<li><label>更新时间：</label>
				<input name="updateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${987 65 4321.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>备注信息：</label>
				<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>删除标记（0：正常；1：删除）：</label>
				<form:radiobuttons path="delFlag" items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>编号</th>
				<th>归属用户</th>
				<th>归属部门</th>
				<th>归属区域</th>
				<th>名称</th>
				<th>性别</th>
				<th>加入日期</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新者</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<th>删除标记（0：正常；1：删除）</th>
				<shiro:hasPermission name="test:1234:987 65 4321:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="987 65 4321">
			<tr>
				<td><a href="${ctx}/test/1234/987 65 4321/form?id=${987 65 4321.id}">
					${987 65 4321.id}
				</a></td>
				<td>
					${987 65 4321.user.name}
				</td>
				<td>
					${987 65 4321.office.name}
				</td>
				<td>
					${987 65 4321.area.name}
				</td>
				<td>
					${987 65 4321.name}
				</td>
				<td>
					${fns:getDictLabel(987 65 4321.sex, 'sex', '')}
				</td>
				<td>
					<fmt:formatDate value="${987 65 4321.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${987 65 4321.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${987 65 4321.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${987 65 4321.updateBy.id}
				</td>
				<td>
					<fmt:formatDate value="${987 65 4321.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${987 65 4321.remarks}
				</td>
				<td>
					${fns:getDictLabel(987 65 4321.delFlag, 'del_flag', '')}
				</td>
				<shiro:hasPermission name="test:1234:987 65 4321:edit"><td>
    				<a href="${ctx}/test/1234/987 65 4321/form?id=${987 65 4321.id}">修改</a>
					<a href="${ctx}/test/1234/987 65 4321/delete?id=${987 65 4321.id}" onclick="return confirmx('确认要删除该主子表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>