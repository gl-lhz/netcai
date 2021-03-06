<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pv" uri="/pageTaglib"%>  
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title></title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- 引入公共部分jsp文件 -->
  <meta name="decorator" content="default"/>
  <style type="text/css">
    .layui-form-label{
      width:100px;
    }
    
    .layui-input-block{
      width:auto;
      height:auto;
      position:relative;
	  left:800px;
    }
    table th{
      background:#ffffff;
    }
	table tr:nth-child(odd){
	  background:#F0F0F0;
	}
	.col-sm-2 {
	  width: 10%;
	}
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
  <!-- 广告信息列表start -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) --> 
    <section class="content-header">
      <h1>广告信息管理</h1>
    </section>
    <!-- Main content -->
    <shiro:hasPermission name="banner:query">
	    <section class="content">
	      <div class="row">
	        <div class="col-xs-12">
	          <div class="box">
	            <div class="box-header">
	              <h3 class="box-title">广告信息列表 </h3>
	            </div>
		        <div class="box box-info">
		           <!-- form start -->
		           <form  id="form_submit" class="form-horizontal" action="/admin/banner/list">
		             <div class="box-body">
		               <div class="form-group">
		                 <label for="title" class="col-sm-2 control-label">标题：</label>
		                 <div class="col-xs-2">
		                   <input type="text" class="form-control" id="title" name="title" value="${banner.title}" placeholder="请输入标题">
		                 </div>
						 <label for="status" class="col-sm-2 control-label">状态</label>
						 <div class="col-xs-2">
						   <select id="status" name="status" class="form-control" style="width:150px;">
							 <option value="" selected>全部</option>
							 <option value="1" <c:if test="${banner.status == 1}">selected</c:if>>启用</option>
							 <option value="-1" <c:if test="${banner.status == -1}">selected</c:if>>禁用</option>
						   </select>
						 </div>
		               </div>
		               <div class="box-footer">
		                 <button type="submit" class="btn btn-info">查询</button>
		                 <button type="reset"  id="reset" class="btn btn-info">重置</button>
		               </div>
		             </div>
		           </form>
		           <!-- form end -->
		        </div>
				<!-- 表格列表start -->
	            <div class="box">
		           <div class="box-body">
		             <div class="site-demo-button" >
					   <button data-method="setTop" id="addUser" class="layui-btn layui-btn-small"><i class="layui-icon"></i><span>&nbsp;&nbsp;新增</span></button>
					 </div>
		             <table id="example1" class="table table-bordered table-striped">
		               <thead>
			              <tr>
			                <th>主题</th>
			                <th>省</th>
			                <th>市</th>
			                <th>区</th>
			                <th>状态</th>
			                <th>创建时间</th>
			                <th>操作</th>
			              </tr>
		               </thead>
		               <tbody>
		               <c:forEach items="${paginator.object}" var="r"> 
			   			 <tr>
					       <td>${r.title}</td>
					       <td>${r.province}</td>
					       <td>${r.city}</td>
					       <td>${r.region}</td>
					       <td>
					         <c:if test="${r.status==1 }">启用</c:if>
					         <c:if test="${r.status==-1 }">禁用</c:if>
					       </td>
				           <td><fmt:formatDate value="${r.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					       <td>
					         <div class="site-demo-button" >
							   <button id="updateUser" data-method="setTop" value="${r.id }" class="layui-btn layui-btn-normal layui-btn-small"><i class="layui-icon"></i><span>&nbsp;&nbsp;修改</span></button>
							   <c:choose>
							     <c:when test="${r.status==1}">
							       <button data-method="offset" name="1" value="${r.id }" class="layui-btn layui-btn-warm layui-btn-small"><i class="layui-icon"></i><span>&nbsp;&nbsp;禁用</span></button>
							     </c:when>
							     <c:otherwise>
							       <button data-method="offset" name="-1" value="${r.id }" class="layui-btn layui-btn-warm layui-btn-small"><i class="layui-icon"></i><span>&nbsp;&nbsp;启用</span></button>
							     </c:otherwise>
							   </c:choose>
							   <button data-method="offset" value="${r.id }" class="layui-btn layui-btn-danger layui-btn-small"><i class="layui-icon"></i><span>&nbsp;&nbsp;删除</span></button>
							 </div>
					       </td>
			             </tr>
					   </c:forEach>
	                  </tbody>
		             </table>
		           </div>
		        </div>
	            <!-- 表格列表end -->
	            <div class="box-footer clearfix">
	              <ul class="pagination pagination-sm no-margin pull-left">
	              	 <pv:showPaging pageVo="${paginator}" />
	              </ul>
	            </div>
	          </div>
	        </div>
	      </div>
	    </section>
    </shiro:hasPermission>
  </div>
