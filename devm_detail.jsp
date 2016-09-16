<%@page import="com.entity.DEVM"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<%
	DEVM devm11 = new DEVM("0x000001", "00:03:09", "00:10:00", "00:13:09");
	DEVM devm12 = new DEVM("0x000002", "03:03:09", "00:00:00", "03:03:09");
	DEVM devm21 = new DEVM("0x000001", "00:02:00", "00:00:00", "00:02:00");
	DEVM devm22 = new DEVM("0x000002", "03:00:00", "00:00:00", "03:00:00");
	List<DEVM> list = new ArrayList<DEVM>();
	List<DEVM> list2 = new ArrayList<DEVM>();
	list.add(devm11);
	list.add(devm12);
	list2.add(devm21);
	list2.add(devm22);
	request.setAttribute("list", list);
	request.setAttribute("list2", list2);
%>

</head>
<body>


	<table>
		<thead>
			<tr>
				<td>序号</td>
				<td>模块ID</td>
				<td>基线版本用时</td>
				<td>当前版本用时</td>
			</tr>
		</thead>
		<tbody id="maindata">
			<c:forEach items="${requestScope.list}" var="dEVM" varStatus="status">
			
				<tr class="controHid">
					<td>${status.index+1 }</td>
					<td>${dEVM.devmModel }</td>
					<td>${dEVM.allTime }</td>
					<c:forEach items="${requestScope.list2 }" var="dEVM2">
						<c:if test="${dEVM2.devmModel == dEVM.devmModel }">
							<td>${dEVM2.allTime }</td>
						</c:if>
					</c:forEach>
				</tr>
				
				<tr class="hid" style="display: none">
				
					<td></td>
					<td>模块生成</td>
					<td>${dEVM.rmoTime}</td>
					<c:forEach items="${requestScope.list2 }" var="dEVM2">
						<c:if test="${dEVM2.devmModel == dEVM.devmModel }">
							<td>${dEVM2.rmoTime }</td>
						</c:if>
					</c:forEach>
				</tr>

				<tr class="hid" style="display: none">
					<td></td>
					<td>模块结束</td>
					<td>${dEVM.mceTime}</td>
					<c:forEach items="${requestScope.list2 }" var="dEVM2">
						<c:if test="${dEVM2.devmModel == dEVM.devmModel }">
							<td>${dEVM2.mceTime }</td>
						</c:if>
					</c:forEach>
				</tr>
				
			</c:forEach>
		</tbody>
	</table>


	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
// 		$(document).ready(function() {
// 			 var len = $("#maindata tr").length/3;
// 			for(var i=0;i<len;i++){
// 					$(".controHid_"+i).click(function() {
// 				        $(".hid_"+i).toggle();
// 				    });
// 			}  
// 		});

  $(function(){
        $(".controHid").each(function(){
            $(this).click(function(){
                $(this).nextUntil(".controHid").toggle(); 
                
            });
        });
  })    

	</script>
</body>
</html>
