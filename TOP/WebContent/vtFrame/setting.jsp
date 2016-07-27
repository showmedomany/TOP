<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix= "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>


<!-- 경로 -->
<c:set var = "css" value = "/TOP/vtFrame/css/"/>
<c:set var = "script" value = "/TOP/vtFrame/script/"/>
<c:set var = "images" value = "/TOP/vtFrame/images/"/>
<c:set var = "jquery" value = "/TOP/jquery-1.12.4.js"/>

<!-- 탑메뉴 문자열 -->
<c:set var = "str_hometag" value = "홈"/>
<c:set var = "str_logintag" value = "로그인"/>
<c:set var = "str_membership" value = "회원가입"/>
<c:set var = "str_logouttag" value = "로그아웃"/>




<!-- 로그인 페이지 문자열 -->
<c:set var = "str_visual" value = "Visual"/>
<c:set var = "str_top" value = "T.O.P"/>
<c:set var = "str_loginbt" value = "Login"/>
<c:set var = "str_findidentity" value = "아이디/비밀번호찾기"/>


<!-- 회원가입 문자열 -->
<c:set var = "str_vt_inputForm_info" value = "회원정보입력"/>

<c:set var = "str_vt_inputForm_path" value = "홈 > 회원가입 > 회원정보 입력"/>
<c:set var = "str_vt_inputForm_hello" value = "<p>비주얼 탑 휘트니스는 개인정보를 소중히 생각하며,회원님의 동의 없이는 공개 또는
								제3자에게 제공되지 않습니다.</p>
								<p></p>
								<p>자세한 내용은 개인정보취급방침을 확인해 주시기 바랍니다.</p>"/>
<c:set var = "str_vt_inputForm_hello_path" value = "( * ) &nbsp;필수입력사항 입니다"/>
<c:set var = "str_inputForm_id" value = "*회원아이디"/>
<c:set var = "str_inputForm_id_confirm" value = "확인"/>
<c:set var = "str_inputForm_id_info" value = "&nbsp;(영문 소문자/숫자, 4~16자)"/>
<c:set var = "str_inputForm_passwd" value = "* 비밀번호"/>
<c:set var = "str_inputForm_passwd_confirm" value = "* 비밀번호 확인"/>
<c:set var = "str_inputForm_name" value = "* 이름"/>
<c:set var = "str_inputForm_nickname" value = "* 닉네임"/>
<c:set var = "str_inputForm_adr" value = "주소"/>
<c:set var = "str_inputForm_adr_add" value = "나머지 주소"/>
<c:set var = "str_inputForm_adr_search" value = "찾기"/>
<c:set var = "str_inputForm_address_search" value="주소찾기"/>
<c:set var = "str_zipcode_num" value="우편번호"/>
<c:set var = "str_inputForm_tel" value = "전화번호"/>
<c:set var = "str_inputForm_email" value = "* 이메일"/>
<c:set var = "str_inputForm_email_send" value = "인증번호전송"/>
<c:set var = "str_inputForm_email_confirm" value = "인증번호확인"/>
<c:set var = "str_inputForm_bt_sumit" value = "회원가입"/>
<c:set var = "str_inputForm_bt_cancel" value = "취소하기"/>



<c:set var="msg_iderror" value="아이디를 입력하세요."/>
<c:set var="msg_nickerror" value="닉네임을 입력하세요."/>
<c:set var="msg_notfind" value="검색결과가 없습니다"/>



<!-- 우편번호 검색 -->
<c:set var = "str_zipCheckForm_info" value = "우편번호검색"/>
<c:set var = "str_zipCheckForm_zip_search" value = "주소찾기"/>
<c:set var = "str_zipCheckForm_zip_cancel" value = "취소"/>
<c:set var = "str_zipCheckForm_zipNum" value = "우편번호"/>
<c:set var = "str_zipCheckForm_ziparea" value = "지역"/>




