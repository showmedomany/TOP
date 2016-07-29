<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "setting.jsp" %>

<html>
	<head>
		<link href = "${css}vt_writeFormStyle.css" rel = "stylesheet" type = "text/css">
	</head>
	<body>
		<form method = "post" name = "writeForm" action = "writePro.do">
			<input type = "hidden" name = "num" value = "${num }">
			<input type = "hidden" name = "ref" value = "${ref }">
			<input type = "hidden" name = "re_step" value ="${re_step }">
			<input type = "hidden" name = "re_level" value = "${re_level }">
			<input type = "hidden" name = "pageNum" value = "${pageNum }">
				<div class = "vt_writeForm_info">
												글 쓰 기
				</div>
				<div class="vt_writeForm_Frame">
					<div class = "vt_writeForm_top_line"></div>
						<table class = "vt_writeForm_table">
							<!--  
							<tr>
								<th colspan = "2" align = "right">
									<a href = "list.do">글목록</a>
								</th>
							</tr>
							-->
							<tr>
								<th> 닉네임</th>
								<td>
									<input class = "input" type = "text" name = "writer" maxlength = "50">
								</td>
							</tr>
							<tr>
								<th> 이메일 </th>
								<td>
									<input class = "input" type = "text" name = "email" maxlength = "50">
										
								</td>
							</tr>
							<tr>
								<th> 글제목 </th>
								<td>
									<input class = "input" type = "text" name = "subject" maxlength = "50">
										
								</td>
							</tr>
							<tr>
								<th> 글내용 </th>
								<td>
									<textarea  name = "content" 
									rows="20" cols="50" ></textarea>
								</td>
							</tr>
							<tr>
								<th> 비밀번호 </th>
								<td>
									<input class = "input" type = "password" name = "passwd"
										maxlength = "12">
								</td>
							</tr>
							<tr>
								<th colspan = "2" class = "vt_writeForm_button">
									<input class = "inputbutton" type = "submit" value = "작성">
									<input class = "inputbutton" type = "reset" value = "취소">
									<input class = "inputbutton" type = "button" value = "목록보기">
								</th>
							</tr>
					</table>
				<div class = "vt_writieForm_bottom_line"></div>
			</div>
		</form>
	</body>
</html>
















