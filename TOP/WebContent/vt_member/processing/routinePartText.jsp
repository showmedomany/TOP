<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='cnt' value="0"/>
<c:set var="exeriseLength" value="${exeriselist.size()}"/>
<div class="tableInfo">	
	<table>
		<tr class="tableTr">
			<c:forEach var="i" begin="0" end="${exeriseLength-1}" step="1">
				<c:set var='exeriseData' value="${exeriselist.get(i)}"/>
				<td>
					<input type="checkbox">
				</td>
			</c:forEach>		
		</tr>
		<tr class="tableTr">
			<c:forEach var="i" begin="0" end="${exeriseLength-1}" step="1">
				<c:set var='exeriseData' value="${exeriselist.get(i)}"/>
				<c:if test="${exeriseData.ex_part_id == partId}">					
					<td>
						<span onclick="exeriseInfo(${cnt})">${exeriseData.name}</span>						
						<c:set var='cnt' value="${cnt+1}"/>
					</td>				
				</c:if>
			</c:forEach>
		</tr>
	</table>
</div>