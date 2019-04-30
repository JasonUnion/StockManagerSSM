<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
            <%@include file="../common/menus.jsp"%>
        </div>
        
    </div>
	<div class="easyui-accordion" style="width:960px;height:650px;">
		<div title="销售统计图" data-options="iconCls:'icon-chart-curve'" style="overflow:auto;padding:10px;">
			<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    		<div id="main" style="width: 900px;height:600px;"></div>
		</div>
	</div>
</div>
<!-- Begin of easyui-dialog -->

<%@include file="../common/footer.jsp"%>
<script type="text/javascript" src="../../resources/admin/echarts/echarts.min.js"></script>
<!-- End of easyui-dialog -->
<script type="text/javascript">
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));

// 指定图表的配置项和数据

function setOption(title,keys,value1,value2){
	var option = {
		    title: {
		        text: title
		    },
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'cross'
		        }
		    },
		    legend: {
		        data:['销售金额','退款金额']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    toolbox: {
		        feature: {
		            saveAsImage: {}
		        }
		    },
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
		        data: keys
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [
		        {
		            name:'销售金额',
		            type:'line',
		            data:value1
		        },
		        {
		            name:'退款金额',
		            type:'line',
		            data:value2
		        }
		        
		    ]
		};
	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);
}
$(document).ready(function(){
	statsDay();
});
function statsDay(){
	$.ajax({
		url:'get_stats',
		dataType:'json',
		type:'post',
		data:{type:'statsDay'},
		success:function(data){
			if(data.type == 'success'){
				setOption('日销售退货统计',getKeys(data.sellData),getValues(data.sellData),getRebackValues(getKeys(data.sellData),data.sellRebackData))
			}else{
				$.messager.alert('信息提示',data.msg,'warning');
			}
		}
	});
}	
function statsMonth(){
	$.ajax({
		url:'get_stats',
		dataType:'json',
		type:'post',
		data:{type:'statsMonth'},
		success:function(data){
			if(data.type == 'success'){
				setOption('月销售退货统计',getKeys(data.sellData),getValues(data.sellData),getRebackValues(getKeys(data.sellData),data.sellRebackData))
			}else{
				$.messager.alert('信息提示',data.msg,'warning');
			}
		}
	});
}
function statsYear(){
	$.ajax({
		url:'get_stats',
		dataType:'json',
		type:'post',
		data:{type:'statsYear'},
		success:function(data){
			if(data.type == 'success'){
				setOption('年销售退货统计',getKeys(data.sellData),getValues(data.sellData),getRebackValues(getKeys(data.sellData),data.sellRebackData))
			}else{
				$.messager.alert('信息提示',data.msg,'warning');
			}
		}
	});
}
function getKeys(data){
	var keys = [];
	for(var i=0;i<data.length;i++){
		keys[i] = data[i].statsDate;
	}
	return keys;
}
function getValues(data){
	var values = [];
	for(var i=0;i<data.length;i++){
		values[i] = data[i].money;
	}
	return values;
}
function getRebackValues(keys,data){
	var values = [];
	for(var i=0;i<keys.length;i++){
		values[i] = getValueFromRebackData(keys[i],data);
	}
	//console.log(values);
	return values;
}
function getValueFromRebackData(key,rebackData){
	for(var i=0;i<rebackData.length;i++){
		if(isExistKey(key,rebackData[i]))return rebackData[i].money;
	}
	return 0;
}
function isExistKey(key,data){
	if(data.statsDate == key)return true;
	return false;
}
</script>