<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
            <%@include file="../common/menus.jsp"%>
        </div>
        <div class="wu-toolbar-search">
            <label>操作员:</label><input id="search-operator" class="wu-text" style="width:100px">
            <label>支付方式:</label>
            <select id="search-payType" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<option value="0">现金</option>
            	<option value="1">银行转账</option>
            	<option value="2">支付宝</option>
            	<option value="3">微信</option>
            	<option value="4">支票</option>
            	<option value="5">其他</option>
            </select>
            <label>状态:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<option value="0">未支付</option>
            	<option value="1">已支付</option>
            </select>
            <label>金额:</label>
            <input id="search-minMoney" class="wu-text numberbox" data-options="min:0,precision:2" style="width:100px">
            	至
            <input id="search-maxMoney" class="wu-text numberbox" data-options="min:0,precision:2" style="width:100px">
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:650px; padding:10px;">
	<table id="selected-product-datagrid" class="easyui-datagrid" style="width:616px;height:356px" toolbar="#select-product-btn">
	<thead>
		<tr>
			<th field="id" width="151px">商品ID</th>
			<th field="name" width="151px">商品名称</th>
			<th field="price" width="151px">商品价格</th>
			<th field="productNum" width="151px" editor="{type:'numberbox',options:{min:1,precision:0}}">商品数量</th>
		</tr>
	</thead>
</table>
<div id="select-product-btn">
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="selectProduct()">添加商品</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeProduct()">删除</a>
</div>
</div>
<!-- 选择商品弹框 -->
<div id="show-product-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:750px; padding:10px;">
	<table id="show-product-datagrid" class="easyui-datagrid" style="width:716px;height:450px">
	</table>
</div>

<!-- 添加第二窗口 -->
<div id="add-2-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="add-form" method="post">
        <table>
            <tr>
                <td width="60" align="right">支付方式:</td>
                <td>
                	<select name="payType" id="add-payType" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择支付方式'">
		            	<option value="0" selected>现金</option>
		            	<option value="1">银行转账</option>
		            	<option value="2">支付宝</option>
		            	<option value="3">微信</option>
		            	<option value="4">支票</option>
		            	<option value="5">其他</option>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">状态:</td>
                <td>
                	<select name="status" id="add-status" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择状态'">
		            	<option value="0" selected>未支付</option>
		            	<option value="1">已支付</option>
		            </select>
                </td>
            </tr>
            <tr>
                <td align="right">备注:</td>
                <td><textarea name="remark" id="add-remark" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
        </table>
    </form>
</div>
<!-- 查看商品弹窗 -->
<div id="view-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:560px; padding:10px;">
	<table id="view-detail-datagrid" class="easyui-datagrid" style="width:526px;height:356px">
	<thead>
		<tr>
			<th field="id" width="103px">ID</th>
			<th field="productName" width="103px">商品名称</th>
			<th field="price" width="103px">商品价格</th>
			<th field="productNum" width="103px">商品数量</th>
			<th field="money" width="103px">商品金额</th>
		</tr>
	</thead>
</table>
</div>
<%@include file="../common/footer.jsp"%>

