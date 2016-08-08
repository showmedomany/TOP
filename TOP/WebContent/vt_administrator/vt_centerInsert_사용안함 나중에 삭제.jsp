<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body class="vt_admin_centerInsertBody">
	<div class="vt_admin_centerInsertBody_main">
		<a href="centerInsert.do?choice=0">회원 피트니스 등록</a>
		 | <a href="centerInsert.do?choice=1">회원 인바디 등록</a>
		 | <a href="centerInsert.do?choice=2">회원 운동스케줄 작성</a>
		 <br>
		
		<jsp:include page="${administratorPage}.jsp" flush="false"></jsp:include>	
	</div>
</body>
