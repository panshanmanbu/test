<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
 String path=request.getContextPath();
 String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath %>/css/bootstrap.min.css">
</head>
<body>
    <script src="<%=basePath %>/js/jquery.min.js"></script>
	<script src="<%=basePath %>/js/bootstrap.min.js"></script>
	<script  type="text/javascript">
    function doChange(){
    	$.ajax({   
    		cache: false,
    		async: false,
    		url:"<%=basePath%>/admin/change",
            type: "POST",
            data:{
            	'selected':$("#pid").val(),
            	'id':$('#getId').html()
            },
            error: function(request) {
            	alert("发送请求失败！");
            	},
            success: function (data) {
            	$('#changeMe').html($('#myForm').serialize());
                alert("成功");
                
            }
        });
    }
	</script>
	
	
	<table>
		<thead>
			<tr>
			    <td>单号</td>
				<td>模块ID</td>
				<td>rmo版本用时</td>
				<td>mce版本用时</td>
			</tr>
		</thead>
		<tbody id="maindata">
			<tr>
			<td><div id="getId">${devmOne.id }</div></td>
			<td>${devmOne.devmModel }</td>
			<td>${devmOne.rmoTime }</td>
			<td><div id="changeMe">${devmOne.mceTime }</div></td>
			</tr>
		</tbody>
	</table>

    <form id="myForm">
	<select id="pid">
	<c:if test="${devmOne.mceTime == '00:00:08'}">
	<option value="00:00:00">00:00:00</option>
	<option value="11:11:11">11:11:11</option>
	</c:if>
	<c:if test="${devmOne.mceTime == '00:00:00' }">
	<option value="22:22:22">22:22:22</option>
	<option value="11:11:11">11:11:11</option>
	</c:if>
	<c:if test="${devmOne.mceTime == '11:11:11' }">
	<option value="00:00:08">00:00:08</option>
	<option value="11:11:11">11:11:11</option>
	</c:if>
	</select>
	<input id="subbutton" type="submit" value="提交" onClick="doChange();"/>
	</form>
	
	
</body>
</html>
