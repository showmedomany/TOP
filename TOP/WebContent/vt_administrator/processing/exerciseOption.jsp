<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<option value="">선택하세요.</option>
<c:if test="${exerciseList.size() != 0}">
<c:forEach var="i" begin="0" end="${exerciseList.size()-1}" step="1">
<option value="${exerciseList[i].exercise_id}">${exerciseList[i].name}</option>
</c:forEach>
</c:if>