<!-- End of easyui-dialog -->
<script type="text/javascript">
	
	
	
	/**
	*  添加记录
	*/
	function add(){
		var selectedProducts = $("#selected-product-datagrid").datagrid('getData').rows;
		if(selectedProducts.length <= 0){
			$.messager.alert('信息提示','请至少选择一个库存商品进行退货!','warning');
			return;
		}
		//为防止用户没有点击一行失去焦点保存修改的数量
		for(var i=0;i<selectedProducts.length;i++){
			$("#selected-product-datagrid").datagrid('endEdit',i);
		}
		//弹出选择支付方式和状态及备注的框
		$('#add-2-dialog').dialog({
			closed: false,
			modal:true,
            title: "添加备注信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: function(){
                	$.ajax({
            			url:'add',
            			dataType:'json',
            			type:'post',
            			data:{productList:JSON.stringify(selectedProducts),remark:$("#add-remark").val(),payType:$("#add-payType").combobox('getValue'),status:$("#add-status").combobox('getValue')},
            			success:function(data){
            				if(data.type == 'success'){
            					$.messager.alert('信息提示','添加成功！','info');
            					$('#add-2-dialog').dialog('close');
            					$('#add-dialog').dialog('close');
            					$('#data-datagrid').datagrid('reload');
            				}else{
            					$.messager.alert('信息提示',data.msg,'warning');
            				}
            			}
            		});
                }
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#add-2-dialog').dialog('close');                    
                }
            }]
        });
		
	}
	
	
	$("#selected-product-datagrid").datagrid({
		onClickCell:function(rowIndex, field, value){
			if(field == 'productNum'){
				$("#selected-product-datagrid").datagrid('beginEdit',rowIndex);
				return;
			}
			$("#selected-product-datagrid").datagrid('endEdit',rowIndex);
		}
	});
	//选择商品弹窗
	function selectProduct(){
		$('#show-product-dialog').dialog({
			closed: false,
			modal:true,
            title: "选择商品",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: function(){
                	var item = $('#show-product-datagrid').datagrid('getSelections');
    				if(item == null || item.length == 0){
    					$.messager.alert('信息提示','请至少选择一个库存商品信息！','info');
    					return;
    				}
    				for(var i = 0; i < item.length; i++){
    					var selectedProducts = $("#selected-product-datagrid").datagrid('getData').rows;
    					var index = -1;
    					for(var j = 0; j < selectedProducts.length; j++){
    						if(selectedProducts[j].id == item[i].productId){
    							index = j;
    							break;
    						}
    					}
    					if(index > -1){
    						//说明存在，更新
    						$("#selected-product-datagrid").datagrid('updateRow',{
    							index:j,	
    							row:{
    	    						id:item[i].productId,
    	    						name:item[i].product.name,
    	    						price:item[i].product.price,
    	    						productNum:parseInt(selectedProducts[j].productNum) + 1
    							}
        					});
    						continue;
    					}
    					//追加新的
    					$("#selected-product-datagrid").datagrid('appendRow',{
    						id:item[i].productId,
    						name:item[i].product.name,
    						price:item[i].product.price,
    						productNum:1
    					})
    				}
    				$('#show-product-dialog').dialog('close');
                }
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#show-product-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$('#show-product-datagrid').datagrid({
            		url:'../stock/list',
            		rownumbers:true,
            		singleSelect:false,
            		pageSize:20,           
            		pagination:true,
            		multiSort:true,
            		fitColumns:true,
            		idField:'id',
            		columns:[[
            			{ field:'chk',checkbox:true},
            			{ field:'name',title:'商品名称',width:100,formatter:function(value,row,index){
            				//console.log(row);
            				return row.product.name;
            			}},
            			{ field:'productNum',title:'商品数量',width:100,sortable:true},
            			{ field:'sellNum',title:'销量',width:100,sortable:true},
            			{ field:'price',title:'价格',width:100,formatter:function(value,row,index){
            				//console.log(row);
            				return row.product.price;
            			}},
            			{ field:'remark',title:'商品描述',width:200,formatter:function(value,row,index){
            				//console.log(row);
            				return row.product.remark;
            			}},
            			{ field:'createTime',title:'入库时间',width:100,formatter:function(value,index,row){return format(value);}}
            		]]
            	});
            }
        });
	}
	
	
	/**
	* 删除已选的商品
	*/
	function removeProduct(){
		$.messager.confirm('信息提示','确定要删除该记录？', function(result){
			if(result){
				var item = $('#selected-product-datagrid').datagrid('getSelections');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要删除的数据！','info');
					return;
				}
				for(var i=0;i<item.length;i++){
					$('#selected-product-datagrid').datagrid('deleteRow',$('#selected-product-datagrid').datagrid('getRowIndex',item[i]));
				}
			}	
		});
	}
	
	/**
	* Name 打开添加窗口
	*/
	function openAdd(){
		//$('#add-form').form('clear');
		$('#add-dialog').dialog({
			closed: false,
			modal:true,
            title: "添加退货商品信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: add
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#add-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$("#add-remark").val('');
            }
        });
	}
	
	/**
	*打开查看窗口
	*/
	function openView(){
		//$('#add-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要查看的数据！','info');
			return;
		}
		$('#view-dialog').dialog({
			closed: false,
			modal:true,
            title: "查看销售退货商品信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: function(){
                	$('#view-dialog').dialog('close');
                }
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#view-dialog').dialog('close');                 
                }
            }],
            onBeforeOpen:function(){
            	$("#view-detail-datagrid").datagrid('loadData',{total:0,rows:[]});
            	var productList = item.sellRebackDetailList;
            	console.log(productList);
            	for(var i = 0; i < productList.length; i++){
            		$("#view-detail-datagrid").datagrid('appendRow',{
            			id:productList[i].id,
            			productName:productList[i].productName,
            			price:productList[i].price,
            			productNum:productList[i].productNum,
            			money:productList[i].money
            		});
            	}
            }
        });
	}
	
	function openEdit(){
		//$('#add-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要修改的数据！','info');
			return;
		}
		if(item.status == 1){
			$.messager.alert('信息提示','该进货退货单已支付！','info');
			return;
		}
		$.ajax({
			url:'edit',
			dataType:'json',
			type:'post',
			data:{id:item.id},
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','支付成功！','info');
					//$("#add-content").val('');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {operator:$("#search-operator").val()};
		var status = $("#search-status").combobox('getValue');
		var payType = $("#search-payType").combobox('getValue');
		var minMoney = $("#search-minMoney").val();
		var maxMoney = $("#search-maxMoney").val();
		if(status != -1){
			option.status = status;
		}
		if(payType != -1){
			option.payType = payType;
		}
		if(minMoney != ''){
			option.minMoney = minMoney;
			
		}
		if(maxMoney != ''){
			option.maxMoney = maxMoney;
			
		}
		$('#data-datagrid').datagrid('reload',option);
	});
	
	
	
	/** 
	* 载入数据
	*/
	$('#data-datagrid').datagrid({
		url:'list',
		rownumbers:true,
		singleSelect:true,
		pageSize:20,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'money',title:'金额',width:100,sortable:true},
			{ field:'payType',title:'支付方式',width:100,formatter:function(value,index,row){
				switch(value){
					case 0:return '现金';
					case 1:return '银行转账';
					case 2:return '支付宝';
					case 3:return '微信';
					case 4:return '支票';
					case 5:return '其他';
				}
				return value;
			}},
			{ field:'status',title:'状态',width:100,formatter:function(value,index,row){
				switch(value){
					case 0:return '未支付';
					case 1:return '已支付';
				}
				return value;
			}},
			{ field:'productNum',title:'商品数量',width:100,sortable:true},
			{ field:'operator',title:'操作人',width:100,sortable:true},
			{ field:'remark',title:'商品描述',width:200,sortable:true},
			{ field:'createTime',title:'进货时间',width:200,formatter:function(value,index,row){return format(value);}}
		]]
	});
	function add0(m){return m<10?'0'+m:m }
	function format(shijianchuo){
	//shijianchuo是整数，否则要parseInt转换
		var time = new Date(shijianchuo);
		var y = time.getFullYear();
		var m = time.getMonth()+1;
		var d = time.getDate();
		var h = time.getHours();
		var mm = time.getMinutes();
		var s = time.getSeconds();
		return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
	}
</script>