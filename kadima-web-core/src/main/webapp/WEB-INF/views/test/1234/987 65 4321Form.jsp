<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>主子表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/test/1234/987 65 4321/">主子表列表</a></li>
		<li class="active"><a href="${ctx}/test/1234/987 65 4321/form?id=${987 65 4321.id}">主子表<shiro:hasPermission name="test:1234:987 65 4321:edit">${not empty 987 65 4321.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="test:1234:987 65 4321:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="987 65 4321" action="${ctx}/test/1234/987 65 4321/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">归属用户：</label>
			<div class="controls">
				<sys:treeselect id="user" name="user.id" value="${987 65 4321.user.id}" labelName="user.name" labelValue="${987 65 4321.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属部门：</label>
			<div class="controls">
				<sys:treeselect id="office" name="office.id" value="${987 65 4321.office.id}" labelName="office.name" labelValue="${987 65 4321.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属区域：</label>
			<div class="controls">
				<sys:treeselect id="area" name="area.id" value="${987 65 4321.area.id}" labelName="area.name" labelValue="${987 65 4321.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">性别：</label>
			<div class="controls">
				<form:select path="sex" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">加入日期：</label>
			<div class="controls">
				<input name="inDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${987 65 4321.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
			<div class="control-group">
				<label class="control-label">业务数据表：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>归属用户</th>
								<th>归属部门</th>
								<th>归属区域</th>
								<th>名称</th>
								<th>性别</th>
								<th>加入日期</th>
								<shiro:hasPermission name="test:1234:987 65 4321:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="987 65 4321List">
						</tbody>
						<shiro:hasPermission name="test:1234:987 65 4321:edit"><tfoot>
							<tr><td colspan="8"><a href="javascript:" onclick="addRow('#987 65 4321List', 987 65 4321RowIdx, 987 65 4321Tpl);987 65 4321RowIdx = 987 65 4321RowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="987 65 4321Tpl">//<!--
						<tr id="987 65 4321List{{idx}}">
							<td class="hide">
								<input id="987 65 4321List{{idx}}_id" name="987 65 4321List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="987 65 4321List{{idx}}_delFlag" name="987 65 4321List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<sys:treeselect id="987 65 4321List{{idx}}_user" name="987 65 4321List[{{idx}}].user.id" value="{{row.user.id}}" labelName="987 65 4321List{{idx}}.user.name" labelValue="{{row.user.name}}"
									title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>
							</td>
							<td>
								<sys:treeselect id="987 65 4321List{{idx}}_office" name="987 65 4321List[{{idx}}].office.id" value="{{row.office.id}}" labelName="987 65 4321List{{idx}}.office.name" labelValue="{{row.office.name}}"
									title="部门" url="/sys/office/treeData?type=2" cssClass="" allowClear="true" notAllowSelectParent="true"/>
							</td>
							<td>
								<sys:treeselect id="987 65 4321List{{idx}}_area" name="987 65 4321List[{{idx}}].area.id" value="{{row.area.id}}" labelName="987 65 4321List{{idx}}.area.name" labelValue="{{row.area.name}}"
									title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
							</td>
							<td>
							</td>
							<td>
								<c:forEach items="${fns:getDictList('sex')}" var="dict" varStatus="dictStatus">
									<span><input id="987 65 4321List{{idx}}_sex${dictStatus.index}" name="987 65 4321List[{{idx}}].sex" type="radio" value="${dict.value}" data-value="{{row.sex}}"><label for="987 65 4321List{{idx}}_sex${dictStatus.index}">${dict.label}</label></span>
								</c:forEach>
							</td>
							<td>
								<input id="987 65 4321List{{idx}}_inDate" name="987 65 4321List[{{idx}}].inDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
									value="{{row.inDate}}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
							</td>
							<shiro:hasPermission name="test:1234:987 65 4321:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#987 65 4321List{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var 987 65 4321RowIdx = 0, 987 65 4321Tpl = $("#987 65 4321Tpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(987 65 4321.987 65 4321List)};
							for (var i=0; i<data.length; i++){
								addRow('#987 65 4321List', 987 65 4321RowIdx, 987 65 4321Tpl, data[i]);
								987 65 4321RowIdx = 987 65 4321RowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">业务数据子表：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>名称</th>
								<th>备注信息</th>
								<shiro:hasPermission name="test:1234:987 65 4321:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="987 65 4321List">
						</tbody>
						<shiro:hasPermission name="test:1234:987 65 4321:edit"><tfoot>
							<tr><td colspan="4"><a href="javascript:" onclick="addRow('#987 65 4321List', 987 65 4321RowIdx, 987 65 4321Tpl);987 65 4321RowIdx = 987 65 4321RowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="987 65 4321Tpl">//<!--
						<tr id="987 65 4321List{{idx}}">
							<td class="hide">
								<input id="987 65 4321List{{idx}}_id" name="987 65 4321List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="987 65 4321List{{idx}}_delFlag" name="987 65 4321List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
							</td>
							<td>
							</td>
							<shiro:hasPermission name="test:1234:987 65 4321:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#987 65 4321List{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var 987 65 4321RowIdx = 0, 987 65 4321Tpl = $("#987 65 4321Tpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(987 65 4321.987 65 4321List)};
							for (var i=0; i<data.length; i++){
								addRow('#987 65 4321List', 987 65 4321RowIdx, 987 65 4321Tpl, data[i]);
								987 65 4321RowIdx = 987 65 4321RowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">业务数据表：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>归属用户</th>
								<th>归属部门</th>
								<th>归属区域</th>
								<th>名称</th>
								<th>性别</th>
								<th>加入日期</th>
								<shiro:hasPermission name="test:1234:987 65 4321:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="987 65 4321List">
						</tbody>
						<shiro:hasPermission name="test:1234:987 65 4321:edit"><tfoot>
							<tr><td colspan="8"><a href="javascript:" onclick="addRow('#987 65 4321List', 987 65 4321RowIdx, 987 65 4321Tpl);987 65 4321RowIdx = 987 65 4321RowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="987 65 4321Tpl">//<!--
						<tr id="987 65 4321List{{idx}}">
							<td class="hide">
								<input id="987 65 4321List{{idx}}_id" name="987 65 4321List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="987 65 4321List{{idx}}_delFlag" name="987 65 4321List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<sys:treeselect id="987 65 4321List{{idx}}_user" name="987 65 4321List[{{idx}}].user.id" value="{{row.user.id}}" labelName="987 65 4321List{{idx}}.user.name" labelValue="{{row.user.name}}"
									title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>
							</td>
							<td>
								<sys:treeselect id="987 65 4321List{{idx}}_office" name="987 65 4321List[{{idx}}].office.id" value="{{row.office.id}}" labelName="987 65 4321List{{idx}}.office.name" labelValue="{{row.office.name}}"
									title="部门" url="/sys/office/treeData?type=2" cssClass="" allowClear="true" notAllowSelectParent="true"/>
							</td>
							<td>
								<sys:treeselect id="987 65 4321List{{idx}}_area" name="987 65 4321List[{{idx}}].area.id" value="{{row.area.id}}" labelName="987 65 4321List{{idx}}.area.name" labelValue="{{row.area.name}}"
									title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
							</td>
							<td>
							</td>
							<td>
								<select id="987 65 4321List{{idx}}_sex" name="987 65 4321List[{{idx}}].sex" data-value="{{row.sex}}" class="input-small ">
									<option value=""></option>
									<c:forEach items="${fns:getDictList('sex')}" var="dict">
										<option value="${dict.value}">${dict.label}</option>
									</c:forEach>
								</select>
							</td>
							<td>
								<input id="987 65 4321List{{idx}}_inDate" name="987 65 4321List[{{idx}}].inDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
									value="{{row.inDate}}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
							</td>
							<shiro:hasPermission name="test:1234:987 65 4321:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#987 65 4321List{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var 987 65 4321RowIdx = 0, 987 65 4321Tpl = $("#987 65 4321Tpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(987 65 4321.987 65 4321List)};
							for (var i=0; i<data.length; i++){
								addRow('#987 65 4321List', 987 65 4321RowIdx, 987 65 4321Tpl, data[i]);
								987 65 4321RowIdx = 987 65 4321RowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">树结构表：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>父级编号</th>
								<th>所有父级编号</th>
								<th>名称</th>
								<th>排序</th>
								<shiro:hasPermission name="test:1234:987 65 4321:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="987 65 4321List">
						</tbody>
						<shiro:hasPermission name="test:1234:987 65 4321:edit"><tfoot>
							<tr><td colspan="6"><a href="javascript:" onclick="addRow('#987 65 4321List', 987 65 4321RowIdx, 987 65 4321Tpl);987 65 4321RowIdx = 987 65 4321RowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="987 65 4321Tpl">//<!--
						<tr id="987 65 4321List{{idx}}">
							<td class="hide">
								<input id="987 65 4321List{{idx}}_id" name="987 65 4321List[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="987 65 4321List{{idx}}_delFlag" name="987 65 4321List[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
							<shiro:hasPermission name="test:1234:987 65 4321:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#987 65 4321List{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var 987 65 4321RowIdx = 0, 987 65 4321Tpl = $("#987 65 4321Tpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(987 65 4321.987 65 4321List)};
							for (var i=0; i<data.length; i++){
								addRow('#987 65 4321List', 987 65 4321RowIdx, 987 65 4321Tpl, data[i]);
								987 65 4321RowIdx = 987 65 4321RowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="form-actions">
			<shiro:hasPermission name="test:1234:987 65 4321:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>