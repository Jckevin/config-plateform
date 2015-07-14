<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SunPlate</title>

<!-- Custom styles for this template -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/styles/easyui.css'/>" media="screen" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/styles/pbxcss/icon.css'/>" media="screen" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/styles/pbxcss/myicons.css'/>" media="screen" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/styles/pbxcss/demo.css'/>" media="screen" />

<script type="text/javascript"
	src="<c:url value='/javascripts/jquery.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/javascripts/jquery.easyui.min.js'/>"></script>

<script type="text/javascript">
	$(function() {
		$('#tt')
				.tabs(
						{
							onLoad : function(panel) {
								var plugin = panel.panel('options').title;
								panel
										.find(
												'textarea[name="code-' + plugin
														+ '"]')
										.each(
												function() {
													var data = $(this).val();
													data = data.replace(
															/(\r\n|\r|\n)/g,
															'\n');
													if (data.indexOf('\t') == 0) {
														data = data.replace(
																/^\t/, '');
														data = data.replace(
																/\n\t/g, '\n');
													}
													data = data.replace(/\t/g,
															'    ');
													var pre = $(
															'<pre name="code" class="prettyprint linenums"></pre>')
															.insertAfter(this);
													pre.text(data);
													$(this).remove();
												});
								//prettyPrint();
							}
						});
	});
	function open1(plugin) {
		if ($('#tt').tabs('exists', plugin)) {
			$('#tt').tabs('select', plugin);
		} else {
			$('#tt').tabs('add', {
				title : plugin,
				href : 'home',
				closable : true,
				extractor : function(data) {
					data = $.fn.panel.defaults.extractor(data);
					var tmp = $('<div></div>').html(data);
					data = tmp.find('#content').html();
					tmp.remove();
					return data;
				}
			});
		}
	}
</script>
</head>

<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north'" style="height: 70px">
			<img src="<c:url value='/images/logo.png'/>" />
		</div>
		<div data-options="region:'south'" style="height: 50px;"></div>
		<div data-options="region:'west',split:true" title="功能菜单"
			class="main-menu">
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="终端管理" style="padding: 10px;" class="sub-menu">
					<ul>
						<li><a href="#" onclick="open1('queryTerm')">查看终端</a></li>
						<li><a href="#" target="mainFrame">添加终端</a></li>
						<li><a href="#" target="mainFrame">删除终端</a></li>
					</ul>
				</div>
				<div title="基础配置" style="padding: 10px;" class="sub-menu">
					<ul>
						<li><a href="#" target="mainFrame">查看终端</a></li>
						<li><a href="#" target="mainFrame">添加终端</a></li>
						<li><a href="#" target="mainFrame">删除终端</a></li>
					</ul>
				</div>
				<div title="高级配置" style="padding: 10px;" class="sub-menu">
					<ul>
						<li><a href="#" target="mainFrame">查看终端</a></li>
						<li><a href="#" target="mainFrame">添加终端</a></li>
						<li><a href="#" target="mainFrame">删除终端</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div data-options="region:'center',title:'Main Title',iconCls:'pic_9'">
			<div id="tt" class="easyui-tabs"
				data-options="fit:true,border:false,plain:true">
				<div title="About"
					data-options="href:'/ximepbx/jviews/_content.html'"
					style="padding: 10px"></div>
				<div title="DataGrid" style="padding: 5px">
					<table class="easyui-datagrid"
						data-options="url:'/ximepbx/jdatas/datagrid_data1.json',method:'get',singleSelect:true,fit:true,fitColumns:true">
						<thead>
							<tr>
								<th data-options="field:'itemid'" width="80">Item ID</th>
								<th data-options="field:'productid'" width="100">Product ID</th>
								<th data-options="field:'listprice',align:'right'" width="80">List
									Price</th>
								<th data-options="field:'unitcost',align:'right'" width="80">Unit
									Cost</th>
								<th data-options="field:'attr1'" width="150">Attribute</th>
								<th data-options="field:'status',align:'center'" width="50">Status</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
