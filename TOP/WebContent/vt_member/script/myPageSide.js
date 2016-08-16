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