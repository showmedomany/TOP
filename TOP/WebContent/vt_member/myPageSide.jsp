<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
<!--
ul#navigation {
   
    margin: 0px;
    padding: 0px;
    top: 10px;
    left: 0px;
    list-style: none;
    z-index:9999;
}

ul#navigation li {
    width: 100px;
}

ul#navigation li a {
    display: block;
    margin-left: -20px;
    width: 200px;
    height: 70px;    
    background-color: #EAEAEA;
    background-repeat:no-repeat;
    background-position:center center;
    border:1px solid #747474;
    -moz-border-radius:0px 10px 10px 0px;
    -webkit-border-bottom-right-radius: 10px;
    -webkit-border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
    border-top-right-radius: 10px;
    -moz-box-shadow: 0px 2px 3px #333;
    -webkit-box-shadow: 0px 2px 3px #333;
    box-shadow: 0px 2px 3px #333;
    

}  
ul#navigation .centerPayment a{
    background-image: url(/TOP/vt_member/images/CenterPay.png);
}
ul#navigation .fitness a      {
    background-image: url(/TOP/vt_member/images/Fitness.png);
}
ul#navigation .inbody a      {
    background-image: url(/TOP/vt_member/images/Inbody.png);
}
ul#navigation .exercise a      {
    background-image: url(/TOP/vt_member/images/ExerciseRoutine.png);
}
ul#navigation .member a   {
    background-image: url(/TOP/vt_member/images/Member.png);
}

.JQsideMenu{
	margin-top: 50px;
}
-->
</style>

<script type="text/javascript">
//<!--
$(function() {
 
 $('#navigation > li').hover(
  function () {
   $('a',$(this)).stop().animate({'marginLeft':'-2px'},150);
  },
  function () {
   $('a',$(this)).stop().animate({'marginLeft':'-20px'},150);
  }
 );
});

//-->
</script>
<div class="JQsideMenu">
	<ul id="navigation">
	   <li class="centerPayment" style="cursor: pointer;" onclick="location = 'centerPayment.do'"><a></a></li>
	   <li class="fitness" style="cursor: pointer;" onclick="location = 'fitnessInfo.do'"><a></a></li>
	   <li class="inbody" style="cursor: pointer;" onclick="location = 'inbodyInfo.do'"><a></a></li>
	   <li class="exercise" style="cursor: pointer;" onclick="location = 'exerciseRoutine.do'"><a> </a></li>
	   <li class="member" style="cursor: pointer;" onclick="location = 'memberModify.do'"><a></a></li>   
	</ul>
</div>
			