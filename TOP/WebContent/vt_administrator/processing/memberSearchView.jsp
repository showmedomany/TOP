<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
<!--
.mss{
font-weight: bold;
font-size: 17px;
position: relative;
width: 110px;
}
.mss1{
font-weight: bold;
font-size: 17px;
position: relative;
width: 105px;

}
.mss2{
font-weight: bold;
font-size: 17px;
position: relative;
width: 159px;

}
.mss3{
font-weight: bold;
font-size: 17px;
position: relative;
width: 186px;

}
.mss4{
font-weight: bold;
font-size: 17px;
position: relative;
width: 158px;

}
.mss5{
font-weight: bold;
font-size: 17px;
position: relative;
width: 385px;


}
.mss6{
font-weight: bold;
font-size: 17px;
position: relative;
width: 220px;
}
.mss7{
font-weight: bold;
font-size: 17px;
position: relative;
width: 239px;
}





.mssss{
font-size: 13px;
padding-left: 34px;
position: relative;

}
.mssss1{
font-size: 13px;
padding-left: 29px;
position: relative;
}


.mssss2{
font-size: 13px;
padding-left: 48px;
position: relative;
}
.mssss3{
font-size: 13px;
padding-left: 41px;
position: relative;
}
.mssss4{
font-size: 13px;
position: relative;
padding-left: 51px;
}
.mssss5{
font-size: 13px;
padding-left: 50px;
position: relative;
}
.mssss6{
font-size: 13px;
padding-left: 59px;
position: relative;
}
.mssss7{
font-size: 13px;
position: relative;
padding-left: 44px;
}
.msgsgs{
background-color: #D5D5D5;
height: 46px;
}
.msssss{
height: 46px;
background-color:#E7E7E7;
}

-->
</style>

<table >
   <tr class="msgsgs">
      <th class="mss">ID</th>
      <th class="mss1">Name</th>
      <th class="mss2">Nickname</th>
      <th class="mss3">Phone</th>
      <th class="mss6">email</th>
   
   </tr>
   <tr class="msssss">
      <td><span class="mssss">${id}</span></td>
      <td><span class="mssss1">${name}</span></td>
      <td><span class="mssss2">${nickname}</span></td>
      <td><span class="mssss3">${phone}</span></td>
      <td><span class="mssss6">${email}</span></td>
   </tr>
</table>
<table>
   <tr class="msgsgs">
      <th class="mss4">Zipcode</th>
      <th class="mss5">Address</th>
      <th class="mss7">joinDate</th>
   </tr>
   <tr class="msssss">
      <td><span class="mssss4">${zipcode}</span></td>
      <td><span class="mssss5">${address}</span></td>
      <td><span class="mssss7">${join_date}</span></td>
   </tr>

</table>