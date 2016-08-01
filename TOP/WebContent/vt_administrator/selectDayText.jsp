<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select size="1">
	<c:forEach var="i" begin="1" end="12" step="1">
		<c:if test="${start_month==i}">
			<c:if test="${i==2}">
				<c:if test="${leapYear==true}">
					<c:set var="day" value="29"/>
				</c:if>
				<c:if test="${leapYear==false}">											
					<c:set var="day" value="28"/>
				</c:if>
			</c:if>
			<c:if test="${i==1 or i==3 or i==5 or i==7 or i==8 or i==12}">
				<c:set var="day" value="31"/>
			</c:if>
			<c:if test="${i==4 or i==6 or i==9 or i==10 or i==11 }">
				<c:set var="day" value="30"/>
			</c:if>
		</c:if>														
	</c:forEach>
	<c:forEach var="i" begin="1" end="${day}" step="1">
		<c:if test="${i==1}">			
			<option value="${i}" selected="selected">${i}일</option>			
		</c:if>
		<c:if test="${i!=1}">			
			<option value="${i}">${i}일</option>
		</c:if>
	</c:forEach>
</select>