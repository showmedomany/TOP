<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>	
	<title>관리자 페이지</title>	
	</head>			
		<div id = "administrator_top" >
			<div>
				<jsp:include page="${top }.jsp" flush="false"></jsp:include>
			</div>		
		</div>
		<div id = "administrator_center">	
			<div>
				<!-- 가운데 부분만 jsp를 갈아 끼운다. -->
				<jsp:include page="${center }.jsp" flush="false"></jsp:include>
			</div>
		</div>
		<div id = "administrator_bottom">
			<div>
				<jsp:include page="/vtFrame/vt_bottomForm.jsp" flush="false"></jsp:include>
			</div>
		</div>
	</body>
</html>