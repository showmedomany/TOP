<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

var win;

function openWin(){
    win = window.open("", "_blank", "width=400, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no" );

}

function resizeToWin(){
    win.resizeTo(200,200);
    win.focus();
}

</script>

<input type=button value="openWin" onclick="openWin()">
<input type="button" value="resizeToWin" onclick="resizeToWin()" >