<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='method1' value='${fn:split( exeriseInfoData.method1, "^" )}'/>	
<c:forEach var='i' begin='0' end='${fn:length( method1)-1 }' step='1'>
	${method1[i]}<br>
</c:forEach>
<c:set var='method2' value='${fn:split( exeriseInfoData.method2, "^" )}'/>	
<c:forEach var='i' begin='0' end='${fn:length( method1)-1 }' step='1'>
	${method2[i]}<br>
</c:forEach>
<c:set var='method3' value='${fn:split( exeriseInfoData.method3, "^" )}'/>
<c:forEach var='i' begin='0' end='${fn:length( method1)-1 }' step='1'>
	${method3[i]}<br>
</c:forEach>
<c:set var='method4' value='${fn:split( exeriseInfoData.method4, "^" )}'/>
<c:forEach var='i' begin='0' end='${fn:length( method1)-1 }' step='1'>
	${method4[i]}<br>
</c:forEach>