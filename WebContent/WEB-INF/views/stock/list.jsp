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
            <label>商品名称:</label><input id="search-productName" class="wu-text" style="width:100px">
            <label>商品库存:</label>&gt;
            <input id="search-productNum" class="wu-text numberbox" data-options="min:0,precision:0" style="width:100px">
            <label>所属供应商:</label>
            <select id="search-supplier" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<c:forEach items="${supplierList }" var="supplier">
            		<option value="${supplier.id }">${supplier.name }</option>
            	</c:forEach>
            </select>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>

<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <input type="hidden" name="sellNum" id="edit-sellNum">
        <table>
            <tr>
                <td width="80" align="right">商品名称:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" readOnly="readonly" /></td>
            </tr>
            <tr>
                <td width="60" align="right">原库存量:</td>
                <td><input type="text" id="edit-old-productNum" class="wu-text" readOnly="readonly" /></td>
            </tr>
            <tr>
                <td width="60" align="right">新库存量:</td>
                <td><input type="text" id="edit-productNum" name="productNum" class="wu-text numberbox easyui-validatebox" data-options="min:0,precision:0,required:true, missingMessage:'请输入新库存量'" /></td>
            </tr>
        </table>
    </form>
</div>
<%@include file="../common/footer.jsp"%>

<!-- End of easyui-dialog -->
<script type="text/javascript">
	
	
	
	
	
	function edit(){
		var validate = $("#edit-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'edit',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','编辑成功！','info');
					//$("#add-content").val('');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	
	/**
	* 删除记录
	*/
	function remove(){
		$.messager.confirm('信息提示','确定要删除该记录？', function(result){
			if(result){
				var item = $('#data-datagrid').datagrid('getSelected');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要删除的数据！','info');
					return;
				}
				$.ajax({
					url:'delete',
					dataType:'json',
					type:'post',
					data:{id:item.id},
					success:function(data){
						if(data.type == 'success'){
							$.messager.alert('信息提示','删除成功！','info');
							$('#data-datagrid').datagrid('reload');
						}else{
							$.messager.alert('信息提示',data.msg,'warning');
						}
					}
				});
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
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "编辑商品库存信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//$("#add-form input").val('');
            	$("#edit-id").val(item.id);
            	$("#edit-sellNum").val(item.sellNum);
            	$("#edit-name").val(item.product.name);
            	$("#edit-old-productNum").val(item.productNum);
            }
        });
	}
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {productName:$("#search-productName").val()};
		var productNum = $("#search-productNum").val();
		if(productNum != ''){
			option.productNum = productNum;
		}
		var supplierId = $("#search-supplier").combobox('getValue');
		if(supplierId != -1){
			option.supplierId = supplierId;
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
	    treeField:'name',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'name',title:'商品名称',width:100,formatter:function(value,row,index){
				//console.log(row);
				return row.product.name;
			}},
			{ field:'supplierId',title:'所属供应商',width:100,formatter:function(value,row,index){
				var supplierList = $("#search-supplier").combobox('getData');
				for(var i = 0; i < supplierList.length; i++){
					if(supplierList[i].value == row.product.supplierId)return supplierList[i].text;
				}
				return value;
			}},
			{ field:'productNum',title:'库存量',width:100,sortable:true},
			{ field:'sellNum',title:'销量',width:100,sortable:true},
			{ field:'unit',title:'单位',width:100,formatter:function(value,row,index){
				//console.log(row);
				return row.product.unit;
			}},
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