<script src="/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/js/raphael-min.js"></script>
<script src="/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="/plugins/knob/jquery.knob.js"></script>
<script src="/js/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/plugins/fastclick/fastclick.js"></script>
<script src="/dist/js/app.min.js"></script>
<script src="/dist/js/demo.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/layer/layer.js"></script>
<script src="/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
function onSelectPage(currentPage,pageSize)
{  
	$('#pageNum').val(currentPage);
	$('#pageSize').val(pageSize);
	$('#form_submit').submit();
} 

//重置
$(function(){
   $("#reset").click(function(){
	   window.location.href="/admin/banner/list";
   });
  });
</script>
<script>
   //新增数据弹窗
   layui.use(['layer','jquery','form','element'], function(){ //独立版的layer无需执行这一句
	   var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句  
	   //触发事件
	   var active = {
			 setTop: function(data){
				 //获取id
		       	 var id = data.val();
			     //多窗口模式，层叠置顶
			     layer.open({
			         type: 2, 
			         title: '新增/修改广告信息',
			         area: ['860px', '450px'],
			         shade: 0.5,
			         anim: 3,//0-6的动画形式，-1不开启
			         content: '/admin/banner/addBanner?id='+id,
			         zIndex: layer.zIndex, //重点1
			         success: function(layero, index){
			        	 layer.setTop(layero);
			        	 var body = layer.getChildFrame('body', index);
			             var iframeWin = window[layero.find('iframe')[0]['name']]; 
			             //弹窗表单的取消操作时关闭弹窗
			             var canclebtn=body.find('button[name="cancleSubmit"]').click(function cancleSubmit(){
			            	 layer.closeAll();
			             });
			         }
			     });
			 },
			 //启用、禁用和删除操作
		     offset: function(othis){
		         var type = othis.data('type');
		         var status=othis.text();
		         if(status.indexOf("禁用")!=-1){
	        		 //禁用的url
	        		 requestUrl="<%=request.getContextPath()%>/admin/banner/disabled";
	        		 text = "确定要禁用此条数据吗？";
	        	 }else if(status.indexOf("删除")!=-1){
	        		//删除的url
	        		 requestUrl="<%=request.getContextPath()%>/admin/banner/delete";
	        		 text = "确定要删除此条数据吗？";
	        	 }else{
	        		//启用的url
	        		 requestUrl="<%=request.getContextPath()%>/admin/banner/enabled";
	        		 text = "确定要启用此条数据吗？"; 
	        	 }
		         layer.open({
		             type: 1,
		             offset: type, 
		             id: 'LAY_demo'+type, //防止重复弹出
		             content: '<div style="padding: 20px 100px;">'+ text +'</div>',
		             btn: ['确定', '取消'],
		             btnAlign: 'c', //按钮居中
		             shade: 0.5 ,//不显示遮罩
		             yes: function(){
			        	 layer.closeAll();
			        	 var id = othis.val();
			             $.ajax({
			            	 type: "POST",
			                 url: requestUrl,
			                 data: {"id":id},
			                 dataType: "json",
			                 cache:false,
			                 success: function(data){
			                	 var code = data.code;
			                	 var msg = data.message;
			                	 if(code == "200"){
			                		 layer.msg(msg, {icon: 1,time: 6000});
			                		 //刷新页面
			                		 window.location.href="<%=request.getContextPath() %>/admin/banner/list";
			                	 }
			                 },
			                 error:function(){
			                	 layer.msg("操作失败", {icon: 1,time: 2000});//1.5秒关闭
			                 }
			             });
		             },
		             btn2: function(){
			             layer.closeAll();
			         }
		        });
		      }
		  };
	   $('.site-demo-button .layui-btn').on('click', function(){
	       var othis = $(this), method = othis.data('method');
	       active[method] ? active[method].call(this, othis) : '';
	   });
	});
</script>
</body>
</html>