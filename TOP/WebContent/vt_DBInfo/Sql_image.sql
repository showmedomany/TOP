
/* Drop Tables */

DROP TABLE address CASCADE CONSTRAINTS;
DROP TABLE vt_comment CASCADE CONSTRAINTS;
DROP TABLE vt_board CASCADE CONSTRAINTS;
DROP TABLE vt_notice_board CASCADE CONSTRAINTS;
DROP TABLE vt_register CASCADE CONSTRAINTS;
DROP TABLE vt_member_routine CASCADE CONSTRAINTS;
DROP TABLE vt_routine_info CASCADE CONSTRAINTS;
DROP TABLE vt_members CASCADE CONSTRAINTS;
DROP TABLE vt_authority CASCADE CONSTRAINTS;
DROP TABLE vt_exercise CASCADE CONSTRAINTS;
DROP TABLE vt_ex_part CASCADE CONSTRAINTS;
DROP TABLE vt_faq CASCADE CONSTRAINTS;
DROP TABLE vt_trainer CASCADE CONSTRAINTS;
DROP TABLE vt_chatting CASCADE CONSTRAINTS;
DROP TABLE vt_request CASCADE CONSTRAINTS;
DROP SEQUENCE vt_register_seq;
DROP SEQUENCE vt_board_seq;
DROP SEQUENCE vt_notice_board_seq;
DROP SEQUENCE vt_chatting_seq;
DROP SEQUENCE vt_comment_seq;
DROP SEQUENCE vt_inbody_seq;
DROP SEQUENCE vt_faq_sql;
DROP SEQUENCE vt_exercise_seq;
DROP SEQUENCE vt_routine_info_seq;
DROP SEQUENCE VT_MEMBER_ROUTINE_MR_ID_SEQ;
/* vt_member_routine */
CREATE SEQUENCE vt_routine_info_seq
START WITH 1
MAXVALUE 999999999999
MINVALUE 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
CREATE SEQUENCE VT_MEMBER_ROUTINE_MR_ID_SEQ
START WITH 1
MAXVALUE 999999999999
MINVALUE 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
/*vt_exercise_seq*/
CREATE SEQUENCE vt_exercise_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 999999999999
MINVALUE 1
NOCYCLE
NOCACHE;
/*vt_board_seq*/
CREATE SEQUENCE vt_board_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 999999999999
MINVALUE 1
NOCYCLE
NOCACHE;
/*vt_nt_board_seq*/
CREATE SEQUENCE vt_notice_board_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 999999999999
MINVALUE 1
NOCYCLE
NOCACHE;
/*vt_register*/
CREATE SEQUENCE vt_register_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 999999999999
MINVALUE 1
NOCYCLE
NOCACHE;
/*vt_inbody*/
CREATE SEQUENCE vt_inbody_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 999999999999
MINVALUE 1
NOCYCLE
NOCACHE;
/*vt_faq_sql*/
CREATE SEQUENCE vt_faq_sql
START WITH 1
INCREMENT BY 1
MAXVALUE 999999999999
MINVALUE 1
NOCYCLE
NOCACHE;
/*vt_chatting_seq*/
CREATE SEQUENCE vt_chatting_seq
START WITH 1
MAXVALUE 999999999999
MINVALUE 1
INCREMENT BY 1
CYCLE;
/*vt_comment_seq*/
CREATE SEQUENCE vt_comment_seq
START WITH 1
MAXVALUE 999999999999
MINVALUE 1
INCREMENT BY 1
/* Create Tables */
CREATE TABLE address
(
   zipcode varchar2(7),
   area1 varchar2(10),
   area2 varchar2(20),
   area3 varchar2(70),
   area4 varchar2(20)
);
CREATE TABLE vt_authority
(
   authority_id number NOT NULL,
   authority varchar2(13) NOT NULL UNIQUE,
   PRIMARY KEY (authority_id)
);
insert into vt_authority values(1, 'administrator'); 
insert into vt_authority values(2, 'member');
CREATE TABLE vt_board
(
   num number NOT NULL,
   id varchar2(15) NOT NULL,
   nickname varchar2(30) NOT NULL,
   subject varchar2(50) NOT NULL,
   readcount number NOT NULL,
   reg_date date NOT NULL,
   content varchar2(4000) NOT NULL,
   PRIMARY KEY (num)
);
CREATE TABLE vt_request
(
   ip varchar2(15) NOT NULL,
   id varchar2(20) NOT NULL,
   response number NOT NULL,
   PRIMARY KEY (ip)
);
CREATE TABLE vt_chatting
(
   num number NOT NULL,
   ip varchar2(15) NOT NULL,
   content varchar2(4000) NOT NULL,
   id varchar2(20) NOT NULL,   
   PRIMARY KEY (num)
);
CREATE TABLE vt_comment(
   comment_id number NOT NULL,
   num number NOT NULL,
   nick varchar2(30) NOT NULL,
   content varchar2(2000) NOT NULL,
   reg_date date NOT NULL,
   PRIMARY KEY (comment_id)
);
CREATE TABLE vt_exercise
(
   exercise_id number NOT NULL,
   ex_part_id number NOT NULL,
   name varchar2(50) NOT NULL, 
   machine varchar2(50) NOT NULL,
   method1 varchar2(4000) NOT NULL,
   method2 varchar2(4000) NOT NULL,
   method3 varchar2(4000) NOT NULL,
   method4 varchar2(4000) NOT NULL,
   PRIMARY KEY (exercise_id)
);
insert into vt_exercise values(vt_exercise_seq.nextval, 1, '벤치프레스', '바벨',
'<h2>벤치 프레스</h2>
<img src="/TOP/vt_DBInfo/images/Chest/벤치 프레스/벤치 프레스1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/벤치 프레스/벤치 프레스2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/벤치 프레스/벤치 프레스3.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/벤치 프레스/벤치 프레스4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
1. 벤치에 등을 대고 눕는다. 
2. 바닥에 내려놓은 양발은 어께너비로 벌리고 무릎을 직각으로 구부린다. 
3. 팔을 어께너비보다 약간 넓게 벌리고 오버그립하여 바를 지면과 평행을 이루도록하여 팔을 펴고 잡는다.
',
'* 운동 방법 *
1. 팔을 구부리면서 바가 흉골 가운데 위치하도록 바벨을 내리며 호흡을 들이마신다.
2. 팔을 위로 펴면서 바벨을 올리며 호흡을 내쉰다.
3. 같은 동작으로 12~15회 반복한다.',
'* Tip * 
1. 운동을 할때 팔꿈치는 수직으로 이동하며 손보다 아래에 위체한다.
2. 발이 바닥에 잘 닿지 않거나 요추 부위가 과도하게 안으로 휘어 있는 경우에는 발을 들고 한다. 이 때 발을 꼬아서는 안된다. 
3. 골반은 벤치에 붙이고 움직이지 않는다.
4. 바벨을 내릴 때 머리가 들리지 않도록 유의한다.
5. 바벨을 든 손과 손사이의 간격을 다양하게 할수 있다. 간격이 좁아지면 안쪽 흉근과 삼두근에 가해지는 자극이 더욱 강렬해진다. 
      간격을 넓히면 근육의 바깥쪽이 자극된다.',
'* 주의 *
바벨을 흉곽에 튕기는 식으로 운동하면 안된다. 갈비뼈가 골절되거나 금이 갈수 있다.
<br><br>
<img src="/TOP/vt_DBInfo/images/Chest/벤치 프레스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/벤치 프레스/운동부위2.jpg">');
insert into vt_exercise values(vt_exercise_seq.nextval, 1, '벤치 덤벨 프레스', '덤벨', 
'<h2>벤치 덤벨 프레스</h2>
<img src="/TOP/vt_DBInfo/images/Chest/벤치 덤벨 프레스/벤치 덤벨 프레스1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/벤치 덤벨 프레스/벤치 덤벨 프레스2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/벤치 덤벨 프레스/벤치 덤벨 프레스3.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/벤치 덤벨 프레스/벤치 덤벨 프레스4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
1. 대흉근 전체 가동 범위에서 동작이 이루어지기 때문에 가슴을 모아주는 중앙 부위와 바깥쪽 근육의 크기를 키우는 데 효과적이다. 
2. 덤벨을 들었을 때 균형을 유지하기 위한 근육들을 함께 발달시킬 수 있는 장점이 있어 강하고 안정된 상체를 만들 수 있다.
',
'* 운동 방법 *
1. 벤치에 앉아 팔을 가슴 옆에 붙이고 덤벨을 든다.
2. 벤치에 누워 가슴 중앙 부분과 수직이 되게 덤벨을 위치시키면서 팔꿈치를 살짝 구부린다.
3. 가슴이 양옆으로 늘어나는 느낌을 느끼면서 덤벨이 가슴과 평행이 될 때까지 당긴다.
4. 겨드랑이에 힘을 주면서 가슴을 모아주는 느낌으로 덤벨을 밀어 올린다.',
'* Tip * 
1. 덤벨을 밀어 올리는 동작에서 양손이 벌어지게 않게 살짝 모아줌으로써 대흉근의 수축을 최대화한다.
2. 덤벨을 밀어 올릴 때 팔은 모아주되, 덤벨이 부딪히지 않도록 유의한다.
3. 팔로만 미는 경우엔 가슴근육의 발달이 이루어지지 않는다.
4. 덤벨을 당기고 밀어 올릴 때 전완이 양옆으로 벌어지지 않고 수직을 유지하도록 한다.',
'* 주의 *
덤벨을 내리면서 어깨가 등 뒤로 과도하게 젖혀지면 어깨 주변 근육의 부상 위험이 커질 수 있다.
벤치에 누울 때는 엉덩이, 허리, 등, 어깨가 순서대로 닿을 수 있도록 한다.
<img src="/TOP/vt_DBInfo/images/Chest/벤치 덤벨 프레스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/벤치 덤벨 프레스/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 1, '인클라인 프레스', '바벨', 
'<h2>인클라인 프레스</h2>
<img src="/TOP/vt_DBInfo/images/Chest/인클라인 프레스/인클라인 프레스1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/인클라인 프레스/인클라인 프레스2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/인클라인 프레스/인클라인 프레스3.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/인클라인 프레스/인클라인 프레스4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
대흉근의 상부 근육 발달을 목적으로 하는 운동이다.
인클라인 벤치 각도가 커질수록 어깨 근육 중 특히 전면 삼각근이
더 많이 동원되기 때문에 대흉근 상부를 집중하여 발달시키기 위해서는 벤치 각도를 
30~40도로 유지하는 것이 중요하다.',
'* 운동 방법 *
1. 벤치에 누워 엉덩이와 견갑골을 등받이에 최대한 붙이고 허리는 아치형을 만들어준다.
2. 어깨너비 두 배로 바를 잡고 바벨을 든다.바벨을 들어 쇄골 아랫부분과 수직이 되게
    바를 위치시키면서 팔꿈치를 살짝 구부린다.
3. 손목은 꺾이지 않도록 주의하면서 가슴과 바가 자석처럼 서로 만나는 느낌으로 바벨을 
    쇄골 아랫부분과 약간 떨어진 정도까지 당긴다.
4.겨드랑이에 힘을 주는 느낌으로 바벨을 밀어 올린다.',
'* Tip * 
1. 손목이 지나치게 꺾이지 않도록 한다.
2. 바를 잡을 때는 손바닥 아래쪽으로 더 가깝게 잡도록 한다.
3. 운동 중 팔꿈치를 완전히 펴지 않고 대흉근의 긴장을 유지한다.
4. 어깨 관절의 참여도를 줄이기 위해 플랫 벤치 프레스보다는 약간 좁은 그립을 사용한다.',
'* 주의 *
지나치게 손목을 젖혀서 바를 잡을 경우 손목에 부상을 초래할 수 있으므로 주의한다.
무거운 중량을 가슴 부위로 지나치게 내리는 경우 어깨 관련 근육의 부상과 회전근개 손상이 
발생할 수 있으므로 주의한다.
<img src="/TOP/vt_DBInfo/images/Chest/인클라인 프레스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/인클라인 프레스/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 1, '인클라인 덤벨 프레스', '덤벨',
'<h2>인클라인 덤벨 프레스<h2>
<img src="/TOP/vt_DBInfo/images/Chest/인클라인 덤벨 프레스/인클라인 덤벨 프레스1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/인클라인 덤벨 프레스/인클라인 덤벨 프레스2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/인클라인 덤벨 프레스/인클라인 덤벨 프레스3.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/인클라인 덤벨 프레스/인클라인 덤벨 프레스4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
대흉근의 상부 근육 발달을 목적으로 하는 운동이다.
인클라인 벤치 각도가 커질수록 어깨 근육 중 특히 전면 삼각근이
더 많이 동원되기 때문에 대흉근 상부를 집중하여 발달시키기 위해서는 벤치 각도를 
30~40도로 유지하는 것이 중요하다.',
'* 운동 방법 *
1. 벤치에 누워 쇄골 아랫부분과 수직이 되게 덤벨을 위치시키면서 팔꿈치를 살짝 구부려 고정시킨다.
2. 가슴 양옆으로 늘어나는 느낌을 느끼면서 덤벨이 가슴과 평행이 될 때까지 당긴다.
3. 겨드랑이에 힘을 주면서 모아주는 느낌으로 덤벨을 밀어 올린다.',
'* Tip * 
덤벨을 들어올리는 동작에서 양손이 벌어지게 않게 살짝 모아줌으로써 대흉근의 수축을 최대화한다.
덤벨을 밀어 올릴 때 팔은 모아주되, 덤벨이 부딪히지 않도록 유의한다.
덤벨을 당기고 밀어 올릴 때 전완이 양옆으로 벌어지지 않고 수직을 유지하도록 한다.',
'* 주의 *
덤벨을 내리면서 팔꿈치가 등 뒤쪽으로 과도하게 젖혀지면 어깨 주변 근육의 부상 위험이 커질 수 있으므로 주의한다.
빠르게 운동을 할 경우 자칫 균형을 잃어 상해를 입을 수 있으므로 천천히 동작을 실시하도록 한다.
<img src="/TOP/vt_DBInfo/images/Chest/인클라인 덤벨 프레스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/인클라인 덤벨 프레스/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 1, '디클라인 프레스', '바벨',
'<h2>디클라인 프레스</h2>
<img src="/TOP/vt_DBInfo/images/Chest/디클라인 프레스/디클라인 프레스1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/디클라인 프레스/디클라인 프레스2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/디클라인 프레스/디클라인 프레스3.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/디클라인 프레스/디클라인 프레스4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
벤치 프레스, 인클라인 벤치 프레스와 더불어 실시하는 운동으로 
대흉근의 아랫부분을 발달시켜 보다 완성도 높은 대흉근의 모양을 만들어준다. 
벤치의 각도는 30~45도가 적당하다.',
'* 운동 방법 *
1. 경사진 벤치 발걸이에 두 발을 걸치고 눈과 바벨이 수직이 되도록 눕는다.견갑골과 엉덩이를 
     최대한 붙이고 허리는 10cm가량 아치형을 만든다.
2. 어깨너비 두 배 정도로 바를 잡고 바벨을 들어 가슴과 수직이 되도록 위치시킨다.
3. 손목은 꺾이지 않도록 주의하면서 바벨을 가슴 바로 위까지 당긴다.
4. 겨드랑이에 힘을 준다는 느낌으로 바벨을 밀어 올린다.',
'* Tip * 
손목이 뒤로 꺾이지 않도록 손목을 고정시킨다.
바벨을 밀어 올릴 때 팔꿈치를 완전히 펴지지 않도록 하여 대흉근의 긴장을 유지한다.',
'* 주의 *
정상 혈압 범위를 벗어난 경우에는 절대적으로 삼가하도록 한다.
<img src="/TOP/vt_DBInfo/images/Chest/디클라인 프레스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/디클라인 프레스/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 1, '디클라인 덤벨 프레스', '덤벨',
'<h2>디클라인 덤벨 프레스</h2>
<img src="/TOP/vt_DBInfo/images/Chest/디클라인 덤벨 프레스/디클라인 덤벨 프레스1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/디클라인 덤벨 프레스/디클라인 덤벨 프레스2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/디클라인 덤벨 프레스/디클라인 덤벨 프레스3.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/디클라인 덤벨 프레스/디클라인 덤벨 프레스4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
대흉근의 아랫부분을 발달시킴으로써 보다 완성도 높은 대흉근의 모양을 만들어준다. 
덤벨을 이용하기 때문에 바벨로 하는 디클라인 벤치 프레스보다 더 많은 균형을 요구한다.
 벤치의 각도는 30~45도가 적당하다.',
'* 운동 방법 *
1. 경사진 벤치 발걸이에 두 발을 걸치고 덤벨을 가슴 옆에 붙인다.
2. 벤치에 누워 어깨너비만큼 팔을 벌리고 덤벨이 가슴과 수직이 되도록 한다.
3. 엉덩이와 견갑골을 벤치에 최대한 붙이고 허리는 10cm가량 아치형을 만든다.
4. 가슴이 양옆으로 스트레칭되는 느낌을 가지면서 덤벨이 가슴과 수평이 될 때까지 당긴다.
5. 겨드랑이에 힘을 준 상태에서 가슴을 모아주는 느낌으로 덤벨을 밀어 올린다.',
'* Tip * 
덤벨을 밀어 올릴 때 덤벨이 서로 부딪히지 않도록 유의하면서 덤벨을 모아 올린다.
덤벨을 내리고 올릴 때 전완이 양옆으로 벌어지지 않고 수직을 유지하도록 한다.',
'* 주의 *
정상 혈압 범위를 벗어난 경우에는 절대적으로 삼가 하도록 한다.
<img src="/TOP/vt_DBInfo/images/Chest/디클라인 덤벨 프레스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/디클라인 덤벨 프레스/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 1, '딥스', '평행바',
'<h2>딥스</h2>
<img src="/TOP/vt_DBInfo/images/Chest/딥스/딥스1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/딥스/딥스2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/딥스/딥스3.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/딥스/딥스4.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
1. 평행으로 된 바 위에 두 손을 짚고 올라선다.
2. 무릎을 구부리고 엉덩이를 뒤로 살짝 빼면서 중심을 잡는다.',
'* 운동 방법 *
1. 가슴을 바닥 쪽으로 숙이면서 팔꿈치가 90도가 될 때까지 저항을 느끼며 몸을 내린다. 
2. 가슴 하부가 스트레칭되는 느낌으로 다시 원위치한다.',
'* Tip * 
1. 평행 바의 간격을 50~60cm정도가 적당하다. 이보다 좁거나 넓으면 운동 범위가 줄어들어 
   효과가 떨어지며, 팔꿈치와 어께를 다칠 수 있다. 
2. 트레이닝 목적에 따라 몸통을 앞으로 굽힐수록 대흉근이 좀 더 발달하고, 몸통을 세우면
   삼두근 중심으로 운동이 된다.
3. 초보자의 경우 어께 운동 범위가 과도하지 않도록 보조자를 두고 운동할 수 있도록 한다.',
'* 주의 *
1. 어께가 유연하지 않거나 어께를 지나치게 많이 내리면 근육과 인대의 손상 위험성이 
   커질수 있으므로 반드시 스트레칭을 먼저 실시 하도록 한다. 
<img src="/TOP/vt_DBInfo/images/Chest/딥스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/딥스/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 1, '덤벨 풀 오버', '덤벨',
'<h2>덤벨 풀 오버</h2>
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 풀 오버/덤벨 풀 오버1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 풀 오버/덤벨 풀 오버2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 풀 오버/덤벨 풀 오버3.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 풀 오버/덤벨 풀 오버4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
대흉근을 전체적으로 발달시키고, 보조적으로 전거근과 상완삼두근, 광배근까지 동원되어 전반적인 상체의 근육을 발달시키는 운동이다. 
비교적 짧은 시간 동안에 상체 전반을 키우는 데 아주 효과적이다.',
'* 운동 방법 *
1. 벤치에 앉아 두 손으로 덤벨을 포개어 든다.
2. 벤치에 누워 덤벨을 가슴과 수직이 되게 위치시킨다.견갑골과 엉덩이를 최대한 붙이고 허리는 10cm가량 아치형을 만든다.
3. 팔꿈치를 바깥쪽으로 살짝 구부려 고정시킨 후 머리 위쪽으로 포물선을 그리면서 양팔이 귀 옆에 오는 지점까지 덤벨을 내린다.
4. 가슴 쪽으로 포물선을 그리면서 덤벨을 올린다.',
'* Tip *
팔은 가능한 곧게 편 자세를 유지하고, 팔꿈치 관절은 일정한 각도를 유지한다.
두 팔을 벌리지 말고 쭉 펴면서 실시한다.
머리 위로 올리는 과정에서 팔꿈치가 지나치게 구부러지거나 바깥 방향으로 팔꿈치가 벌어지지 않도록 한다.
바벨 또는 이지바를 이용하여 운동할 수도 있다.',
'* 주의 *
목 주변 근육의 안정성이 확보된 상태에서 실시하도록 한다.
팔꿈치를 고정하지 않고 벌리게 되는 잘못된 자세가 동반될 경우, 팔꿈치 안쪽 인대 손상 위험이 있다.
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 풀 오버/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 풀 오버/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 풀 오버/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 1, '덤벨 플라이', '덤벨',
'<h2>덤벨 플라이</h2>
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 플라이/덤벨 플라이1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 플라이/덤벨 플라이2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 플라이/덤벨 플라이3.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 플라이/덤벨 플라이4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
대흉근 운동의 마무리 동작으로 많이 사용된다.
남성들의 가슴 안쪽 라인을 발달시키는 데 필수적인 운동으로 추천된다.^ 
정확한 동작으로 집중적으로 실시하는 것이 중요하다.',
'* 운동 방법 *
1. 벤치에 앉아 팔을 가슴 옆에 붙이고 덤벨을 든다.
2. 벤치에 누워 가슴 중앙과 덤벨이 수직이 되도록 위치시키고 팔꿈치를 살짝 구부려 고정시킨다.
3. 어깨관절만을 사용해 반원을 그리며 가슴이 늘어나는 느낌으로 가슴과 평행이 될 때까지 덤벨을
   당긴다.
4. 겨드랑이에 힘을 준 상태에서 안아주듯이 반원을 그리며 덤벨을 밀어 올린다.',
'* Tip * 
두 손의 그립은 몸쪽을 향하도록 한다.
팔꿈치의 각도가 너무 굽혀져서도 너무 펴져서도 안 된다.
덤벨을 어깨 밑으로 너무 내리지 않도록 한다.
덤벨을 들어올리는 동작에서 양손이 벌어지게 않게 살짝 모아줌으로써 대흉근의 수축을 최대화한다.
덤벨 플라이 운동을 진행할 때는 "자세와 무게"에 특히 신경을 쓰면서 진행하는 것이 좋습니다. 1개의
관절만을 이용하는 운동이므로, 너무 무거운 무게는 오히려 관절에 부담이 되고 해당
부위에 자극을 주기가 쉽지 않으므로 자신에게 맞는 무게를 선정하여 바른자세로 진행하는것이
좋습니다. 또한 너무 빠른동작으로 진행하는것보다 천천히 진행하는 것이 효과적인 운동이 될 수 있습니다.',
'* 주의 *
덤벨이 어깨 밑으로 지나치게 내려갈 경우 어깨 주변 근육의 상해를 유발할 수 있다.
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 플라이/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/덤벨 플라이/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 1, '체스트 프레스', '머신',
'<h2>체스트 프레스(머신)</h2>
<img src="/TOP/vt_DBInfo/images/Chest/체스트 프레스/체스트 프레스1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/체스트 프레스/체스트 프레스2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/체스트 프레스/체스트 프레스3.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/체스트 프레스/체스트 프레스4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
초보자에게 적합한 운동법이다. 바벨 벤치 프레스보다 더 쉽게 실시할 수 있으며 
운동 시 부상 위험이 적은 장점이 있다. 자세를 교정하는 데 효과적이고 중급 프로그램으로
운동을 바꾸기 전 대흉근의 긴장감을 미리 느껴보는 연습을 하기에 최적의 운동이다.',
'* 운동 방법 *
1. 벤치에 앉아 엉덩이와 견갑골을 등받이에 최대한 붙인다. 허리는 10cm가량 아치형을 만들어준다
2. 바와 팔꿈치, 손이 가슴 중앙과 수평이 되도록 의자를 조절한다.바와 전완이 수직이 되는 곳에 손을 
   위치시킨다.
3. 발걸이와 바를 동시에 밀어 팔꿈치가 펴진 상태에서 발을 발걸이에서 내려놓는다
4. 가슴을 턱 쪽으로 끌어올리면서 바가 가슴과 나란하게 될 때까지 당긴다.
5. 겨드랑이에 힘을 준다는 느낌으로 바를 앞으로 밀어준다.',
'* Tip * 
가슴으로 당기고 미는 동작에서 가급적 느리게 일정한 속도로 운동을 할 때 대흉근에 자극을 
효과적으로 전달할 수 있다.
운동 중 팔꿈치를 완전히 펴지 않고 대흉근의 긴장을 유지한다.',
'* 주의 *
중량을 들어올릴 때 손목이 엄지손가락 쪽으로 지나치게 꺾이지 않도록 팔꿈치를 완전히 펴지 않는다.
어깨 상해 위험을 최소화하기 위해 전완이 바와 수직이 이루는 동선이 일정하게 유지되도록 한다.
<img src="/TOP/vt_DBInfo/images/Chest/체스트 프레스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/체스트 프레스/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 1, '케이블 크로스 오버', '케이블 머신',
'<h2>케이블 크로스 오버</h2>
<img src="/TOP/vt_DBInfo/images/Chest/케이블 크로스 오버/케이블 크로스 오버1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/케이블 크로스 오버/케이블 크로스 오버2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/케이블 크로스 오버/케이블 크로스 오버3.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/케이블 크로스 오버/케이블 크로스 오버4.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
대흉근 중앙부와 하부 흉근 부분을 발달시키는 운동이다.
대흉근 중앙부의 선명도를 증가시키고, 각도에 따라 상부, 중부, 하부 운동으로 세분화하여 실시할 수 있다.
또한 동작 내내 지속적인 케이블의 저항이 유지되는 장점이 있다.',
'* 운동 방법 *
1. 케이블의 양쪽 손잡이를 잡고 기구 중앙에 서서 엉덩이 너비만큼 발을 벌린다.
2. 무릎을 약간 굽히고 상체를 앞으로 살짝 숙여 중심을 잡은 다음 최대한 팔을 벌린다.
3. 겨드랑이에 힘을 주고 가슴 안쪽이 모아지게 하면서 안아주는 느낌으로 손잡이를 당긴다.
4. 가슴근육이 스트레칭되는 느낌을 느끼며 다시 서서히 팔을 벌리며 원위치한다.',
'* Tip *
양손이 교차하는 범위까지 운동 가동 범위를 넓히면 더욱 많은 자극을 느낄 수 있다.
한 발을 앞으로 내밀고 서면 균형을 잡기가 쉽다.',
'* 주의 *
어깨를 과도하게 뒤로 넘긴 상태에서 무거운 무게로 운동할 경우 어깨 앞쪽 관절낭 파열을 야기시킬 수 있기 때문에 주의해야 한다.
<img src="/TOP/vt_DBInfo/images/Chest/케이블 크로스 오버/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/케이블 크로스 오버/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 1, '니 푸쉬업', '맨몸운동',
'<h2>니 푸쉬업</h2>
<img src="/TOP/vt_DBInfo/images/Chest/니 푸쉬업/니 푸쉬업1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/니 푸쉬업/니 푸쉬업2.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/니 푸쉬업/니 푸쉬업3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
여성들이 집에서도 쉽게 할 수 있는 운동이다.
여성 운동 초보자가 안전하면서도 효과적으로 상체 균형 조절능력과 협응능력을 향상시킬 수 있도록 도와준다.',
'* 운동 방법 *
1. 무릎을 대고 엎드린 자세에서 양손을 어깨너비 두 배로 벌리고 발을 꼬아준다.
2. 두 팔을 곧게 펴고 허리를 아치형으로 만들면서 가슴에 긴장을 준다.
3. 팔꿈치가 90도가 되도록 몸을 내린다.
4. 겨드랑이에 힘을 주고 가슴을 모아주는 느낌으로 팔꿈치를 밀어주면서 몸을 위로 올린다.',
'* Tip *
어깨너비보다 약간 좁게 실시하면 상완삼두근의 발달에 효과적일 뿐 아니라 가슴근육에 다른 자극을 줄 수 있다.
다리를 벤치 위에 올려놓고 실시하면 부하를 증대시켜 가슴 상부를 더욱 효과적으로 발달시킬 수 있다.',
'* 주의 *
어깨너비보다 좀 더 넓게 손을 짚고 팔꿈치가 바깥 방향을 향하도록 내려간다.
<img src="/TOP/vt_DBInfo/images/Chest/니 푸쉬업/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Chest/니 푸쉬업/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 2, '데드 리프트', '바벨',
'<h2>데드 리프트</h2>
<img src="/TOP/vt_DBInfo/images/Back/데드 리프트/데드 리프트1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/데드 리프트/데드 리프트2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/데드 리프트/데드 리프트3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
둔근, 대퇴 후면 근육 등 전신 근육 발달에 중요한 영향을 끼치는 운동이다. 신체의 파워를 기를 수 있고, 
몸통을 둘러싸고 있는 근육들의 근력을 전반적으로 향상시킬 수 있는 운동이다.',
'* 운동 방법 *
1. 어깨너비보다 약간 넓게 다리를 벌리고 서서 어깨너비로 바벨을 잡는다.허리를 똑바로 세워 차렷 자세를 취하듯 가슴을 내밀고 엉덩이를 뒤로 치켜든다.
2. 무릎을 살짝 구부리면서 바벨을 정강이까지 내린 다음 앞으로 숙이면서 복부와 등을 긴장시킨다.
3. 다시 등으로 끌어당기는 느낌으로 바벨을 들어올리면서 원위치해서 일어선다.',
'* Tip * 
고관절을 중심으로 상하체의 힘이 적절히 조화될 수 있도록 한다.',
'* 주의 *
무릎 각을 유지한다.
요추의 정상적인 만곡을 유지한다.
<img src="/TOP/vt_DBInfo/images/Back/데드 리프트/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/데드 리프트/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/데드 리프트/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 2, '덤벨 데드 리프트', '덤벨',
'<h2>덤벨 데드 리프트</h2>
<img src="/TOP/vt_DBInfo/images/Back/덤벨 데드 리프트/덤벨 데드 리프트1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/덤벨 데드 리프트/덤벨 데드 리프트2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/덤벨 데드 리프트/덤벨 데드 리프트3.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
둔근, 대퇴 후면 근육 등 전신 근육 발달에 중요한 영향을 끼치는 운동이다.
신체의 파워를 기를 수 있고, 몸통을 둘러싸고 있는 근육들의 근력을 전반적으로 향상시킬 수 있는 운동이다. 
바벨 데드리프트에 비해 무거운 중량을 들기는 힘들지만 밸런스를 위한 협응성을 기를 수 있다.
특히 무거운 중량의 바벨을 사용하기 어려운 여성들에게 권장되는 운동이다.',
'* 운동 방법 *
1. 어깨너비보다 정도로 덤벨을 잡는다.허리를 똑바로 세워 차렷 자세를 취하듯 가슴을 내밀고 엉덩이를 뒤로 치켜든다.
2. 무릎을 굽히고 허리를 앞으로 숙이면서 덤벨을 내린다.이때 복부와 등을 긴장시킨다.
3. 다시 등으로 끌어당기는 느낌으로 원위치하면서 일어선다.',
'* Tip *
고관절을 중심으로 상하체의 힘이 적절히 조화될 수 있도록 한다.',
'* 주의 *
요추의 정상적인 만곡을 유지한다.
덤벨을 잡은 손이 대퇴부 전면을 따라 움직일 수 있도록 한다.
<img src="/TOP/vt_DBInfo/images/Back/덤벨 데드 리프트/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/덤벨 데드 리프트/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/덤벨 데드 리프트/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 2, '바벨 벤트 오버 로우', '바벨',
'<h2>바벨 벤트 오버 로우</h2>
<img src="/TOP/vt_DBInfo/images/Back/바벨 벤트 오버 로우/바벨 벤트 오버 로우1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/바벨 벤트 오버 로우/바벨 벤트 오버 로우2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/바벨 벤트 오버 로우/바벨 벤트 오버 로우3.jpg">
<img src="/TOP/vt_DBInfo/images/Back/바벨 벤트 오버 로우/바벨 벤트 오버 로우4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
 등 전체의 근육을 발달시키는 대표적인 운동이다.
 상체 전면과 후면 근육들의 협응을 통해 운동이 이루어짐으로써 상체를 보다 단단하게 만들어준다.',
'* 운동 방법 *
1. 어깨너비보다 약간 넓게 바벨을 잡고, 양발은 어깨너비만큼 벌리고 선다.
2. 무릎을 약간 굽히고 등을 아치형으로 만든 후 45도 정도 상체를 숙인다.
3. 복부에 힘을 주고 바벨을 하복부 쪽으로 끌어당긴다.
4. 광배근이 스트레칭되는 것을 느끼며 천천히 바벨을 내려 처음 자세로 돌아온다.',
'* Tip * 
언더 그립으로 실시할 경우 등 하부와 이두근의 참여도가 높아지게 된다.
상체가 바닥면과 평행에 가까우면 등의 하부 근육을, 멀어지면 상부의 근육을 발달시킬 수 있다.',
'* 주의 *
허리의 부담을 줄이기 위해 요추의 정상적인 만곡을 유지한다.
상완이두근이 아닌 등 근육을 이용하여 운동한다.
<img src="/TOP/vt_DBInfo/images/Back/바벨 벤트 오버 로우/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/바벨 벤트 오버 로우/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 2, '덤벨 벤트 오버 로우', '덤벨',
'<h2>덤벨 벤트 오버 로우</h2>
<img src="/TOP/vt_DBInfo/images/Back/덤벨 벤트 오버 로우/덤벨 벤트 오버 로우1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/덤벨 벤트 오버 로우/덤벨 벤트 오버 로우2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/덤벨 벤트 오버 로우/덤벨 벤트 오버 로우3.jpg">
<img src="/TOP/vt_DBInfo/images/Back/덤벨 벤트 오버 로우/덤벨 벤트 오버 로우4.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
가동 범위가 넓어 몸의 중심선(척추)에 가까운 등의 근육까지 발달시킬 수 있는 운동이다.
허리 근육이 약할 경우 인클라인 벤치에 엎드린 상태에서 동작을 실시하면 부담을 줄일 수 있다.
한 방향씩 실시하면 동작의 가동 범위를 넓힐 수 있고 목표 근육에 자극을 증가시킬 수 있다.',
'* 운동 방법 *
1. 손등이 앞을 향하게 덤벨을 잡고, 양발을 어깨너비만큼 벌리고 선다.
2. 무릎을 약간 굽히고 등을 아치형을 만든 후 45도 정도 상체를 숙인다.
3. 복부에 힘을 주고 손목을 돌려 손바닥이 서로 마주 보도록 하며 하복부 쪽으로 덤벨을 잡아당기면서 광배근을 수축한다.
4. 광배근이 스트레칭되는 것을 느끼며 천천히 덤벨을 내려 처음 자세로 돌아온다.',
'* Tip *
언더 그립으로 실시하는 리버스 덤벨 로우는 광배근 하부와 상완이두근의 참여를 높아지게 하는 효과가 있다.',
'* 주의 *
허리의 부담을 줄이기 위해 요추의 정상적인 만곡을 유지한다.
상완이두근이 아닌 등 근육을 이용하여 운동한다.
<img src="/TOP/vt_DBInfo/images/Back/덤벨 벤트 오버 로우/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/덤벨 벤트 오버 로우/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/덤벨 벤트 오버 로우/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 2, '원암 덤벨 로우', '덤벨',
'<h2>원암 덤벨 로우</h2>
<img src="/TOP/vt_DBInfo/images/Back/원암 덤벨 로우/원암덤벨로우1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/원암 덤벨 로우/원암덤벨로우2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/원암 덤벨 로우/원암덤벨로우3.jpg">
<img src="/TOP/vt_DBInfo/images/Back/원암 덤벨 로우/원암덤벨로우4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
몸의 중심선(척추)에 가까운 등의 근육을 집중적으로 발달시키고 선명도를 증가시킬 수 있는 운동이다. 허리에 대한 부담이 적고 등 근육을 한쪽씩 집중시킬 수 있다. 
한 방향씩 실시하면 동작의 가동 범위를 넓힐 수 있고 목표 근육에 자극을 증가시킬 수 있다.',
'* 운동 방법 *
1. 오른손으로 덤벨을 잡고 왼손과 왼쪽 무릎을 벤치 위에 올리고 허리와 등을 곧게 편다.
2. 고개를 들어 전방을 보며, 오른팔을 최대한 아래로 늘어뜨린다.
3. 광배근의 힘을 이용하여 덤벨을 옆구리 쪽으로 끌어올린다.
4. 광배근을 계속 긴장시키면서 천천히 덤벨을 내리며 처음 자세로 돌아온다.',
'* Tip * 
팔꿈치를 최대한 위로 올리게 되면 승모근과 능형근에 보다 깊은 자극을 줄 수 있다.',
'* 주의 *
수축 시 상체가 지나치게 돌아가지 않도록 주의한다.
이두근이 지나치게 동원되지 않도록 한다.
<img src="/TOP/vt_DBInfo/images/Back/원암 덤벨 로우/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/원암 덤벨 로우/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/원암 덤벨 로우/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 2, '풀업', '머신',
'<h2>풀업</h2>
<img src="/TOP/vt_DBInfo/images/Back/풀업/풀업1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/풀업/풀업2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/풀업/풀업3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
머신의 플레이트 무게만큼 체중의 부담을 줄여서 할 수 있는 턱걸이 운동이다. 
등 근육을 넓게 만들어주는 운동으로서 특히 광배근의 근력이 약한 사람에게 필수적인 운동이다.',
'* 운동 방법 *
1. 머신 앞에 서서 어깨너비보다 넓게 손잡이를 두 손으로 잡는다.어시스트 발판에 올라가서 매달린다.
2. 몸을 살짝 뒤로 젖히면서 가슴 윗부분이 바에 닿을 정도로 광배근의 힘으로 상체를 끌어올린다.
3. 광배근이 스트레칭되는 것을 느끼면서 천천히 시작 자세로 돌아온다.',
'* Tip * 
허리를 지나치게 뒤로 젖히지 않는다.
팔 힘의 사용을 최소화한다.',
'* 주의 *
허리를 지나치게 뒤로 젖히지 않는다.
팔 힘의 사용을 최소화한다.
<img src="/TOP/vt_DBInfo/images/Back/풀업/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/풀업/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 2, '렛 풀 다운', '머신',
'<h2>렛 풀 다운</h2>
<img src="/TOP/vt_DBInfo/images/Back/랫 풀 다운/랫 풀 다운1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/랫 풀 다운/랫 풀 다운2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/랫 풀 다운/랫 풀 다운3.jpg">
<br><br>
* 운동 준비 자세  / 개요 * 
광배근을 발달시키기 위한 대표적인 운동이다. 
턱걸이를 하기 어려운 초보자들에게 좋은 운동이다. 
팔만 이용하여 바(bar)를 잡아당기면 이두근의 참여도가 지나치게 높아지므로 동작을 시작하는
 시점에서 견갑골(날개뼈)을 우선적으로 내리도록 한다.',
'* 운동 방법 *
1. 두 손으로 V자 모양이 되도록 넓게 바를 잡는다.
2. 의자에 앉아, 바와 가슴이 수직으로 만나는 지점 아래에 허벅지를 지지대에 고정시킨다.
3. 가슴을 위쪽으로 들어주면서 쇄골 아랫부분이 바에 닿을 정도로 광배근의 힘으로 바를 끌어내린다.
4. 광배근이 스트레칭되는 것을 느끼면서 팔을 천천히 편다.',
'* Tip * 
목 뒤 방향으로 바를 잡아당기면 등 상부가 더욱 발달된다.
상체가 바닥과의 수직선에 가까우면 등의 하부 근육을, 멀어지면 등의 상부 근육을 발달시킬 수 있다.',
'* 주의 *
동작 중 상체가 지나치게 뒤로 넘어가지 않도록 한다.
바가 그리는 궤도와 팔꿈치가 동일선상에서 움직일 수 있도록 한다.
<img src="/TOP/vt_DBInfo/images/Back/랫 풀 다운/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/랫 풀 다운/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/랫 풀 다운/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 2, '시티드 케이블 로우', '케이블 머신',
'<h2>시티드 케이블 로우</h2>
<img src="/TOP/vt_DBInfo/images/Back/시티드 케이블 로우/시티드 케이블 로우1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/시티드 케이블 로우/시티드 케이블 로우2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/시티드 케이블 로우/시티드 케이블 로우3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
벤트 오버 로우 동작을 앉아서 케이블을 이용해 하는 운동이다. 
등 근육의 선명도를 높이기 위해서는 반복횟수를 높여 실시한다.',
'* 운동 방법 *
1.발을 지지대에 고정시키고, 상체를 약간 구부려 V바를 잡는다 .
2.견갑골 하부가 서로 닿는 느낌으로 바를 아랫배 쪽으로 끌어당긴다.
3.광배근이 스트레칭되는 것을 느끼며 천천히 원위치한다. ',
'* Tip * 
그립을 넓게 할 경우, 광배근의 중간 부분을 좀 더 발달시킬 수 있다.',
'* 주의 *
잡아당기는 동작에서 상체가 뒤로 넘어가지 않도록 주의한다.
팔이나 어깨의 힘이 아니라 등의 힘으로 잡아당기면서 실시한다.
<img src="/TOP/vt_DBInfo/images/Back/시티드 케이블 로우/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/시티드 케이블 로우/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/시티드 케이블 로우/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 2, '굿모닝', '맨몸운동',
'<h2>굿모닝</h2>
<img src="/TOP/vt_DBInfo/images/Back/굿모닝/굿모닝1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/굿모닝/굿모닝2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/굿모닝/굿모닝3.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
상체를 숙여 인사하는 듯한 동작 때문에 ‘굿모닝’이라고 이름 붙여졌다.
맨손으로 손쉽게 따라할 수 있는 동작으로 전신 후면에 탄력적인 라인을 만들어주는 데 효과적이다.
또한 요통이 있는 경우에도 많은 도움이 되는 운동이다.^
이 동작은 처음에 허리에 자극을 느끼고 이어 엉덩이, 다리 뒤쪽까지 근육이 늘어나는 것을 느끼면서 실시하는 것이 포인트다.',
'* 운동 방법 *
1. 양발은 어깨너비로 벌리고 선 상태에서 양손은 머리 뒤로 깎지를 껴준다.
2. 인사하듯이 천천히 허리를 90도 정도로 굽힌다.
3. 허리의 힘으로 천천히 상체를 일으켜 세운다. 동작을 반복한다.',
'* Tip *
반복 횟수를 늘리는 것보다 천천히 실시하는 것이 더 큰 효과를 가져다준다.',
'* 주의 *
상체를 숙이고 펼 때 척추가 동글게 구부러지지 않도록 하며 아치형을 유지한다.
<img src="/TOP/vt_DBInfo/images/Back/굿모닝/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/굿모닝/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 2, '슈퍼맨', '맨몸운동',
'<h2>슈퍼맨</h2>
<img src="/TOP/vt_DBInfo/images/Back/슈퍼맨/슈퍼맨1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/슈퍼맨/슈퍼맨2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/슈퍼맨/슈퍼맨3.jpg">
<img src="/TOP/vt_DBInfo/images/Back/슈퍼맨/슈퍼맨4.jpg">
<img src="/TOP/vt_DBInfo/images/Back/슈퍼맨/슈퍼맨5.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
허리와 엉덩이를 중심으로 전신 후면의 근육을 자극하여 탄력적인 뒷모습을 만들어 주는 동작이다.
근육의 긴장감을 유지하며 반복횟수를 늘리면 유산소성 운동 효과까지 가미되어 일석이조의 효과를 볼 수 있다.
등 운동이나 다리 후면 운동을 실시한 다음 이 동작을 해주면 그 효과가 배가된다.',
'* 운동 방법 *
1. 엎드린 자세에서 시선은 바닥을 보고 두 손과 두 발을 쭉 뻗는다.
2. 호흡을 내뱉으며 오른팔과 왼쪽 다리를 위로 최대한 들어 올린다. 이때 허리와 엉덩이의 자극을 느끼며 실시한다.
3. 호흡을 들이마시면서 올린 팔과 다리를 내린다.
4. 왼팔과 오른쪽 다리를 위로 최대한 들어 올린다. 팔과 다리를 교차하며 반복 실시한다.
5. 올린 팔과 다리를 내린다. 동작을 반복한다.',
'* Tip *
운동 전에 가볍게 허리 스트레칭 후 실시한다.
허리와 엉덩이의 자극을 느끼며 실시한다.',
'* 주의 *
디스크나 요추 질환이 있는 경우 전문가와 상담 후 실시한다.
동작 시 몸의 반동을 이용하지 않도록 한다.
<img src="/TOP/vt_DBInfo/images/Back/슈퍼맨/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Back/슈퍼맨/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Back/슈퍼맨/운동부위3.jpg">
<img src="/TOP/vt_DBInfo/images/Back/슈퍼맨/운동부위4.jpg">
<img src="/TOP/vt_DBInfo/images/Back/슈퍼맨/운동부위5.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '바벨 스쿼트', '바벨',
'<h2>바벨 스쿼트</h2>
<img src="/TOP/vt_DBInfo/images/Leg/바벨 스쿼드/바벨 스쿼드1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/바벨 스쿼드/바벨 스쿼드2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/바벨 스쿼드/바벨 스쿼드3.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/바벨 스쿼드/바벨 스쿼드4.jpg">
<br><br>
* 운동 준비 자세 * 
하체 운동 중 가장 기본이 되는 운동이다. 운동 전에 체중을 이용한 스쿼트 동작으로 자세를 정확히 인지한 후 실시하는 것이 좋다.
 등 하부, 엉덩이, 허벅지 전체, 종아리 부위의 근육을 협응적으로 훈련함으로써 에너지 소모가 가장 많은 대표적인 하체 운동이다.',
'* 운동 방법 *
1. 선 자세에서 어깨너비보다 넓게 바벨을 잡는다.
2. 바벨을 들어 머리 뒤의 승모근에 위치시킨다.시선은 정면을 향하고 복부에 힘을 주어 허리를 단단히 조여준다.
3. 무릎이 발끝보다 앞으로 나오지 않도록 하면서 허벅지와 수평이 될 때까지 앉는다.
4. 발뒤꿈치로 민다는 느낌으로 허벅지에 힘을 주면서 일어선다.',
'* Tip * 
안정성을 위해 허리는 항상 곧게 펴고,척추의 곡선을 그대로 유지하면서 대퇴,고관절,아킬레스건의 유연성이 충분히 확보되도록 스트레칭을 꼭 해야한다.
바벨 스쿼트 동작 시 배에 힘을 주어 복압을 증가시키면 훨씬 더 강한 힘을 낼 수 있고,허리 부상에 위험을 최소화 할 수 있다.
무릎을 바깥쪽 또는 안쪽으로 굽히지 말고, 일정하게 수평을 이루며 동작을 실시한다.',
'* 주의 *
허리에 통증이 있는 경우엔 덤벨 스쿼트나 레그 프레스 운동으로 대체해서 실시하는 것이 바람직하고,바벨을 들어올리는 동안 머리를 숙이지 않는다.
<img src="/TOP/vt_DBInfo/images/Leg/바벨 스쿼드/바벨 스쿼드 운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/바벨 스쿼드/바벨 스쿼드 운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/바벨 스쿼드/바벨 스쿼드 운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '레그프레스', '머신',
'<h2>레그 프레스</h2>
<img src="/TOP/vt_DBInfo/images/Leg/레그 프레스/레그 프레스1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/레그 프레스/레그 프레스2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/레그 프레스/레그 프레스3.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/레그 프레스/레그 프레스4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
대퇴사두근과 둔근을 강화시켜주는 대표적이고 필수적인 하체 운동이다. 
초보자가 실시하기에 가장 적당한 하체 운동이며 스쿼트에 비해 허리에 가해지는 부하가 
적어 비교적 무거운 무게로 운동을 할 수 있는 장점이 있다. 또한 발판의 지지 위치에 
변화를 줄 경우 좀 더 집중적인 근력 향상을 꾀할 수 있다.',
'* 운동 방법 *
1. 머신에 앉아 엉덩이와 어깨를 밀착시킨다.
2. 양발을 발판에 대고 어깨너비만큼 벌린 다음 무릎을 편다.
3. 앉는다는 느낌으로 천천히 무릎이 90도가 될 때까지 구부린다.
4. 발뒤꿈치로 민다는 느낌으로 허벅지에 힘을 주면서 무릎을 편다.',
'* Tip * 
발판의 보폭을 좁게 하면 대퇴부 바깥쪽이, 넓게 하면 대퇴부 안쪽이 발달된다.
발을 발판의 윗쪽에 대고 하면 대둔근이, 발을 발판의 아래쪽에 대고 하면 대퇴사두근 아래쪽이 발달된다.',
'* 주의 *
무릎을 완전히 펴지 말고 약간 구부려주는 것이 운동 효과에 좋다.
대퇴사두근의 힘으로 지탱하며 지속적으로 실시한다.
엉덩이와 허리가 항상 기구에 밀착해 있어야 한다.
<img src="/TOP/vt_DBInfo/images/Leg/레그 프레스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/레그 프레스/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/레그 프레스/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '런지', '맨몸',
'<h2>런지</h2>
<img src="/TOP/vt_DBInfo/images/Leg/런지/런지1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/런지/런지2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/런지/런지3.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/런지/런지4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
대퇴 전면과 둔근을 발달시키기 위한 운동이다.
바벨 대신 덤벨을 이용해 실시할 수도 있다. 
또한 다리의 위치 변화를 통해 walking lunge, side lunge등 다양하게 실시할 수 있으며 런지운동 초기엔 다리를 앞으로 
내민 상태에서 지속적으로 up/down을 실시하여 균형감과 근육의 동원능력을 숙달시키는 것이 필요하다.',
'* 운동 방법 *
1. 바벨을 어깨너비보다 넓게 잡고 선 다음, 바벨을 들어 승모근에 위치시킨다.
2. 왼발을 앞으로 70~100cm 정도 벌려 내민다.
3. 앞으로 내민 왼쪽 다리는 허벅지가 지면과 수평이 될 때까지 구부리고, 
4. 뒤의 오른쪽 다리는 무릎이 자연스럽게 바닥을 향하게 한다.
5. 발뒤꿈치로 민다는 느낌을 주면서 하체의 힘으로 무릎을 다시 펴서 원위치한다.반대쪽도 같은 방법으로 실시한다.',
'* Tip * 
등과 허리는 항상 똑바로 편 상태로 실시해야 부상을 방지할 수 있다.',
'* 주의 *
운동전 체중을 이용한 자세유지 및 균형운동을 꼭 실시하도록 한다.
대둔근 발달에 보다 주안점을 두는 운동이므로 보폭을 넓게 하는 것이 권장된다.
앞으로 걸어나가면서 실시하는 워킹 런지. 앞으로 내민 발을 중심으로 일어서게 되면서 대퇴이두근의 역할이 보다 강조되는 효과가 있다.
<img src="/TOP/vt_DBInfo/images/Leg/런지/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/런지/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/런지/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '레그 익스텐션', '머신',
'<h2>레그 익스텐션</h2>
<img src="/TOP/vt_DBInfo/images/Leg/레그 익스텐션/레그 익스텐션1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/레그 익스텐션/레그 익스텐션2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/레그 익스텐션/레그 익스텐션3.jpg">
<br><br>
* 운동 준비 자세 * 
허벅지 전면 근육을 발달시키는 운동이다. 여성의 경우, 적당한 무게로 횟수를 늘려 실시하면 탄력 있는 허벅지를 만드는 데 효과적이다. 
또한 두 다리의 근력 수준 차이를 극복하기 위해 한 발씩 실시해도 좋은 운동이 될 수 있다.',
'* 운동 방법 *
1. 등받이에 등을 대고 손잡이를 잡은 다음, 발목을 어깨너비보다 좁게 벌려서 롤패드에 고정시킨다.
2. 다리를 들어올려 무릎을 펴서 허벅지 근육을 수축시킨다.
3. 천천히 저항을 느끼면서 다리를 내리며 긴장을 유지한다.',
'* Tip * 
허벅지를 빨래 짜듯이 쥐어짜준다 라는 느낌으로 다리를 올린다.
초보자 남성은 15~20kg,여성은 10~15kg의 중량으로 시작하여 차즘 늘려간다.
무릎의 각도가 90도 이상 과도하게 넘지 않도록 할 경우, 다리 근육에 지속적인 긴장이 유지될 수 있도록 한다.',
'* 주의 *
상체에 반동이 일어나지 않도록 천천히 실시할 수 있도록 주의한다.
<img src="/TOP/vt_DBInfo/images/Leg/레그 익스텐션/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '레그 컬', '머신',
'<h2>레그 컬</h2>
<img src="/TOP/vt_DBInfo/images/Leg/레그 컬/레그 컬1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/레그 컬/레그 컬2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/레그 컬/레그 컬3.jpg">
<br><br>
* 운동 준비 자세 * 
대퇴후면의 슬굴곡근을 발달시키기 위한 운동이다. 스탠딩 레그 컬보다 많은 중량을 들 수 있는 것이 장점으로, 
하체 근력이 약한 사람에게 필수적인 운동이다. ',
'* 운동 방법 *
1. 슬개골이 벤치 끝을 살짝 넘어오도록 위치시킨 후 기구 위에 엎드려 손잡이를 잡는다.발목을 기구에 걸고 아킬레스건 위에 롤패드가 오도록 위치시킨다.
2. 허벅지 힘으로 패드를 끌어당기며 무릎을 굽힌다.
3. 천천히 저항을 느끼며 다리를 내린다.',
'* Tip * 
1. 조금 아래로 내려가 아킬레스건 10~15cm위에 발목패드가 접하게 위치한다.
2. 일단 가벼운 무게에서는 발목을 곧게 펴고 레그컬을 수행한다.
3. 어느정도 무게가 개입되면 발목을 편하게 하고 레그컬을 동작한다(비복근 개입).
4. 무게가 고중량이 되면 어느정도 자극을 받은 상태로 발목을 접어서 한다.',
'* 주의 *
과도한 중량으로 동작 시 엉덩이를 사용할 경우 요통이 유발될 수 있다.
다리를 완전히 내리지 않도록 주의한다.
<img src="/TOP/vt_DBInfo/images/Leg/레그 컬/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/레그 컬/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '카프 레이즈', '스텝박스',
'<h2>카프 레이즈</h2>
<img src="/TOP/vt_DBInfo/images/Leg/카프 레이즈/카프 레이즈1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/카프 레이즈/카프 레이즈2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/카프 레이즈/카프 레이즈3.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
가장 기본이 되는 종아리 운동으로 뒤꿈치를 들어 체중을 올리는 역할을 하는 근육을 발달시킨다.
지구력이 높은 근육의 특성상 고반복이 필수적이다.
스미스 머신을 이용해 실시할 수도 있다.',
'* 운동 방법 *
1. 스텝박스 위에 두 발을 발끝 1/3 정도 딛고 올라선다.
2. 이때 균형 유지를 위해 한쪽 또는 양쪽 손으로 벽을 가볍게 짚는다.
3. 최대한 높이 발뒤꿈치를 들어올려 종아리를 수축한 후 잠시 멈춘다.
4. 천천히 저항을 느끼면서 발뒤꿈치가 스텝박스 바닥보다 더 아래로 내려가게 한다.',
'* Tip *
발끝을 벌리면 내측의 비복근이, 발끝을 모으면 외측의 비복근이 발달한다.',
'* 주의 *
운동 중 무릎이 굽혀지지 않도록 하며 승모근의 힘으로 들어올린다는 생각은 하지 않는다.
<img src="/TOP/vt_DBInfo/images/Leg/카프 레이즈/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/카프 레이즈/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '점프 스쿼트', '맨몸운동',
'<h2>점프 스쿼트</h2>
<img src="/TOP/vt_DBInfo/images/Leg/점프 스쿼트/점프 스쿼트1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/점프 스쿼트/점프 스쿼트2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/점프 스쿼트/점프 스쿼트3.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/점프 스쿼트/점프 스쿼트4.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/점프 스쿼트/점프 스쿼트5.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
하체의 체지방은 연소하고 탄력을 향상시키는 데 효과적인 운동이다. 
자기 체중을 갖고 하는 근력 운동으로 하체 근력이 어느 정도 있는 경우에는 이 동작 하나로도 강한 운동 효과를 얻을 수 있다.
지속적으로 실시하면 탄력 있는 다리 라인을 만들 수 있다.',
'* 운동 방법 *
1. 다리를 어깨너비로 벌리고 선다.
2. 엉덩이를 무릎 높이까지 내리고(스쿼트 자세) 양팔을 앞으로 나란히 뻗는다. 이때 무릎이 발끝보다 앞으로 나오지 않도록 한다.
3. 다리에 힘을 주고 팔은 힘껏 뒤로 밀면서 위로 점프하며 뛰어오른다.
4. 쿵 소리가 나지 않게 천천히 떨어진다.
5. 스쿼트 자세로 돌아온다. 동작을 반복한다.',
'* Tip *
바닥을 세게 차고 높이 점프할수록 운동 강도가 높아진다.',
'* 주의 *
착지 시에 발뒤꿈치에 체중이 실리지 않도록 유의한다. 발 앞꿈치부터 바닥에 떨어져야 무릎관절에 무리가 덜 간다.
체중이 앞으로 쏠리지 않도록 한다.
<img src="/TOP/vt_DBInfo/images/Leg/점프 스쿼트/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/점프 스쿼트/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/점프 스쿼트/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '와이드 스쿼트', '맨몸운동',
'<h2>와이드 스쿼트</h2>
<img src="/TOP/vt_DBInfo/images/Leg/와이드 스쿼트/와이드스쿼트1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/와이드 스쿼트/와이드스쿼트2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/와이드 스쿼트/와이드스쿼트3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
다리, 엉덩이, 허벅지 안쪽을 다양하게 자극하는 스쿼트이다.
이 동작은 특히 여성들에게 추천하는 운동으로 허벅지 안쪽과 엉덩이 옆 라인을 탄력적으로 다듬는 데 효과적이다.',
'* 운동 방법 *
1. 다리를 어깨너비보다 넓게 벌리고 서서 양손은 허리에 위치시킨다. 이때 양발은 각각 45도 정도 밖을 향하게 열어준다.
2. 호흡을 들이마시면서 천천히 무릎을 굽힌다. 이때 무릎이 엄지발가락을 향하도록 한다.
3. 호흡을 내쉬면서 무릎을 편다. 이때 안쪽 허벅지와 엉덩이에 긴장감을 느끼며 올라온다. 동작을 반복한다.',
'* Tip *
무릎을 구부릴 때는 발끝이 바깥쪽을 향하게 한다.
무릎을 구부려 아래로 내려갈 때 다리 안쪽 근육이 늘어나는 것을 충분히 느끼고, 
올라올 때는 엉덩이 옆쪽이 자극되는 것을 느끼면서 천천히 실시하면 효과를 더 크게 볼 수 있다.',
'* 주의 *
허리가 앞으로 숙여지거나 뒤로 젖혀지지 않도록 한다.
<img src="/TOP/vt_DBInfo/images/Leg/와이드 스쿼트/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/와이드 스쿼트/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '사이드 힙 킥', '맨몸운동',
'<h2>사이드 힙 킥</h2>
<img src="/TOP/vt_DBInfo/images/Leg/사이드 힙 킥/사이드 힙 킥1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/사이드 힙 킥/사이드 힙 킥2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/사이드 힙 킥/사이드 힙 킥3.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/사이드 힙 킥/사이드 힙 킥4.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
측면 엉덩이 근육인 중둔근, 소둔근을 발달시켜 군살 없는 힙라인을 만들어준다. 
다리를 높이 올릴수록 옆구리의 근육들이 더 강하게 자극되어 보디라인의 탄력을 향상시킬 수 있다.',
'* 운동 방법 *
1. 옆으로 누워 한쪽 팔꿈치를 바닥에 대고 상체를 든다. 다른쪽 손으로 바닥을 짚어 중심을 잡는다. 
2. 숨을 내쉬면서 위쪽의 다리를 최대한 높이 들어 올린다. 가장 위로 올린 지점에서 1~2초간 정지 자세를 유지하고 측면 엉덩이에 수축을 지속시켜 준다.
3. 숨을 들이마시면서 올린 다리를 내린다. 동작을 반복한다.
4. 반대쪽도 같은 방법으로 실시한다.',
'* Tip *
다리의 힘이 아닌 엉덩이의 힘으로 다리를 들어 올린다는 느낌으로 실시한다.
동작 시 엉덩이의 지속적인 자극(수축과 이완)을 느끼도록 집중한다.
발의 복숭아뼈 주변 근육들까지 긴장감이 유지되는지 확인하면서 동작을 천천히 실시하면 더욱 효과적이다.',
'* 주의 *
상체가 흔들리지 않도록 잘 고정시킨다.
바닥에 기댄 어깨가 귀에 붙지 않도록 상체를 바르게 편다.
<img src="/TOP/vt_DBInfo/images/Leg/사이드 힙 킥/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/사이드 힙 킥/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '덩키 킥', '맨몸운동',
'<h2>덩키 킥</h2>
<img src="/TOP/vt_DBInfo/images/Leg/덩키 킥/덩키 킥1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/덩키 킥/덩키 킥2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/덩키 킥/덩키 킥3.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/덩키 킥/덩키 킥4.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/덩키 킥/덩키 킥5.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
엉덩이를 힙업하고 탄력 있게 만드는 데 탁월한 동작이다. 
스쿼트, 런지 등 엉덩이 큰 근육을 강화하는 운동 다음에 실시하면 효과를 배가시킬 수 있다.',
'* 운동 방법 *
1. 무릎과 손을 바닥에 대고 엎드린 자세를 취한다.
2. 한쪽 다리를 등과 수평이 되도록 들어 올린다.
3. 발목을 펴 발끝이 천장을 향하게 한 상태로 다리를 위로 밀어 올린다.
4. 엉덩이에 긴장감 느끼면서 올린 다리를 천천히 등 높이로 내린다. 동작을 반복한다.
5. 반대쪽도 같은 방법으로 반복 실시한다.',
'* Tip *
매트가 없으면 무릎이 배기지 않도록 얇은 수건을 무릎에 대고 해도 좋다.
다리를 최대로 올린 상태에서 1~2초 정도 자세 유지하다가 내려주면 운동 효과를 더 극대화할 수 있다.',
'* 주의 *
골반이 바닥과 수평이 되도록 유지하며, 천장 쪽으로 뒤집히지 않도록 주의한다.
양손은 어깨 바로 아래에 둔다.
허리가 아치형으로 휘지 않도록 한다.
골반이 틀어지지 않도록 허리로 몸의 중심을 잡고 엉덩이 아래쪽에 자극이 가도록 천천히 들어 올린다. 
다리를 높이 드는 것이 중요한 것이 아니다. 무조건 높이 올린다고 엉덩이에 운동 부하가 전달되는 것은 아니기 때문이다.
<img src="/TOP/vt_DBInfo/images/Leg/덩키 킥/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/덩키 킥/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '브릿지', '맨몸운동',
'<h2>브릿지</h2>
<img src="/TOP/vt_DBInfo/images/Leg/브릿지/브릿지1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/브릿지/브릿지2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/브릿지/브릿지2.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
엉덩이 근육을 발달시켜 힙업에 효과적인 동작이다. 등 근육 발달에도 도움이 된다. 
특히 요통이 있거나 장시간 책상에 앉아 있는 경우에 수시로 이 동작을 반복해주면 뭉친 허리 근육을 시원하게 풀 수 있다.',
'* 운동 방법 *
1. 천장을 바라보고 누운 상태에서 양팔은 펴서 손바닥을 바닥에 대고 무릎은 세워 A자가 되도록 한다.
2. 숨을 내쉬면서 골반을 위로 들어 올린다. 엉덩이에 긴장감 느끼면서 1~2초간 정지 자세를 취한다.
3. 숨을 들이마시면서 골반을 바닥에 내린다. 동작을 반복한다.',
'* Tip *
다리의 힘이 아니라 엉덩이의 힘으로 올린다는 느낌으로 실시한다.
동작 시 엉덩이의 지속적인 자극(수축과 이완)을 느끼도록 집중한다',
'* 주의 *
동작 시 허리는 곧게 펴고 엉덩이의 긴장을 풀지 않아야 한다.
<img src="/TOP/vt_DBInfo/images/Leg/브릿지/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/브릿지/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '하드 클린', '맨몸운동',
'<h2>하드 클린</h2>
<img src="/TOP/vt_DBInfo/images/Leg/하드 클린/하드 클린1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/하드 클린/하드 클린2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/하드 클린/하드 클린3.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/하드 클린/하드 클린4.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/하드 클린/하드 클린5.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/하드 클린/하드 클린6.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/하드 클린/하드 클린7.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
빠른 시간 안에 전신 근력을 키워주는 운동법으로 운동선수들의 트레이닝에 많이 쓰인다.
전신 근지구력을 향상시켜주고, 상체와 하체의 모든 근력을 발달에도 큰 도움이 된다. 전신 운동인만큼 칼로리 소모도 매우 효과적이다.',
'* 운동 방법 *
1. 양손에 덤벨을 들고 다리를 어깨너비만큼 벌리고 선다.
2. 덤벨을 양쪽 귀 옆으로 들어 올린다.
3. 머리 위로 덤벨을 쭉 뻗어 올린다.
4. 다시 덤벨을 귀 옆으로 내린다.
5. 차렷 자세로 돌아온다.
6. 발바닥에 힘을 주며 엉덩이를 무릎 높이까지 천천히 내려 스쿼트 자세를 만든다.
7. 다시 차렷 자세로 일어난다. 동작을 반복한다.',
'* 주의 *
몸을 너무 흔들지 않도록 한다.
반동을 이용하지 않는다.
<img src="/TOP/vt_DBInfo/images/Leg/하드 클린/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/하드 클린/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/하드 클린/운동부위3.jpg">
<br><br>', ' ');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '암워킹', '맨몸운동',
'<h2>암 워킹</h2>
<img src="/TOP/vt_DBInfo/images/Leg/암워킹/암워킹1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/암워킹/암워킹2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/암워킹/암워킹3.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/암워킹/암워킹4.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/암워킹/암워킹5.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/암워킹/암워킹6.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
근력 운동과 유산소 운동 효과를 동시에 얻을 수 있는 전신 운동이다.
특히 체지방 연소에 탁월하여 고도 비만자들에게 추천하는 동작이다.
자신의 체중을 이용한 근력 운동으로 쉽고 안전하게 실시할 수 있다.',
'* 운동 방법 
1. 다리를 어깨너비보다 넓게 벌리고 선다.
2. 몸을 숙여 한 손 또는 양손으로 바닥을 짚는다.
3. 마치 걷는 것처럼 한 손씩 앞으로 짚어 이동한다.
4. 어깨와 몸통이 수평이 될 때까지 앞으로 이동한다.
5. 다시 거꾸로 한 손씩 몸 쪽으로 짚어 이동한다.
6. 처음 자세로 돌아간다. 동작을 반복한다.',
'* 주의 *
체중이 많이 나가는 경우 자칫 무리가 갈 수 있으므로 지나치게 팔을 앞으로 이동시키지 않는다. 조금씩 연습해 운동량을 늘려간다.
<br><br>', ' ');
insert into vt_exercise values(vt_exercise_seq.nextval, 3, '버피 테스트', '맨몸운동',
'<h2>버피 테스트</h2>
<img src="/TOP/vt_DBInfo/images/Leg/버피 테스트/버피테스트1.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/버피 테스트/버피테스트2.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/버피 테스트/버피테스트3.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/버피 테스트/버피테스트4.jpg">
<img src="/TOP/vt_DBInfo/images/Leg/버피 테스트/버피테스트5.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
짧은 시간 안에 운동 효과를 극대화할 수 있는 유산소성 근력 운동이다.
원래 체력 테스트 목적으로 만들어진 운동이나 전신 집중 운동으로 새롭게 주목 받고 있다.
운동선수들의 체력 향상을 위한 필수 운동인 만큼 운동 강도도 높고, 또 그만큼 운동 효과도 크다.',
'* 운동 방법 *
1. 허리를 곧게 펴고 선다.
2. 상체를 숙이고 바닥에 양손을 짚는다.
3. 양쪽 다리를 점프하듯 뒤로 쭉 뻗어 어깨와 발끝이 일직선이 되도록 한다.
4. 다시 한 번에 다리를 앞으로 점프하여 당긴다.
5. 처음 자세로 돌아간다. 동작을 반복한다.',
'* Tip *
빠르게 움직일수록 더 많은 칼로리를 소모시킬 수 있다.
운동 강도를 높이고 싶다면 마지막에 다리를 가슴 쪽으로 당긴 상태에서 양손을 머리 위로 들어 점프해준다.',
'* 주의 *
허리가 아니라 가슴을 펴준다고 생각하며 실시한다.
허리를 편다는 느낌으로 하면 자칫 허리의 근육이 놀라 부상을 입을 수도 있다.
점프할 때는 복부에 힘을 주고 가볍게 뛰어야 발가락 부상을 막을 수 있다.
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 4, '덤벨 컨센트레이션 컬', '덤벨',
'<h2>덤벨 컨센트레이션 컬</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/덤벨 컨센트레이션 컬/덤벨 컨센트레이션 컬1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/덤벨 컨센트레이션 컬/덤벨 컨센트레이션 컬2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/덤벨 컨센트레이션 컬/덤벨 컨센트레이션 컬3.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/덤벨 컨센트레이션 컬/덤벨 컨센트레이션 컬4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
상완이두근을 집중적으로 발달시키는 운동이다. 천천히 실시하는 것이 매우 중요하며 
상완이두근의 중간 부위를 돋보이게 하는 데 효과적이다.',
'* 운동 방법 *
1. 벤치에 앉아 허리를 숙여 한 손으로 덤벨을 잡고 반대쪽 손은 무릎을 짚는다 .
2. 덤벨을 잡은 손의 팔꿈치를 대퇴부 안쪽에 고정시킨다.
3. 손목을 꺾지 말고 곧게 편 상태로 덤벨을 손목 바깥쪽 방향으로 들어올린다.
4. 천천히 저항을 느끼며 덤벨을 내린다.반대쪽도 같은 방법으로 실시한다.',
'* Tip * 
가슴 쪽이 아닌 어깨 쪽을 향해 덤벨을 들어올린다.
들어올리는 중간에서 손목을 바깥쪽으로 돌려주어 상완이두근이 더욱 강하게 수축하도록 한다.',
'* 주의 *
팔을 흔들어서 생기는 반동을 이용하지 않는다.
팔꿈치를 대퇴 안쪽에 지지하면서 흔들리지 않도록 한다.
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/덤벨 컨센트레이션 컬/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/덤벨 컨센트레이션 컬/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 4, '덤벨 컬', '덤벨',
'<h2>덤벨 컬</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/덤벨 컬/덤벨 컬1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/덤벨 컬/덤벨 컬2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/덤벨 컬/덤벨 컬3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
바벨 컬에 비해 상완이두근의 선명도를 높일 수 있는 운동이다. 선 자세와 앉은 자세(벤치, 짐볼)에서 
운동이 가능하며, 그립을 잡는 방향에 따라 발현되는 근육이 달라지며, 양팔을 동시에 운동하거나 한 팔씩
 번갈아가며 운동을 할 수도 있다.',
'* 운동 방법 *
1. 벤치에 앉아 다리는 골반 너비만큼 벌린 후 양손으로 덤벨을 잡고, 손바닥이 앞을 향하도록 한다.
2. 팔꿈치를 옆구리에 고정시키고 덤벨을 들어올린다.들어올리는 마지막 지점에서 손목이 바깥쪽을 향하도록 한다.
3. 천천히 이두근의 저항을 느끼며 덤벨을 내린다.',
'* Tip * 
전완이 지면과 수평을 이루는 시점에서부터 손목을 바깥쪽으로 돌려주는 것이 상완이두근을 더욱 자극시킬 수 있다.
목표 근육의 수축에 최대한 집중하기 위해 벤치에 앉아서 실시하는 것이 좋다.',
'* 주의 *
팔꿈치가 앞으로 나가지 않도록 고정시킨다.
덤벨이 몸 바깥쪽으로 벗어나지 않도록 한다.
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/덤벨 컬/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/덤벨 컬/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 4, '리버스 컬', '바벨',
'<h2>리버스 컬</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/리버스 컬/리버스 컬1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/리버스 컬/리버스 컬2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/리버스 컬/리버스 컬3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
상완이두근의 바깥쪽 부위를 발달시킬 수 있는 동작이다. 전완 신전근과 손목의 힘을 강화하는 데도 도움이 된다.',
'* 운동 방법 *
1. 바벨을 어깨너비로 손등이 앞으로 보이도록(오버 그립) 잡고 다리를 어깨너비만큼 벌리고 선다.
2. 팔꿈치를 옆구리에 고정시킨 상태에서 몸을 움직이지 말고 이두근 힘을 이용해 바벨을 들어올린다.
3. 손의 방향을 삼각근 전면을 향하도록 한다.
4. 천천히 이두근의 저항을 느끼면서 바벨을 내린다.',
'* Tip * 
이지바를 이용하면 손목의 부담을 줄일 수 있다.',
'* 주의 *
상체와 무릎의 반동을 이용하지 않는다.
팔꿈치가 앞으로 나가지 않도록 고정시킨다.
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/리버스 컬/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/리버스 컬/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 4, '바벨 컬', '바벨',
'<h2>바벨 컬</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/바벨 컬/컬 바벨 1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/바벨 컬/컬 바벨 2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/바벨 컬/컬 바벨 3.jpg">
<br><br>
* 운동 준비 자세 * 
허리를 곧게 펴고 서서 손을 어깨보다 약간 넓게 벌랜채 언더그립으로 바벨을 잡는다.
이때 복근과 허리,엉덩이에 힘을 단단히 주고 준비한다.
숨을 내쉬면서 팔꿈치를 구부려 바를 어깨 높이까지 들어 올리고,다시 숨을 들이쉬면서 바를 다시 팔 시작위치로 내린',
'* 운동 방법 *
1. 두 손으로 바벨을 어깨너비로 잡고 다리도 어깨너비만큼 벌리고 선다.
2. 팔꿈치를 옆구리에 고정시키고, 이두근의 힘을 이용해 바벨을 들어올린다.손의 방향은 삼각근 전면을 향하도록 한다.
3. 천천히 이두근의 저항을 느끼면서 바벨을 내린다.',
'* Tip * 
어깨보다 좁게 그립을 잡으면 상완이두근 바깥쪽 근육에 집중할 수 있다.
어깨보다 넓게 와이드 그립을 잡으면 상완이두근 안쪽 근육에 집중할 수 있다.
내릴때 긴장을 유지하고 천천히 내려야 운동효과가 배가된다.',
'* 주의 *
상체와 무릎의 반동을 이용하지 않는다.
팔꿈치가 앞으로 나가지 않도록 고정시킨다.
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/바벨 컬/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/바벨 컬/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/바벨 컬/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 4, '프리쳐 컬', '머신',
'<h2>프리쳐 컬</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/프리쳐 컬/프리쳐 컬1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/프리쳐 컬/프리쳐 컬2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/프리쳐 컬/프리쳐 컬3.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/프리쳐 컬/프리쳐 컬4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
상완이두근의 완전한 고립 운동을 목적으로 실시한다. 
다른 상완이두근 운동에 비해 상완이두근 안쪽 중간 부분을 좀 더 자극시킬 수 있다.',
'* 운동 방법 *
1. 프리쳐 벤치 위에 겨드랑이를 밀착시키고 양쪽 팔꿈치를 고정시킨다.
2. 엉덩이를 살짝 들어 양손으로 어깨너비 정도로 바벨을 잡고 벤치에 다시 앉는다.
3. 몸통을 최대한 움직이지 말고 이두근의 힘으로만 바벨을 위로 들어올린다.
4. 이두근의 저항을 느끼며 천천히 바벨을 내린다.',
'* Tip * 
덤벨이나 머신, 이지바(ez-bar)를 이용할 수 있다.',
'* 주의 *
어깨너비 정도로 팔꿈치 간격을 평행하게 유지하면서 들어올린다.
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/프리쳐 컬/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/프리쳐 컬/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 4, '해머 컬', '바벨',
'<h2>해머 컬</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/해머 컬/해머 컬1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/해머 컬/해머 컬2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/해머 컬/해머 컬3.jpg">
<br><br>
* 운동 준비 자세 * 
벤치에 앉아 다리는 골반 너비만큼 벌려준 후
덤벨을 잡고, 손바닥을 몸쪽으로 향하게 한다.
 팔꿈치를 옆구리에 고정시키고, 덤벨을
이두근의 힘으로 들어올려 준다.
 천천히 이두근의 저항을 느끼며 덤벨을 내린다.',
'* 운동 방법 *
1. 벤치에 앉아 다리는 골반 너비만큼 벌린 후 덤벨을 잡고, 손바닥을 몸쪽으로 향하게 한다.
2. 팔꿈치를 옆구리에 고정시키고, 덤벨을 이두근의 힘으로 들어올린다.
3. 천천히 이두근의 저항을 느끼며 덤벨을 내린다.',
'* Tip * 
시작 자세에서 팔을 완전혀 펴야 이두근을 최대로 이완시켜, 운동 동작시 모든 이두근이 운동에 적극적으로 참여하게 된다.
한 팔씩 교대로 들어주는 얼터네이트  컬을 통해 집중도를 높일 수 있다.
케이블 기구에서 로프를 이용하여 실시할 수 있다.',
'* 주의 *
팔꿈치가 앞으로 나가지 않도록 고정시킨다.
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/해머 컬/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 4, '케이블 컬', '케이블머신',
'<h2>케이블 컬</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/케이블 컬/케이블 컬1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/케이블 컬/케이블 컬2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/케이블 컬/케이블 컬3.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
케이블의 저항이 운동 시작 지점과 끝 지점까지 지속적으로 전해져 상완이두근의 근긴장을 유지하게 함으로서 더욱 큰 운동의 효과를 볼 수 있다.
더불어 다른 상완이두근 운동에 비해 선명도를 강화시킬 수 있다.',
'* 운동 방법 *
1. 케이블 바를 어깨너비로 잡고 무릎을 약간 굽힌다.
2. 팔꿈치를 옆구리에 고정시킨 후 케이블을 삼각근 전면 쪽으로 들어올린다.
3. 천천히 케이블의 저항을 느끼며 처음 자세로 돌아간다.',
'* Tip *
등과 허리를 견고히 하고, 무릎을 약간 굽혀주면 안정된 자세를 취할 수 있다.
한 팔씩 실시하는 원 핸드 케이블 컬 방식이 있으며, 케이블에 핸들 대신 로프를 달아 실시하는 케이블 해머 컬 방식도 있다.',
'* 주의 *
팔을 흔들어서는 안 된다.
수축 시 팔꿈치를 들어올리거나 양옆으로 빼지 않도록 한다.
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/케이블 컬/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Biceps/케이블 컬/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '딥스 벤치', '벤치',
'<h2>딥스 벤치</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/딥스 벤치/딥스 벤치1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/딥스 벤치/딥스 벤치2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/딥스 벤치/딥스 벤치3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
상완삼두근 전체를 발달시키는 데 매우 좋은 동작이다. 상해 예방을 위해서는 어깨관절에 부담을 느끼지 않는 범위 내에서 운동하는 것이 좋다.
집에서도 의자나 탁자를 이용하여 부담 없이 실시할 수 있다.',
'* 운동 방법 *
1. 팔로 지탱하며 엉덩이를 벤치에서 띄운다.
2. 팔이 수직이 될 때까지 굽히며 몸을 내린다.
3. 삼두근의 힘으로 팔꿈치를 펴면서 원위치한다.',
'* Tip *
무릎 위에 플레이트를 올려 운동 부하를 늘릴 수 있다.',
'* 주의 *
운동 중 팔꿈치가 옆으로 벌어지지 않도록 한다.
그립 간격은 어깨너비보다 좁게 잡지 않는다.
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/딥스 벤치/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '바벨 트라이셉스 익스텐션', '바벨',
'<h2>바벨 트라이셉스 익스텐션</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/바벨 트라이셉스 익스텐션/바벨 트라이셉스 익스텐션1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/바벨 트라이셉스 익스텐션/바벨 트라이셉스 익스텐션2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/바벨 트라이셉스 익스텐션/바벨 트라이셉스 익스텐션3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
팔 뒤쪽 상완삼두근의 근력을 증가시키고 삼두근의 안쪽 모양을 선명하게 만들어주는 운동이다. 
상완삼두근의 전체적인 근매스 증대에 효과적이기 때문에 정확한 자세로 운동해야 한다.',
'* 운동 방법 *
1. 벤치에 누워 머리 위로 어깨너비보다 좁은 간격으로 바벨을 잡는다.
2. 팔꿈치를 가슴 앞으로 펴면서 바벨을 들어올린다.손의 힘이 아닌 삼두근의 힘을 이용한다.
3. 얼굴이 아닌 정수리 위로 포물선을 그리며 천천히 팔꿈치를 구부리며 바벨을 내린다.',
'* Tip * 
디클라인 벤치에서 실시하면 가동 범위를 증가시킬 수 있다.',
'* 주의 *
팔꿈치가 양옆으로 벌어지지 않도록 해야 한다.
수축 시 고정된 팔꿈치가 움직이지 않도록 주의한다.
바벨을 머리 뒤로 내릴 때 허리가 과도하게 들리지 않도록 주의한다.
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/바벨 트라이셉스 익스텐션/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '덤벨 원암 익스텐션', '덤벨',
'<h2>덤벨 원암 익스텐션</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/덤벨 원암 익스텐션/덤벨 원암 익스텐션1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/덤벨 원암 익스텐션/덤벨 원암 익스텐션2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/덤벨 원암 익스텐션/덤벨 원암 익스텐션3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
상완삼두근 중 특히 장두 부분을 발달시키는 운동으로 중량 설정 시에는 고중량보다 저중량을 설정하여 반복횟수를 늘리는 것이 중요하다. 
탄력 있는 팔을 원하는 여성에게 추천되는 운동이다. 어깨에 힘이 과도하게 들어가지 않도록 주의하여 실시한다. 
벤치에 앉아서 실시하거나 또는 서서 하는 두 가지 방법 모두 가능하다.',
'* 운동 방법 *
1. 오른손으로 덤벨을 잡고 머리 위로 쭉 펴서 올린다.
2. 손바닥이 앞을 향하게 하고 왼손은 팔이 움직이지 않도록 받쳐준다.
3. 팔꿈치와 상완을 머리 옆에 고정시킨 후 저항을 느끼면서 팔꿈치를 서서히 구부린다.
4. 손의 힘이 아닌 삼두근의 힘으로 팔꿈치를 쭉 편다.반대쪽도 같은 방법으로 실시한다.',
'* Tip * 
한쪽 팔로만 실시할 때는 다른 팔로 팔꿈치를 고정시켜 지속적인 운동에 지장이 되지 않도록 한다.',
'* 주의 *
운동 중 팔꿈치가 움직이지 않도록 하며 어깨선 위에 고정시킨다.
팔꿈치를 옆으로 벌리지 않도록 한다.
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/덤벨 원암 익스텐션/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '오버 헤드 덤벨 익스텐션', '덤벨',
'<h2>오버 헤드 덤벨 익스텐션</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/오버헤드 덤벨 익스텐션/오버헤드 덤벨 익스텐션1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/오버헤드 덤벨 익스텐션/오버헤드 덤벨 익스텐션2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/오버헤드 덤벨 익스텐션/오버헤드 덤벨 익스텐션3.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/오버헤드 덤벨 익스텐션/오버헤드 덤벨 익스텐션4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
상완삼두근 중 특히 장두 부분을 발달시키기에 좋은 운동이다. 
벤치에 앉아서도 가능하고 일어서서도 가능하며, 상체가 덤벨의 반동으로 인해 흔들리지 않도록 하는 것이 중요하다.
탄력 있는 팔을 만들고 싶어하는 여성에게 추천하는 운동이다.',
'* 운동 방법 *
1. 다리는 어깨너비로 벌리고 덤벨의 한쪽을 두 손으로 포개어 잡는다.
2. 손바닥이 위쪽을 향하게 덤벨을 머리 위로 쭉 올린다.
3. 팔꿈치를 머리 측면에 고정시키고 팔꿈치를 구부리며 덤벨을 천천히 머리 뒤로 내린다.
4. 팔꿈치를 펴는 느낌으로 덤벨을 들어올려 원위치시킨다.',
'* Tip * 
이지바로 실시하면 삼두근의 깊은 쪽이 조금 더 많이 활성화된다.',
'* 주의 *
팔꿈치를 완전히 펴지 않도록 한다.
운동 중 팔꿈치가 움직이지 않도록 하며 팔꿈치는 어깨 위에 최대한 고정시킨다.
팔꿈치가 양옆으로 벌어지면 가동 범위가 줄어들어 운동 효과가 떨어진다. 
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/오버헤드 덤벨 익스텐션/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '덤벨 킥백', '덤벨',
'<h2>덤벨 킥백</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/덤벨 킥백/덤벨 킥백1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/덤벨 킥백/덤벨 킥백2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/덤벨 킥백/덤벨 킥백3.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/덤벨 킥백/덤벨 킥백4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
상완삼두근의 상부, 특히 바깥쪽 부분을 발달시키는 데 효과적인 운동이다. 
가벼운 중량으로 반복횟수를 늘려 정확한 자세로 근육의 긴장과 수축에 집중하는 것이 중요하다.
양손으로 실시하거나 벤치에 엎드려서 실시할 수 있으며, 보다 확실한 긴장과 
수축으로 상완삼두근의 발달을 도모하기 위해서는 한 팔씩 교대로 실시하는 방법이 추천된다.',
'* 운동 방법 *
1. 벤치에 왼쪽 무릎과 왼손을 대고 등을 곧게 펴고 지면과 수평이 되도록 엎드린다.
    오른쪽 무릎은 살짝 구부려준다
2. 오른손으로 덤벨을 잡고 이두근 안쪽을 옆구리에 고정시킨다.
3. 팔이 지면과 수평을 이룰 때까지 덤벨을 뒤로 들어올린 후 1~2초간 정지한다.
4. 천천히 저항을 느끼면서 덤벨을 내리며 처음 자세로 돌아온다.반대쪽도 같은 방법으로 실시한다.',
'* Tip * 
덤벨을 잡은 손이 어깨선과 나란하거나 약간 높은 위치에 있을 때 수축 효과가 더 크다.',
'* 주의 *
등이 지면과 수평에 가깝게 한다. 어깨가 과도하게 등 위로 올라가지 않도록 한다.
운동 중 팔은 옆구리에 붙이고 팔꿈치 각도가 90도 이하가 되지 않게 한다.
마지막 수축 시 3초간 유지하지 못하면 좀 더 가벼운 무게의 덤벨을 사용한다.
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/덤벨 킥백/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '케이블 트라이셉스 프레스 다운', '케이블 머신',
'<h2>케이블 트라이셉스 프레스 다운</h2>
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/케이블 트라이셉스 프레스 다운/케이블 트라이셉스 프레스 다운1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/케이블 트라이셉스 프레스 다운/케이블 트라이셉스 프레스 다운2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/케이블 트라이셉스 프레스 다운/케이블 트라이셉스 프레스 다운3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
상완삼두근 운동의 가동 범위를 최대로 활용하여 삼두근의 외측두를 발달시키는 데 효과적인 운동이다. 
상완삼두근 운동 중 가장 안정적인 자세로 실시할 수 있으며 다른 상완삼두근 운동과 비교했을때 
고중량에서도 안정된 자세를 유지하기에 최적의 운동이다.',
'* 운동 방법 *
1. 케이블 바를 어깨너비보다 좁게 잡고 무릎을 약간 굽힌다.
2. 팔꿈치를 옆구리에 고정시키고, 삼두근의 힘으로 팔꿈치를 아래쪽으로 편다.
3. 천천히 저항을 느끼면서 팔꿈치를 90도 정도로 구부린다.',
'* Tip * 
팔꿈치를 옆구리에 붙인 상태로 실시하면 외측부에 많은 자극이 주어진다.
팔꿈치를 앞으로 내밀거나 로프를 이용하면 삼두근 깊은 곳에 더 많은 자극이 주어진다.',
'* 주의 *
팔꿈치를 뒤로 빼지 않도록 한다.
이완시 몸을 앞으로 구부리지 않도록 한다.
팔꿈치가 양옆으로 벌어지지 않도록 한다.
<img src="/TOP/vt_DBInfo/images/Arms/Triceps/케이블 트라이셉스 프레스 다운/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '리버스 리스트 컬(덤벨)', '덤벨',
'<h2>리버스 리스트 컬(덤벨)</h2>
<img src="/TOP/vt_DBInfo/images/Arms/리버스 리스트 컬(덤벨)/리버스 리스트 컬1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/리버스 리스트 컬(덤벨)/리버스 리스트 컬2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/리버스 리스트 컬(덤벨)/리버스 리스트 컬3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
전완의 바깥쪽 근육을 발달시키는 운동이다. 벤치 가장자리나 무릎 위에 전완부를 고정시키고 손목의 움직임만으로 동작을 실시한다. 
테니스 엘보를 예방하는 데 추천되는 운동이다.',
'* 운동 방법 *
1. 벤치에 앉아 손등이 위쪽으로 향하게 덤벨을 잡고 허벅지 위에 전완부를 올려놓는다.
2. 손바닥을 바닥 쪽으로 구부리면서 덤벨을 내린다.
3. 손목을 위로 올려 덤벨을 들어올린다.',
'* Tip *
바벨을 이용하여 실시할 수도 있다.',
'* 주의 *
가동 범위의 증가를 위해 손목보다 팔꿈치를 좀 더 넓게 유지한다.
<img src="/TOP/vt_DBInfo/images/Arms/리버스 리스트 컬(덤벨)/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '리버스 리스트 컬(바벨)', '바벨',
'<h2>리버스 리스트 컬(바벨)</h2>
<img src="/TOP/vt_DBInfo/images/Arms/리버스 리스트 컬(바벨)/리버스 리스트 컬1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/리버스 리스트 컬(바벨)/리버스 리스트 컬2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/리버스 리스트 컬(바벨)/리버스 리스트 컬3.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/리버스 리스트 컬(바벨)/리버스 리스트 컬4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
전완의 바깥쪽 근육을 발달시키는 운동이다.
 벤치 가장자리나 무릎 위에 전완부를 고정시키고 손목의 움직임만으로 동작을 실시한다. 
테니스 엘보를 예방하는 데 추천되는 운동이다.',
'* 운동 방법 *
1. 무릎을 꿇고 벤치 앞에 앉는다.
2. 바벨을 어깨너비보다 약간 좁은 상태로 손등이 위를 향하게 잡고 벤치 위에 전완부를 올려놓는다.
3. 손목을 바닥 쪽으로 구부리면서 바벨을 내린다.
4. 손목을 위로 올려 바벨을 들어올린다.',
'* Tip *
덤벨을 이용하여 실시할 수 있다.',
'* 주의 *
가동 범위의 증가를 위해 손목보다 팔꿈치를 좀 더 넓게 유지한다.
<img src="/TOP/vt_DBInfo/images/Arms/리버스 리스트 컬(바벨)/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '리스트 컬(덤벨)', '덤벨',
'<h2>리스트 컬(덤벨)</h2>
<img src="/TOP/vt_DBInfo/images/Arms/리스트 컬(덤벨)/리스트 컬1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/리스트 컬(덤벨)/리스트 컬2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/리스트 컬(덤벨)/리스트 컬3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
전완의 안쪽 근육을 발달시키는 운동이다. 
벤치 가장자리나 무릎 위에 전완부를 고정시키고 손목의 움직임만으로 운동한다. 
바벨로 운동할 때보다 손목의 가동 범위가 넓은 것이 장점이다.',
'* 운동 방법 *
1. 벤치에 앉아 손바닥이 위쪽으로 향하게 덤벨을 잡고 허벅지 위에 전완부를 올려놓는다.
2. 손등을 바닥 쪽으로 구부리면서 덤벨을 내린다.
3. 손목을 위로 올려 덤벨을 들어올린다.',
'* Tip *
덤벨을 내릴 때 손가락을 펴서 덤벨을 더욱 아래로 가게 하면 운동 범위가 커져서 전완의 안쪽 근육을 더욱 강화시킬 수 있다.',
'* 주의 *
전완을 평행하게 유지한다.
<img src="/TOP/vt_DBInfo/images/Arms/리스트 컬(덤벨)/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '리스트 컬(바벨)', '바벨',
'<h2>리스트 컬(바벨)</h2>
<img src="/TOP/vt_DBInfo/images/Arms/리스트 컬(바벨)/리스트 컬1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/리스트 컬(바벨)/리스트 컬2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/리스트 컬(바벨)/리스트 컬3.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/리스트 컬(바벨)/리스트 컬4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
전완의 안쪽 근육을 발달시키는 운동이다. 
벤치 가장자리나 무릎 위에 전완부를 고정시키고 손목의 움직임만으로 운동한다. 
바벨로 운동할 때보다 손목의 가동 범위가 넓은 것이 장점이다.',
'* 운동 방법 *
1. 벤치에 앉아 손바닥이 위쪽으로 향하게 덤벨을 잡고 허벅지 위에 전완부를 올려놓는다.
2. 손등을 바닥 쪽으로 구부리면서 덤벨을 내린다.
3. 손목을 위로 올려 덤벨을 들어올린다.',
'* Tip *
덤벨을 내릴 때 손가락을 펴서 덤벨을 더욱 아래로 가게 하면 운동 범위가 커져서 전완의 안쪽 근육을 더욱 강화시킬 수 있다.',
'* 주의 *
전완을 평행하게 유지한다.
<img src="/TOP/vt_DBInfo/images/Arms/리스트 컬(바벨)/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '슈피네이션', '덤벨',
'<h2>슈피네이션</h2>
<img src="/TOP/vt_DBInfo/images/Arms/슈피네이션/슈피네이션1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/슈피네이션/슈피네이션2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/슈피네이션/슈피네이션3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
전완근을 돌리는 데(손등을 위로 가게 하는 데) 동원되는 근육의 힘을 발달시키며 
특히 손목 부상 후 재활 시 많이 사용되는 운동이다. 팔꿈치 각도를 90도로 유지하고 팔꿈치나 팔을 움직이지 않도록 해야 관련 근육의 발달을 극대화할 수 있다. 
덤벨 프로네이션과 함께 해주면 손목의 근육을 강화하는 데 한층 더 효과적이다',
'* 운동 방법 *
1. 벤치 앞에 무릎을 꿇고 앉아서 오른쪽 전완을 벤치 위에 올려놓고 손등이 위쪽을 향하도록 덤벨을 든다.
2. 이때 왼손으로 전완이 움직이지 않도록 잡아준다.
3. 천천히 손목을 바깥쪽으로 돌려서 덤벨의 끝부분이 위를 향하도록 한다.
4. 천천히 내려서 시작 자세로 돌아온다.반대쪽도 같은 방법으로 실시한다.',
'* Tip *
밴드를 이용하여 실시할 수도 있다.
골프 트레이닝 시 실시하면 좋다.
<img src="/TOP/vt_DBInfo/images/Arms/슈피네이션/운동부위1.jpg">
<br><br>', ' ');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '조트맨 컬', '덤벨',
'<h2>조트맨 컬</h2>
<img src="/TOP/vt_DBInfo/images/Arms/조트맨 컬/조트맨 컬1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/조트맨 컬/조트맨 컬2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/조트맨 컬/조트맨 컬3.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/조트맨 컬/조트맨 컬4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
상완이두근과 전완근의 힘을 키우는 운동이다. 
이두근 힘으로 덤벨을 올리고, 상완요골근의 힘을 이용해 이완한다.
 이두근과 상완요골근을 동시에 운동함으로써 운동 시간을 절약할 수 있다. 
부담 없이 할 수 있어 여성에게 추천되는 운동이다.',
'* 운동 방법 *
1. 바로 선 자세에서 손바닥을 몸쪽으로 향하게 덤벨을 잡는다.
2. 손바닥이 위쪽을 향하게 천천히 팔꿈치를 굽히면서 덤벨을 들어올린다.
3. 손목을 돌려서 손바닥이 앞을 향하게 한다.
4. 천천히 덤벨을 내려 시작 자세로 돌아간다.',
'* Tip *
상완요골근의 힘을 이용해 내리는 속도를 조절한다.',
'* 주의 *
가동 범위의 증가를 위해 손목보다 팔꿈치를 좀 더 넓게 유지한다.
<img src="/TOP/vt_DBInfo/images/Arms/조트맨 컬/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 5, '프로네이션', '덤벨',
'<h2>프로네이션</h2>
<img src="/TOP/vt_DBInfo/images/Arms/프로네이션/프로네이션1.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/프로네이션/프로네이션2.jpg">
<img src="/TOP/vt_DBInfo/images/Arms/프로네이션/프로네이션3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
전완근을 돌리는 데(손바닥을 위로 가게 하는 데) 동원되는 근육의 힘을 발달시키며 
특히 손목 부상 후 재활 시 많이 사용되는 운동이다. 
팔꿈치의 각도를 90도로 유지하고 팔꿈치나 팔이 움직이지 않도록 해야 관련 근육의 발달을 최대화할 수 있다.
덤벨 슈피네이션과 함께 해주면 손목의 근육을 강화하는 데 한층 더 효과적이다.',
'* 운동 방법 *
1. 벤치 앞에 무릎을 꿇고 앉아 오른쪽 전완을 벤치 위에 올려놓고 손바닥이 위쪽을 향하도록 덤벨을 든다.
2. 이때 왼손으로 전완이 움직이지 않도록 잡아준다.
3. 천천히 손목을 돌려서 덤벨의 끝부분이 위를 향하도록 한다.
4. 천천히 내려서 시작 자세로 돌아온다.반대쪽도 같은 방법으로 실시한다.',
'* Tip *
밴드를 이용하여 실시할 수도 있다.
골프 트레이닝 시 실시하면 좋다
<img src="/TOP/vt_DBInfo/images/Arms/프로네이션/운동부위1.jpg">
<br><br>', ' ');
insert into vt_exercise values(vt_exercise_seq.nextval, 6, '숄더 프레스(머신)', '머신',
'<h2>숄더 프레스(머신)</h2>
<img src="/TOP/vt_DBInfo/images/Shoulder/숄더 프레스(머신)/숄더 프레스(머신)1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/숄더 프레스(머신)/숄더 프레스(머신)2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/숄더 프레스(머신)/숄더 프레스(머신)3.jpg">
<br><br>
* 운동 준비 자세 * 
처음 자리를 잡으실 때
손잡이가 어깨에 중간쯤에 오도록 앞뒤 간격을 조절합니다.
그리고 팔꿈치의 각도가 90도가 되도록 팔의 넓이를 조절하여 손잡이를 잡습니다.
손잡이를 너무 꽉 잡지 않는게 좋다.
이 운동의 핵심은 최대한 어깨에만 힘을 주는 것입니다.',
'* 운동 방법 *
1. 머신에 앉아 엉덩이와 어깨를 벤치에 밀착시킨다.어깨너비 두 배 정도로 양손을 벌린 상태에서 손바닥이 앞을 향하도록 바를 잡는다.
2. 손으로 밀지 말고 어깨로 드는 느낌으로 중량을 밀어 올린다.
3. 저항을 느끼면서 서서히 바가 귀와 평행하게 될 때까지 내린다.',
'* Tip * 
반동을 아에 이용하지 않는건 좋지 않다는 점입니다.
힘이 든다면 약간의 반동을 이용하는것도 좋지만,
처음부터 반동을 줘서 바벨을 들어올리지 않고,
힘이 들때 살짝살짝씩 이용해주면 된다.',
'* 주의 *
팔꿈치를 완전히 펴면 삼각근에 자극이 풀어지게 되므로 완전히 신전하지 않는다.
수평바를 이용하면 삼각근에 자극이 집중되고, 수직바를 이용하면 보조근인 삼두근에 자극을 증가시킬 수 있다.
<img src="/TOP/vt_DBInfo/images/Shoulder/숄더 프레스(머신)/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/숄더 프레스(머신)/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/숄더 프레스(머신)/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 6, '바벨 숄더 프레스', '바벨',
'<h2>바벨 숄더 프레스</h2>
<img src="/TOP/vt_DBInfo/images/Shoulder/바벨 숄더 프레스/바벨 숄더 프레스1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/바벨 숄더 프레스/바벨 숄더 프레스2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/바벨 숄더 프레스/바벨 숄더 프레스3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
삼각근의 전면과 측면의 볼륨을 키울 수 있는 운동이다.
머신과 비교해 전후 방향으로 작용하는 힘에 저항하게 되므로 
근 발달에는 조금 더 효과적이나 안정성이 떨어진다. 전면 및 측면 삼각근의 
단면적을 키우는 데 가장 효과적인 운동법이다.',
'* 운동 방법 *
1. 선 상태에서 어깨너비 두 배 정도로 바벨을 잡고 발은 어깨너비만큼 벌린다.가슴 위쪽으로 바벨을 올린다.
2. 가슴에서부터 머리 위로 바벨을 들어올린다.
3. 어깨에 저항을 느끼면서 바가 귀와 수평이 될 때까지 바벨을 내린다.
4. 가슴에서 머리까지 바벨을 들어올리고 내리는 동작을 반복한다.',
'* Tip * 
서 실시할 경우 복근, 요부근, 하체 등 전신 근력 발달을 촉진할 수 있다.
앉아서 실시하면 보다 삼각근에 집중할 수 있고 좀 더 많은 중량을 다룰 수 있다.
무릎을 살짝 구부리면 반동을 줄일 수 있다.',
'* 주의 *
팔꿈치가 벌어지면 보조근인 삼두근의 작용이 커지므로 전완이 평행하도록 유지한다.
상체는 가능한 중립적인 자세를 유지한다.
<img src="/TOP/vt_DBInfo/images/Shoulder/바벨 숄더 프레스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/바벨 숄더 프레스/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/바벨 숄더 프레스/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 6, '비하인드 넥 프레스', '머신',
'<h2>비하인드 넥 프레스</h2>
<img src="/TOP/vt_DBInfo/images/Shoulder/비하인드 넥 프레스/비하인드 넥 프레스1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/비하인드 넥 프레스/비하인드 넥 프레스2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/비하인드 넥 프레스/비하인드 넥 프레스3.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/비하인드 넥 프레스/비하인드 넥 프레스4.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
바가 목 뒤로 넘어가도록 동작하여 전면 삼각근만을 고립시켜 선택적으로 자극을 가하는 운동이다.
프리 웨이트에 비해 안정적이긴 하지만 관절이 불안정한 상태에서 하는 운동이므로 어깨 운동에 익숙한 경우에 실시한다.',
'* 운동 방법 *
1. 벤치에 앉아 허리와 어깨와 바를 수직으로 맞춘다.
2. 어깨너비 두 배 정도로 바벨을 잡고, 잠금장치를 풀어 바벨을 어깨와 수직이 되게 들어올린다.
3. 이때 팔꿈치를 완전히 펴지 말고 약간 굽힌 상태까지 들어올린다.
4. 뒷머리를 스치듯이 귀와 평행이 될 때까지 저항을 느끼면서 바를 내린다.
5. 어깨를 들어올리는 느낌으로 머리 위로 바를 밀어준다.',
'* Tip *
서서 실시할 경우 복근, 요부근, 하체 등 전신 근력 발달을 촉진할 수 있다.
앉아서 실시하면 보다 삼각근에 집중할 수 있고 좀 더 많은 중량을 다룰 수 있다.
머신에서 실시하는 만큼 양쪽에 같은 부하가 느껴질 수 있도록 집중한다.',
'* 주의 *
바를 지나치게 뒤로 보내면 어깨 관절에 손상이 발생할 수 있으므로 가능한 머리 바로 뒤에서 동작할 수 있도록 한다.
목의 정형외과적 문제가 있는 경우 숄더 프레스로 대체한다.
허리가 지나치게 꺾어지지 않도록 유의한다.
<img src="/TOP/vt_DBInfo/images/Shoulder/비하인드 넥 프레스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/비하인드 넥 프레스/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/비하인드 넥 프레스/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 6, '바벨 업라이트 로우', '바벨',
'<h2>바벨 업라이트 로우</h2>
<img src="/TOP/vt_DBInfo/images/Shoulder/바벨 업라이트 로우/바벨 업라이트 로우1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/바벨 업라이트 로우/바벨 업라이트 로우2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/바벨 업라이트 로우/바벨 업라이트 로우3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
승모근과 전면 및 측면 삼각근을 발달시키는 데 좋은 운동이다. 
볼륨을 키우는 프레스 계열의 운동과 선명도를 높이는 레이즈 계열 운동의 중간 타입의 운동으로 볼 수 있다. 
그립을 좁게 잡으면 전면 삼각근을 강조하여 어깨와 가슴의 경계를 뚜렷하게 하는 효과가 있고, 바를 넓게 잡게 되면 측면 삼각근의 동원 비율을 좀 더 높 일 수 있다.',
'* 운동 방법 *
1. 바벨을 어깨너비보다 좁게 잡고 허벅지 앞에 위치시킨다.
2. 팔꿈치가 어깨와 평행이 되도록 바벨을 턱 쪽으로 끌어올린다.
3. 천천히 저항을 느끼면서 허벅지 앞으로 바벨을 내린다.',
'* Tip * 
이지바를 사용하면 손목이 지나치게 꺾이는 것을 방지할 수 있다.
바벨로 실시하는 것이 가장 기본적인 방법이며, 케이블이나 덤벨로도 실시할 수 있다.',
'* 주의 *
바벨이 몸에서 멀어지거나 팔꿈치를 지나치게 높이 올리게 되면 어깨 관절에 무리가 발생할 수 있다.
래터럴 레이즈와 마찬가지로 흉곽이 넓어지는 동작, 즉 팔이 올라가는 동작에 숨을 들이마시도록 한다.
<img src="/TOP/vt_DBInfo/images/Shoulder/바벨 업라이트 로우/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/바벨 업라이트 로우/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 6, '덤벨 숄더 프레스', '덤벨',
'<h2>덤벨 숄더 프레스</h2>
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 숄더 프레스/덤벨 숄더 프레스1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 숄더 프레스/덤벨 숄더 프레스2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 숄더 프레스/덤벨 숄더 프레스3.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 숄더 프레스/덤벨 숄더 프레스4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
삼각근의 전면과 측면의 볼륨과 선명도를 증가시킬 수 있는 운동이다. 바벨 프레스에 비해 어깨의 완전한 가동 범위로 운동할 수 있는 장점이 있다.
전후 또는 좌우 방향의 힘이 추가되어 삼각근의 균형적인 발달을 극대화시킬 수 있다. 
하지만 그만큼 컨트롤이 어려워 중량을 많이 다룰 수 없기 때문에 근육 크기 발달에 있어서는 바벨 운동이 더 효과적이다.',
'* 운동 방법 *
벤치에 앉아 등과 허리를 곧게 편다.
덤벨이 귀와 수평이 되고 팔꿈치가 직각이 되도록 위치시킨다.
이두근이 귀에 닿는 느낌으로 덤벨을 머리 위로 들어올린다.
천천히 저항을 느끼면서 덤벨이 귀와 수평될 때까지 내린다.',
'* Tip * 
덤벨이 서로 부딪히거나 팔꿈치가 완전히 펴지게 되면 목표 근육에 힘을 유지할 수 없게 되므로 주의하여 동작한다.
팔꿈치가 몸 앞쪽으로 나오게 되면 삼각근 전면과 측면에 자극이 되고, 팔꿈치가 상체와 평행한 위치에 오게 되면 삼각근 전면의 고립 운동이 된다.',
'* 주의 *
덤벨이 지나치게 몸쪽이나 바깥쪽으로 나가면 주변 근육의 상해의 위험이 있으므로 주의한다.
덤벨이 뒤쪽으로 넘어가게 되면 어깨를 바깥쪽으로 돌아가게 하여 탈구의 위험이 증가하게 되므로 주의한다.
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 숄더 프레스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 숄더 프레스/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 숄더 프레스/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 6, '덤벨 쉬러그', '덤벨',
'<h2>덤벨 쉬러그</h2>
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 쉬러그/덤벨 쉬러그1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 쉬러그/덤벨 쉬러그2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 쉬러그/덤벨 쉬러그3.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
승모근 상부를 발달시키기 위한 운동이다.
승모근은 높은 중량에 반응하여 발달하므로 고중량을 이용해 운동하도록 한다.
어깨너비나 근육에 비해 지나치게 발달하게 되면 산 모양의 어깨를 형성하게 되므로 운동량을 조절할 필요가 있다.',
'* 운동 방법 *
1. 어깨너비로 서서 양손에 덤벨을 들고 허벅지 옆에 위치시킨다.
2. 고개를 약간 숙이고 어깨를 귀에 붙인다는 느낌으로 최대한 어깨를 끌어올린다.
3. 천천히 저항을 느끼면서 어깨를 내리고 처음 자세로 돌아간다.',
'* Tip *
수축 동작 시 팔꿈치를 약간 굽혀주면 승모근을 최대로 수축시킬 수 있다.',
'* 주의 *
고개를 지나치게 숙이게 되면 등 상부 근육의 동원이 증가하게 되므로 중립적인 자세를 유지한다.
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 쉬러그/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 쉬러그/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 6, '덤벨 프론트 레이즈', '덤벨',
'<h2>덤벨 프론트 레이즈</h2>
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 프론트 레이즈/덤벨 프론트 레이즈1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 프론트 레이즈/덤벨 프론트 레이즈2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 프론트 레이즈/덤벨 프론트 레이즈3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
삼각근의 선명도를 높일 수 있는 단관절 운동 중 전면 삼각근을 발달시키기 위한 운동이다. 
프레스 동작과 달리 자극시키는 근육의 범위를 제한할 수 있고, 목표 부위의 수축에 집중할 수 있다는 장점이 있다.
 낮은 저항에 반응하는 근섬유들을 자극하기 위해 저중량, 고반복으로 실시한다.',
'* 운동 방법 *
1. 어깨너비로 발을 벌리고 덤벨을 들어 손등이 앞을 보게 하면서 허벅지 앞에 위치시킨다.
2. 팔꿈치를 살짝 구부려 고정시킨 후 덤벨을 어깨높이만큼 앞으로 들어올린다.
3. 다시 저항을 느끼면서 허벅지 앞쪽으로 덤벨을 내린다.',
'* Tip * 
몸의 중심선 방향을 향해 덤벨을 들어올리면 전면 삼각근을 최대로 수축시킬 수 있다.
초보자나 여성의 경우 덤벨보다 밴드 이용을 권장한다.
덤벨, 바벨, 케이블을 이용하여 실시할 수 있으며 인클라인 벤치를 이용해 강도를 높일 수 있다.',
'* 주의 *
어깨에 통증이 발생할 경우 손이 마주보도록 덤벨을 잡고 운동한다.
<img src="/TOP/vt_DBInfo/images/Shoulder/덤벨 프론트 레이즈/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 6, '아놀드 프레스', '덤벨',
'<h2>아놀드 프레스</h2>
<img src="/TOP/vt_DBInfo/images/Shoulder/아놀드 프레스/아놀드 프레스1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/아놀드 프레스/아놀드 프레스2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/아놀드 프레스/아놀드 프레스3.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/아놀드 프레스/아놀드 프레스4.jpg">
<br><br>
* 운동 준비 자세 * 
벤치에 않아서 상체를 곧게 펴준 상태로 적당한 중량의 덤벨을 준비하고
준비된 덤벨을 손에 쥐고 손바닥이 보이도록 눈높이까지 팔꿈치를 구부려 들어 올리면 된다.',
'* 운동 방법 *
1. 벤치에 앉아 등과 허리를 곧게 편다.
2. 손등이 앞을 향하게 하여 덤벨을 얼굴 앞으로 들어올린다.
3. 손목을 몸 바깥쪽으로 회전시키면서 덤벨을 머리 위로 들어올린다.
4. 손목을 몸 안쪽으로 회전시키면서 다시 얼굴 앞으로 덤벨을 내린다.',
'* Tip * 
앉아서 실시하면 보다 삼각근을 집중하여 단련할 수 있다.
수축 동작의 마지막 부분에서 전완을 돌리는 것이 삼각근에 가해지는 자극을 크게 할 수 있다.',
'* 주의 *
덤벨이 몸 바깥쪽으로 나가게 되면 어깨 근육에 손상이 발생할 수 있으므로 전완이 바닥과 수직인 상태를 유지한다.
수평바를 이용하면 삼각근에 자극이 집중되고, 수직바를 이용하면 보조근인 삼두근에 자극을 증가시킬 수 있다.
<img src="/TOP/vt_DBInfo/images/Shoulder/아놀드 프레스/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/아놀드 프레스/운동부위2.jpg">
<img src="/TOP/vt_DBInfo/images/Shoulder/아놀드 프레스/운동부위3.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '니업 시티드', '벤치',
'<h2>니업 시티드</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/니업 시티드/니업 시티드1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/니업 시티드/니업 시티드2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/니업 시티드/니업 시티드3.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
브이업 동작에서 상체 동작을 배제한 것으로 이해하면 된다.
벤치에 앉아서 실시하는 동작으로 팔로 상체를 지지한 상태에서 다리를 가슴 쪽으로 끌어당겨 하복부를 발달시킨다.',
'* 운동 방법 *
1. 벤치에 앉아 두 손을 뒤로 하여 엉덩이와 손의 간격이 25cm 정도로 벤치를 잡는다.이때 몸은 뒤로 30도쯤 기울인다.
2. 다리를 들어올리면서 무릎을 살짝 구부린다.등을 둥글게 말아 올리면서 가슴은 아래쪽으로, 무릎은 가슴 쪽으로 수축시킨다.마지막 정점에서 잠시 멈춘다.
3. 천천히 저항을 느끼며 원위치한다.',
'* Tip *
체중을 이용한 동작이 쉬워지면 발목에 모래주머니를 채워 강도를 높인다',
'* 주의 *
무게중심이 뒤로 두어 중심을 잃지 않도록 하며 복부에 긴장감을 유지한다.
<img src="/TOP/vt_DBInfo/images/Abdominal/니업 시티드/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/니업 시티드/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '레그 레이즈', '벤치',
'<h2>레그 레이즈</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/레그 레이즈/레그레이즈1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/레그 레이즈/레그레이즈2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/레그 레이즈/레그레이즈3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
하복부를 단련하는 대표적인 운동이다. 다리를 들어올리는 근육의 힘을 이용하여 동작하는 운동이다. 
복근의 힘이 약한 상태에서 운동하게 되면 허리가 지나치게 바닥에서 떨어지게 되어 무리가 될 수 있으므로 
사전에 복근의 힘을 키워 놓은 상태에서 실시하는 것이 바람직하다.',
'* 운동 방법 *
1. 벤치에 누워 벤치 윗부분을 두 손으로 잡는다.
2. 다리를 들어올린 후 무릎을 살짝 구부린다.골반을 가슴 쪽으로 말아 올린다.
3. 저항을 느끼며 다시 원위치한다.',
'* Tip * 
처음에는 머리 위의 지지대를 잡고 실시하며, 점차 익숙해지면 양쪽 다리 옆에 손을 대고 
복근의 힘으로만 동작할 수 있도록 한다.',
'* 주의 *
다리를 내리는 동작에서 골반을 고정시키지 못하면 허리가 지나치게 뜨게 되어 무리가 될 수 있으므로 주의한다.
<img src="/TOP/vt_DBInfo/images/Abdominal/레그 레이즈/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '사이드 밴드', '덤벨',
'<h2>사이드 밴드</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/사이드 밴드/사이드 밴드1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/사이드 밴드/사이드 밴드2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/사이드 밴드/사이드 밴드3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
내복사근과 외복사근을 발달시킬 수 있는 운동이다. 한쪽 손에 덤벨을 들고 실시하며, 덤벨을 든 쪽으로 상체를 구부렸다가 펴는 동작으로 되어 있다. 
여성에게 추천되는 운동이다.',
'* 운동 방법 *
1. 골반 너비로 서서 오른손에 덤벨을 들고 왼손은 머리 뒤에 댄다.
2. 왼쪽 옆구리가 스트레칭되는 것을 느끼며 덤벨을 든 오른쪽으로 상체를 기울인다.
3. 다시 왼쪽 옆구리가 수축이 되는 것을 느끼며 덤벨을 들어올려 처음 자세로 돌아온다.
4. 반대쪽도 같은 방법으로 실시한다.',
'* Tip * 
다리를 너무 넓게 벌리지 않도록 하며 한쪽 발을 좀 더 높은 곳(플레이트 1~2개 정도)에 위치시킨 후
실시하면 좀 더 큰 자극을 느낄 수 있다.
케이블을 이용하면 가동 범위를 증가시킬 수 있고 동작의 모든 범위에서 동일한 부하를 가할 수 있다.',
'* 주의 *
운동시 골반이 좌우로 움직이지 않도록 주의한다.
수축 동작 시 상체가 중심선을 넘어가지 않는 범위까지만 동작한다.
<img src="/TOP/vt_DBInfo/images/Abdominal/사이드 밴드/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '싯 업', '맨몸운동',
'<h2>싯업</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/싯업/싯업1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/싯업/싯업2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/싯업/싯업3.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/싯업/싯업4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
가장 일반적으로 할 수 있는 복근 운동이다. 앉았다 누웠다를 반복하는 동작이므로 복근과 다리를 들어올리는 근육을 발달시킬 수 있다.',
'* 운동 방법 *
1. 바닥에 누워 무릎을 구부리고 발이 바닥과 떨어지지 않도록 한다.
2. 양손을 귀에 대고 복부에 힘을 주면서 고개를 살짝 든다.
3. 팔꿈치가 무릎에 닿을 정도까지 등을 둥글게 구부리면서 상체를 일으킨다.
4. 복근에 힘이 풀어지지 않도록 천천히 긴장하면서 원위치한다.',
'* Tip * 
디클라인 벤치에서 실시할 수 있으며 외복사근 강화를 위해 몸을 비틀면서 실시할 수 있다.',
'* 주의 *
복근의 힘이 충분하지 못한 상태에서 실시하게 되면 허리에 통증을 유발할 수 있다.
<img src="/TOP/vt_DBInfo/images/Abdominal/싯업/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '행잉 레그 레이즈', '철봉',
'<h2>행잉 레그 레이즈</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/행잉 레그 레이즈/행잉 레그 레이즈1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/행잉 레그 레이즈/행잉 레그 레이즈2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/행잉 레그 레이즈/행잉 레그 레이즈3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
하복부의 단련을 위해 실시하는 강도가 높은 운동 방법 중 하나이다. 몸 전체가 매달려 있는 상태이기 때문에 몸의 균형을 유지하는 것이 중요하다.',
'* 운동 방법 *
1. 철봉에 매달려 몸을 펴고 무릎을 약간 구부린다.
2. 무릎을 최대한 가슴 쪽으로 끌어당긴다는 생각으로 하복부를 수축한다.  마지막 정점에서 잠시 멈춘다.
3. 몸에 반동이 생기지 않도록 주의하면서 천천히 다리를 내린다.',
'* Tip * 
처음엔 무릎을 구부린 상태에서 실시하고 익숙해지면 다리를 편 상태에서 실시하여 강도를 높이도록 한다.',
'* 주의 *
초보자의 경우엔 실시하지 않도록 한다.
다리를 위로 들어올리는 것보다 하복부 힘을 이용해 가슴 쪽을 향하도록 한다.
수축 시 상체가 흔들리지 않도록 균형을 유지하고 복부 주변 근육에 힘을 집중한다.
<img src="/TOP/vt_DBInfo/images/Abdominal/행잉 레그 레이즈/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/행잉 레그 레이즈/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '브이 업', '철봉',
'<h2>브이 업</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/브이 업/브이업1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/브이 업/브이업2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/브이 업/브이업3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
상체와 하체를 동시에 들어올리는 동작으로 균형 감각이 요구된다.
짧은 시간 안에 상복부와 하복부를 동시에 발달시키기에 효과적인 운동이다.',
'* 운동 방법 *
1. 바닥에 누운 자세에서 무릎을 살짝 구부리고 팔을 가슴 위로 쭉 편다.
2. 상체와 다리가 V자 모양이 되도록 상체를 일으켜 세우면서 동시에 다리를 들어올린다.이때 팔은 다리와 평행이 되도록 뻗는다.
등이 바닥과 약 45도에서 60도가 되게 유지한 채로 최고 지점에서 잠시 멈춘다.
3. 다시 천천히 시작 자세로 돌아온다.',
'* Tip *
동시에 일어나며 상하복부의 힘을 이용하기에 여러 번의 반복횟수보다 정확한 자세가 더욱 중요하다.
처음엔 의자에 비스듬히 앉아 상체를 등받이에 지지한 상태에서 균형 잡는 연습을 한 후 익숙해지면 매트에서 실시하도록 한다.
팔과 다리가 이루는 각도가 작아질수록 운동의 강도가 증가하게 된다.',
'* 주의 *
운동 강도가 다소 높은 복근 운동으로 정확한 자세를 통해 복부에 집중될 수 있도록 한다.
<img src="/TOP/vt_DBInfo/images/Abdominal/브이 업/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '다리 교차 뛰기', '맨몸운동',
'<h2>다리 교차 뛰기</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/다리교차뛰기/다리교차뛰기1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/다리교차뛰기/다리교차뛰기2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/다리교차뛰기/다리교차뛰기3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
하체 근력을 키우고 칼로리 소모도 높여주는 유산소성 근력 운동이다.
엎드린 상태로 양발을 교차하는 동작은 복부 근육에 자극을 주어 뱃살을 빼는 데도 큰 도움을 준다.',
'* 운동 방법 *
1. 양손을 바닥에 대고 엎드린다.
2. 오른쪽 무릎을 가슴 쪽으로 당겨준다.
3. 마치 달리기를 하듯이 왼쪽 무릎을 가슴으로 당기면서 동시에 오른쪽 발을 뒤로 이동한다.
4. 양쪽 다리를 빠르게 교차하며 동작을 반복한다.',
'* Tip *
빠르게 움직일수록 칼로리 소모가 높아진다.',
'* 주의 *
무릎을 과도하게 가슴 쪽으로 가져와 허리가 구부러지지 않도록 유의한다.
달리는 듯한 동작 시, 복부에 힘을 주어 발가락 부상에 주의한다.
<img src="/TOP/vt_DBInfo/images/Abdominal/다리교차뛰기/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/다리교차뛰기/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '리버스 크런치', '벤치',
'<h2>리버스 크런치</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/리버스 크런치/리버스 크런치1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/리버스 크런치/리버스 크런치2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/리버스 크런치/리버스 크런치3.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/리버스 크런치/리버스 크런치4.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
복직근 중 하부를 단련시키는 운동이다.
크런치와 반대되는 동작으로 상체를 들어올리는 대신 다리를 들어올림으로써 하복부를 강화할 수 있다.',
'* 운동 방법 *
1. 벤치에 누워 벤치 윗부분을 양손으로 잡는다.
2. 다리를 들고 무릎을 살짝 구부린다.
3. 허리가 벤치 바닥에서 10cm 정도 떨어질 때까지 골반을 둥글게 말아 올린다.
4. 하복부의 긴장을 유지하면서 다리를 천천히 내리며 원위치한다.',
'* Tip *
하복부에 힘을 이용해 골반을 가슴 쪽으로 최대한 수축시키도록 한다.
인클라인 벤치를 이용하면 강도를 높일 수 있다.',
'* 주의 *
동작 간 복부의 긴장이 풀어지지 않도록 한다.
<img src="/TOP/vt_DBInfo/images/Abdominal/리버스 크런치/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '사이드 크런치', '맨몸운동',
'<h2>사이드 크런치</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/사이드 크런치/사이드 크런치1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/사이드 크런치/사이드 크런치2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/사이드 크런치/사이드 크런치3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
외복사근을 발달시킬 수 있는 운동이다.
복사근 중 외복사근에만 선택적으로 집중할 수 있는 운동이다.',
'* 운동 방법 *
1. 바로 누운 후에 몸을 45도 정도 옆으로 돌리면서 오른팔을 바닥에 붙이고 무릎을 90도로 굽힌다.
2. 다리는 왼쪽은 세우고 오른쪽은 바닥에 편히 내리며 양발은 서로 밀착시킨다.
3. 왼손으로 귀를 감싸고 머리를 들어올린다.
4. 왼쪽 팔꿈치와 왼쪽무릎이 닿는 느낌으로 옆구리를 수축한다.
5. 천천히 저항을 느끼면서 내려간다.반대쪽도 같은 방법으로 실시한다.',
'* Tip *
복부에 계속되는 긴장감을 유지할 수 있도록 집중한다.',
'* 주의 *
동작 간 상체와 바닥이 이루는 각도가 변하지 않도록 주의한다.
<img src="/TOP/vt_DBInfo/images/Abdominal/사이드 크런치/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '엎드려 점프', '맨몸운동',
'<h2>엎드려 점프</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/엎드려 점프/엎드려 점프1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/엎드려 점프/엎드려 점프2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/엎드려 점프/엎드려 점프3.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
하복부 지방을 태우고 근력을 키우는 데 효과적인 유산소성 근력 운동이다.
엎드려 점프는 상체를 고정시킨 자세에서 양쪽 다리를 벌려 앞뒤로 뛰는 동작으로 아랫배에 지방이 많은 여성들에게 추천한다. 
대표적인 하복부 운동 중 하나인 레그 레이즈 동작을 실시한 다음에 이어서 진행하면 더욱 만족스러운 효과를 얻을 수 있다.',
'* 운동 방법 *
1. 양손을 바닥에 대고 엎드린 상태에서 두 발은 어깨너비보다 약간 넓게 벌린다. 이때 엉덩이가 어깨 높이보다 높게 올라가지 않도록 한다.
2. 손은 바닥에 고정하고 양발을 동시에 가슴 쪽으로 점프해 몸을 반으로 접는다.
3. 다시 배가 바닥에 닿는 느낌으로 두 발을 뒤로 점프한다. 동작을 반복한다.',
'* Tip *
발을 앞으로 점프해 엉덩이를 들어 올릴 때 복부근육을 수축시키고, 뒤로 점프 하면서 복부근육을 이완시킨다.
무릎을 펴면 펼수록 복부에 가해지는 자극이 커진다.',
'* 주의 *
허리 및 발가락 부상에 유의한다.
<img src="/TOP/vt_DBInfo/images/Abdominal/엎드려 점프/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '오블리크 크런치', '맨몸운동',
'<h2>오블리크 크런치</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/오블리크 크런치/오블리크 크런치1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/오블리크 크런치/오블리크 크런치2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/오블리크 크런치/오블리크 크런치3.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/오블리크 크런치/오블리크 크런치4.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
내복사근과 외복사근을 발달시킬 수 있는 운동이다.
발을 붙이고 무릎을 90도 정도 구부린 기본적인 크런치 자세에서 무릎을 한 방향으로 넘겨 바닥에 붙인 
상태로 크런치와 동일한 방법으로 실시한다',
'* 운동 방법 *
1. 바닥에 누워 다리를 구부리고 무릎을 모은 다음, 몸을 오른쪽으로 튼 상태에서 오른팔을 바닥에 붙인다.
2. 왼손을 귀 뒤에 대고 고개를 든다.
3. 옆구리가 수축되는 느낌으로 어깨를 천천히 들어올린다.마지막 정점에서 잠시 멈춘다.
4. 천천히 어깨를 바닥으로 내린다.반대쪽도 같은 방법으로 실시한다.',
'* Tip *
유연성이 부족할 경우 무릎 밑에 쿠션을 받쳐 하체의 위치를 고정하도록 한다.',
'* 주의 *
무릎이 바닥에서 떨어지지 않도록 주의한다.
하체를 넘긴 방향 쪽 어깨를 들어올린다는 생각으로 동작한다.
<img src="/TOP/vt_DBInfo/images/Abdominal/오블리크 크런치/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/오블리크 크런치/운동부위2.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '크런치', '맨몸운동',
'<h2>크런치</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/크런치/크런치1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/크런치/크런치2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/크런치/크런치3.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/크런치/크런치4.jpg">
<br><br>
* 운동 준비 자세 / 개요 *
복직근 중 상부를 강화하는 운동이다.
허리 부분이 바닥에서 떨어지지 않는다는 것이 싯업과 다른 점이다.
근육을 수축시킬 때뿐만 아니라 이완될 때도 복부에 긴장을 유지하는 것이 중요하다.',
'* 운동 방법 *
1. 바닥에 누워 무릎을 구부리고 발이 바닥과 떨어지지 않도록 한다.
2. 양손을 귀에 대고 복부에 힘을 주면서 고개를 살짝 든다.
3. 어깨가 바닥에서 약 10cm 떨어지도록 등을 둥글게 구부리면서 상복부를 수축한다.
4. 상복부의 긴장을 느끼면서 천천히 몸통을 바닥으로 눕힌다.이때 머리가 완전히 바닥에 닿지 않도록 한다.',
'* Tip *
상체를 올리는 동작에서 호흡을 내쉬며 근육을 짜는 듯한 느낌을 느껴야 한다.',
'* 주의 *
동작 간 복부의 긴장이 풀어지지 않도록 한다.
<img src="/TOP/vt_DBInfo/images/Abdominal/크런치/운동부위1.jpg">
<br><br>');
insert into vt_exercise values(vt_exercise_seq.nextval, 7, '크로스 크런치', '맨몸운동',
'<h2>크로스 크런치</h2>
<img src="/TOP/vt_DBInfo/images/Abdominal/크로스 크런치/크로스 크런치1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/크로스 크런치/크로스 크런치2.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/크로스 크런치/크로스 크런치3.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/크로스 크런치/크로스 크런치4.jpg">
<br><br>
* 운동 준비 자세 / 개요 * 
상복부와 외복사근을 동시에 발달시키기 위한 운동이다.
기본적인 크런치 자세에서 시작하여 한쪽 어깨가 대각선 방향의 무릎을 향하도록 복근을 수축시킨다.
이완 시 동작 범위를 어깨가 바닥에 닿기 전까지로 제한하는 것이 옆구리에 긴장감을 계속 유지하여 최적의 효과를 볼 수 있다.',
'* 운동 방법 *
1. 바닥에 누워 왼쪽 무릎을 구부리고 오른쪽 다리를 포개어 올린다.
2. 오른손은 옆으로 쭉 뻗고 왼손은 머리 왼쪽을 살짝 감싸준다.
3. 서서히 상체를 들어올려 왼쪽 팔꿈치가 오른쪽 무릎을 향하도록 복부를 최대한 수축한다.
4. 천천히 저항을 느끼며 원위치한다.반대쪽도 같은 방법으로 실시한다.',
'* Tip *
한쪽 다리를 반대편 무릎에 얹고 반대편 손을 머리에 대어 몸이 비틀어지면서 올라가야 한다.
복부의 자극에 집중하며 서서히 올라갔다가 서서히 내려온다.',
'* 주의 *
다리의 위치가 바뀌거나 복부의 긴장감이 풀리지 앉도록 한다.
<img src="/TOP/vt_DBInfo/images/Abdominal/크로스 크런치/운동부위1.jpg">
<img src="/TOP/vt_DBInfo/images/Abdominal/크로스 크런치/운동부위2.jpg">
<br><br>');
CREATE TABLE vt_ex_part
(
   ex_part_id number NOT NULL,
   part_name varchar2(30) NOT NULL UNIQUE,
   PRIMARY KEY (ex_part_id)
);
insert into vt_ex_part values(1, '가슴');
insert into vt_ex_part values(2, '등');
insert into vt_ex_part values(3, '하체');
insert into vt_ex_part values(4, '팔_이두');
insert into vt_ex_part values(5, '팔_삼두');
insert into vt_ex_part values(6, '어깨');
insert into vt_ex_part values(7, '복근');
CREATE TABLE vt_faq
(
   num number NOT NULL,
   classify varchar2(20) NOT NULL,
   question varchar2(200) NOT NULL,
   answer varchar2(4000) NOT NULL,
   PRIMARY KEY (num)
);
insert into vt_faq values(vt_faq_sql.nextval, 'member', '회원가입 절차가 궁급합니다.', '비주얼탑 피트니스 회원가입은 누구나 무료로 회원 가입이 가능하며,
홈페이지 우측 상단의 회원가입 페이지에서 하실 수 있습니다.
회원가입 절차
정보입력 - 이메일 인증 - 가입완료');
insert into vt_faq values(vt_faq_sql.nextval, 'member', '회원탈퇴는 어떻게 하나요?', '회원탈퇴는 고객님의 마이페이지 > 회원정보 수정 페이지에서 탈퇴를 할 수 있습니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'member', '회원정보를 변경하고 싶어요', '회원정보 변경은 회원님의 마이페이지 > 회원정보 수정 페이지에서 변경이 가능합니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'member', '아이디를 변경하고 싶어요', '아이디 변경은 불가능합니다. 다만 회원탈퇴를 하고 새로운 아이디로 가입이 가능합니다');
insert into vt_faq values(vt_faq_sql.nextval, 'member', '로그아웃이 안돼요', '로그아웃이 되지 않는 경우는 다음 사항을 확인하시기 바랍니다.
1. 시스템 날짜와 년도가 현재 일자로 설정되어 있는지 확인하십시오. 
2. 회원님의 웹브라우져 상단의 도구 > 인터넷 옵션 > 일반 > 검색 기록 에서 [삭제] 버튼 클릭합니다
3. 위와같이 조치하였는데도 로그아웃이 않될 경우 해당 쿠키 파일삭제을 삭제하세요.
');
insert into vt_faq values(vt_faq_sql.nextval, 'member', '회원가입 시 에러 메시지가 자꾸 나와요.', '신규가입 시 발생한 에러는 일시적인 현상일 수 있으므로, 
번거로우시더라도 잠시 후에 회원가입을 다시 한번 시도해 주시기 바랍니다.
같은 에러가 반복 발생할 경우 정확한 에러 메시지를 문의메일로 보내주시면 확인 후 처리해 드리겠습니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'member', '회원탈퇴 후 개인정보는 언제 삭제되나요?', '회원 탈퇴시 즉시 삭제 됩니다');
insert into vt_faq values(vt_faq_sql.nextval, 'member', '회원가입을 할 떄, 나이제한이 있나요?', '본 홈페이지는 나이제한이 없습니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'member', '회원가입은 무료인가요?', '비주얼 휘트니스 홈페이지 회원가입은 무료이며 가입과 동시에 홈페이지의 모든 서비스를 
이용하실 수 있습니다. 단, GT나 PT의 경우에는 결제를 하여야 이용할 수가 있습니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'member', '본인인증의 방법은 무엇이 있나요?', '회원가입 시 이메일 인증해야합니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'member', 'Google 크롬 브라우저 설정방법 안내', 'Google의 크롬을 사용하시는 경우, 
브라우저 쿠키 설정 및 캐시, 쿠키 삭제 방법은 다음과 같습니다. 
▶ PC용 Google 크롬 
1. 상단 주소창 오른쪽의 "공구" 모양 아이콘(마우스 오버시 "크롬 설정 및 관리로 표시됨)을 클릭합니다.
2. 아래쪽의 "설정"을 선택합니다.
3. 하단의 "고급설정표시" 를 클릭하면 Tab이 펼쳐집니다.
4. 개인정보 항목의 "콘텐츠 설정..." 버튼을 클릭하여 "로컬 데이터 설정허용(권장)"을 선택한 후, 확인을 클릭합니다.
5. 동일하게 개인정보 항목의  "인터넷 사용정보 삭제..." 버튼을 클릭합니다.
6. "캐시 삭제" 및 "쿠키 및 기타 사이트, 플러그인 데이터 삭제"를 선택합니다.
7. "인터넷 사용정보 삭제"를 클릭합니다.
8. 브라우저를 종료하고 다시 시작합니다. 
▶ Mac용 Google 크롬 
1. "크롬" 범주를 클릭하고 "인터넷 사용정보 삭제"를 선택합니다.
2. "캐시 비우기" 및 "쿠키 및 기타 사이트, 플러그인 데이터 삭제"를 선택합니다.
3. "인터넷 사용정보 삭제"를 클릭합니다.
4. 브라우저를 종료하고 다시 시작합니다. 
위 안내에 따라도 문제가 해결되지 않는 경우, 가장 최신 버전의 브라우저로 업그레이드하는 것이 좋습니다.
아래 링크를 통해 가장 최신 버전의 인터넷 브라우저를 다운로드하세요. 
▶ Windows
     - Internet Explorer : http://windows.microsoft.com/en-US/internet-explorer/downloads/ie
     - Firefox : http://www.mozilla.com/en-US/firefox/fx/
     - Google 크롬 : http://www.google.com/chrome 
▶ Mac OS
     - Safari : http://www.apple.com/safari/download/
     - Firefox : http://www.mozilla.com/en-US/firefox
     - Google 크롬 : https://www.google.com/intl/ko/chrome/browser/');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '근력 운동과 유산소 운동 중 어떤 운동을 먼저 하는 것이 좋은가요?', 
'▶ 유산소 운동과 근력 운동을 병행할 때는 운동 목적에 따라 운동 순서를 정하여 실시한다. 
체지방 감량을 목적으로 한다면 탄수화물을 에너지원으로 하는 근력 운동을 먼저 한 후 유산소 운동을 실시하는 것이 좋다. 
에너지 시스템의 동원 순서에 따르면 인체 내에서 탄수화물이 먼저 소모된 후 지방이 연소되기 때문이다. 
또한 근육을 키우는 것이 목적이라면 준비 운동과 정리 운동에 유산소 운동을 실시하는 것이 효과적이다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '근력 운동은 지방 감량에 별 도움이 되지 않나요?',
'▶ 체중 감소와 체지방 감소는 다소 다른 문제이다.
 모든 운동은 체중 감소 효과를 가져올 수 있으나 순수한 지방 감량 측면에서 보면 
근력 운동은 체지방 감량에 직접적으로 도움이 되지는 않는다. 
다시 말해 근력 운동만 했을 때에는 체중의 차이가 크게 나타나지 않는다. 
그 이유는 근력 운동은 무산소 운동으로 주로 지방보다는 탄수화물을 에너지원으로 사용하기 때문이다. 
그렇다고 근력 운동이 다이어트에 필요 없는 것은 아니다. 
근력 운동은 유산소 운동과 병행할 경우 기초대사율을 높여 요요 현상을 예방해줌으로써 다이어트 효과를 배가시킨다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '뱃살 빼는 데는 윗몸 일으키기가 최고다?',
'▶ 윗몸 일으키기(Sit-up)는 복부의 근육을 만드는 근력 운동이지 뱃살을 빼는 운동은 아니다. 
신체의 특정 부위의 지방을 줄이는 운동은 따로 없다. 윗몸 일으키기를 하면 복부 근육을 단단하게 만들어주지만, 
복부에 피하지방이 잔뜩 덮고 있으면 외형적으로 드러나지는 않는다. 
뱃살을 빼는 가장 좋은 방법은 걷기나 러닝과 같은 유산소 운동을 통해 인체의 지방을 전반적으로 감소시키면서 
윗몸 일으키기나 크런치, 행잉 레그 레이즈, 바이시클 크런치와 같은 운동을 병행하는 것이다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '여성의 경우 근력 운동으로 가슴이 커질 수 있는가요?',
'▶ 근력 운동은 근육을 강화시키는 것이다. 
여성의 가슴은 대부분 지방으로 구성되어 있기 때문에 근력 운동으로 가슴 자체가 커지지는 않는다. 
다만 가슴을 받쳐주는 근육과 주변 조직들을 발달시켜 가슴 라인을 다듬고 탄력을 높여주는 효과는 있다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '운동 후 쑤시고 아픈 근육 그냥 참으면 되나요?',
'▶ 근육 운동을 한 후 발생되는 지연성 근통증은 근육의 통증 또는 근육의 뻣뻣한 느낌이나 붓는 증상이 운동 후 
약 1~3일까지 나타나는 것을 말한다. 
국부적인 근섬유 파괴와 손상이 주변의 혈관과 신경을 압박하여 통증을 일으킨다고 보고되고 있다. 
따라서 부위별 운동 후 근육의 긴장도를 낮추기 위해 스트레칭을 실시하는 것이 중요하다. 
운동 전후에 탄수화물을 섭취하는 것도 근육 경련과 같은 증상을 예방하고 피로 회복에 도움이 된다. 
그러나 통증이 심할 경우엔 병원을 찾아가는 것이 바람직하다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '머신 운동과 프리 웨이트 운동 중 어떤 것이 더 효과가 큰가요?',
'▶ 근력 운동은 웨이트 머신, 스미스 머신, 케이블 머신 등 다양한 머신을 이용할 수도 있다. 
머신을 이용한 운동은 근력 운동 초보자에게 적합한 형태로 프리 웨이트 운동보다 안전하고 편리하게 할 수 있다. 
하지만 다양한 부하를 제공받을 수 있는 운동이나 취약한 근육 부위의 강화를 목표로 한 경우에는 
프리 웨이트 운동보다 그 효과가 크지 않다. 따라서 근육량을 늘리고 전체적인 근력 향상을 위해서는 프리 웨이트 운동을
실시하는 것이 더 효과적이다. 
단, 초보자의 경우 프리 웨이트 운동 시 부상의 위험이 있을 수 있으므로 적절한 중량을 선택하도록 유의한다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '운동을 하다 그만두면 근육이 지방으로 변하나요?',
'▶ 운동을 하면 체지방이 빠지고 근육이 만들어진다.
 반대로 운동을 중단하면 체지방은 증가하고 근육량이 줄어드는 것이지 근육이 지방으로 변하는 것은 아니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '근력 운동을 할 때 빠른 동작으로 실시하는 것이 더 효과적이다?',
'▶ 웨이트 트레이닝의 원리는 근육에 미세한 상처를 입게 한 후 회복 과정에서 
운동 전의 상태보다 향상된 근섬유를 만드는 것이다. 
따라서 천천히 동작하는 것이 좀 더 효과적으로 이러한 과정을 돕게 된다. 
들어올리는 동작은 1초에 걸쳐, 내리는 동작은 2~3초에 걸쳐 실시하는 것이 바람직하다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '근력 운동은 일주일에 몇 번 정도 해야 하나요?',
'▶ 근력 운동뿐만 아니라 유산소 운동 또한 운동 후
24~48시간 이내의 신체적 휴식을 가져야 안전하면서도 효과적으로 인체에 영향을 줄 수 있다. 
특히 근력 운동은 다양한 트레이닝 방법론에 따라 매일 또는 격일제로 운영함으로써 근력 증가의 효과를
달리할 수 있으므로 현재의 운동 능력과 함께 다양한 변인(나이, 성별, 근력 수준 등)을 고려하여 처음엔 주 3회로
 시작하여 점진적으로 주 5회 이상으로 늘려가는 것이 바람직하다고 할 수 있다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '근력을 키우려면 운동 보조제를 꼭 먹어야 하나요?',
'▶ 운동 보조제는 천연식품에 들어 있는 영양소 중 근육을 형성하는 데 도움이 되는 물질들을 선별해 농축해 놓은 제품이다. 
영양소가 골고루 갖춰 있는 정상적인 식사를 규칙적으로 하는 경우, 지나치게 큰 근육을 만들 목적이 아니라면 
굳이 보충제를 섭취할 필요는 없다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '근육을 만들 때 고단백질만 섭취하고 지방은 섭취하면 안 되나요?',
'▶ 근육을 크게 만들 때 고단백질 식품을 섭취하는 이유는 근육의 주성분이 단백질로 되어 있기 때문이다. 
하지만 트레이닝 중 필요량 이상의 단백질 과다 섭취는 결국 체지방 축적을 증가시키고 질소 노폐물을 
배설시켜 간과 신장에 부담을 줄 수 있다. 또한 식물성 지방, 생선유와 같은 오메가 3, 6 계열의 필수 지방산은 
근섬유를 만드는 데 있어 필수적이므로 적당한 지방을 섭취하는 것이 좋다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '외관상 몸매의 변화가 나타나려면 얼마나 걸리나요?',
'▶ 근력 운동만으로 외관상 몸매의 변화를 꾀하는 것은 현명한 운동 방법은 아니다. 
외관상의 몸매의 변화는 자세의 변화와 함께 부위별 근육의 기능이 좀 더 원활하게 이루어진다는 것을 의미하므로 
근력 운동뿐만 아니라 유산소 운동이나 유연성 및 평형성 운동 등의 추가적인 운동을 통해 몸매 변화를 꾀하는 것이 바람직하다. 
일반적으로 주 3회 이상 12주 운동이 효과적인 운동 기간으로 알려져 있다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '여자도 웨이트 운동을 하면 남자처럼 근육이 커지나요?',
'▶ 성인 여성의 경우, 성인 남성에 비해 체지방이 많고 근육량이 적지만
 근육의 횡단면적당 근력의 수준은 거의 차이가 없다. 그러나 현재까진 여성의 경우, 남성과 달리 에스트로겐이 많이 
분비되어 남성과 같은 우람한 근육 발달을 경험하는 것은 거의 불가능하다. 
간혹 TV나 잡지 등에서 우람한 근육을 가진 여성을 볼 수 있다. 이는 유전적으로 일반 여성보다 휴식 상태의 남성 호르몬(테스토스테론)이
 높거나 웨이트 운동에 대한 호르몬 반응이 좀 더 민감한 약간 특이 체질의 여성의 경우에 해당된다. 
아니면 지속적인 고강도 훈련 또는 보조 식품 복용으로 인한 것이다. 웨이트 운동을 한다고 여자가 남자처럼 근육이 커지는 것은 아니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '복근 운동은 매일 해도 되나요?',
'▶ 복근 운동도 일정한 강도 이상으로 실시할 경우 근피로를 유발하므로 24~48시간 간격으로 실시하는 것이 좋다. 
복근에 영향을 미치는 부하의 수준(강도, 세트, 반복 횟수)을 고려해서 세부 부위별로 프로그램을 계획하여 실시하는 것이 권장된다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '근육을 키우려면 가볍게 많이 하는 게 좋은가요, 아니면 무겁게 적은 횟수로 하는 게 좋은가요?',
'▶ 웨이트 트레이닝 시 무게와 반복 횟수는 운동 목적에 따라 달라진다. 
최대 근력의 증가를 위해서는 무거운 무게로 적은 횟수를, 근육 크기 증가가 목적인 경우 12번 정도를 반복할 수 있는 무게로 12회 반복, 
지구력 증가나 체지방 감소가 목적인 경우 가벼운 무게로 많은 횟수를 반복하는 것이 효과적이다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '근력 운동을 하면 키가 안 크나요?',
'▶ 성장기에 뼈나 근육에 가해지는 적당한 자극은 성장을 촉진시킨다. 
올바른 자세를 위해 근력 운동을 할 경우 적절한 수준에서 실시하면 성장에 긍정적인 영향을 줄 수 있다. 
그러나 너무 무거운 웨이트를 이용한 운동은 뼈가 자라는 것을 방해(성장판 손상, 연부조직 상해)할 수 있다.
따라서 웨이트 트레이닝은 성장이 안정된 시기 이후에 실시하는 것이 바람직하다고 볼 수 있다. 
근력 운동이 아니어도 다양한 신체 활동을 통해 성장호르몬 분비를 촉진시킬 수 있으므로
 충분한 휴식과 영양 섭취와 함께 적당히 운동을 하는 것이 성장에 중요하다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '나이가 들어서 근력 운동을 해도 근육이 커지나요?',
'▶ 일반적으로 30세 이후부터 근육량 감소(근력 감소)와 함께 신경계 및 내분비계가 변화됨에 따라 근감소증이 나타나게 되며 
이러한 근위축은 신체적 비활동으로 가속화된다. 따라서 연령이 증가할수록 오히려 근력 운동이 더욱 필요하게 된다. 
근력 운동은 근력 강화와 근육량의 증가뿐만 아니라 근신경 반응 속도를 향상시킨다. 
따라서 기대 효과가 나타날 때까지 시간은 다소 더 걸릴지라도 근력 운동에 의한 신체적 효과는 충분히 얻을 수 있다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '운동이 처음인데, 저같이 운동 경험이 없는 상태에서 요가를 해도 괜찮나요?',
'▶ 요가는 남녀노소 누구나 무리 없이 할 수 있는 운동이다. 자신의 몸 상태에 맞추어 단계별로 할 수 
있기 때문에 초보인 분들도 부담 없이 할 수 있다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '요가는 혼자 하면 위험하다고 하던데, 혼자 해도 될까요?',
'▶ 요가를 처음 시작하는 경우에는 가능한 전문 강사의 지도를 받는 것이 좋다. 
그럴 수 없는 경우에는 책이나 동영상을 통해 정확하게 동작을 배워 따라 하면 혼자서도 충분히 수련할 수 있다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '처음 요가를 합니다. 필요한 준비물은 무엇이 있나요?',
'▶ 요가 매트와 요가 수련 시 입을 수 있는 편안한 옷을 준비하면 된다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '요가 전에는 음식물을 먹지 말라고 하던데 왜 그런가요?',
'▶ 요가는 몸을 비틀고 앞으로 숙여주는 자세들이 상당수인데, 이들은 복부를 자극하는 효과가 있다. 
위에 음식물이 차 있으면 동작 시 위에 부담을 주게 되어 소화장애가 올 수 있다. 
또한 요가에서는 호흡의 역할도 중요한데, 위에 음식물이 있으면 호흡이 힘들어질 수도 있다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '요가 전후에 물은 못 마시게 하는 이유가 무엇인가요?',
'▶ 요가는 단순한 몸의 운동이 아닌 기혈의 순환을 도와주는 운동이다. 
수행 전후 차가운 성질의 물을 마시게 되면 기혈 순환에 방해가 되며 몸의 기운이 깨지게 된다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '요가는 하루에 몇 분 정도 해야 하는가요? 그리고 언제 하는 게 좋은가요?',
'▶ 요가 수련 시간은 최소 30분에서 1시간이 적당하다. 요
가는 아침이나 저녁 시간대에 자신의 컨디션과 몸 상태에 맞추어 하는 것이 좋다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '다이어트를 위해 요가를 하고 있는데 얼마나 해야 효과를 볼 수 있나요?',
'▶ 개인 차이가 있어 몇 주 만에 효과를 보는 경우도 간혹 있지만,
 일반적으로는 3개월 정도를 기본으로 하는 것이 좋다. 
요요 현상 없는 다이어트를 원한다면 하루 30분에서 1시간 정도 꾸준한 수련을 해야 한다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '복식 호흡은 어떻게 해야 하나요?',
'▶ 코로 들이마시는 호흡에 배가 나오고 반대로 내쉴 때 배가 등 쪽으로 들어가게 한다.
 호흡의 비율은 마시고 참고 내쉬는 호흡을 1:4:2 정도로 실시한다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '생리 중에 해서는 안 될 체위는 어떤 게 있을까요?',
'▶ 생리 중에는 다리를 위로 들어올리는 자세들은 피해야 한다. 
물구나무 서기, 어깨로 서기 자세, 쟁기 자세 등은 삼가도록 한다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '저는 임산부인데요. 언제부터 요가를 해도 될까요?',
'▶ 임산부 요가는 임신 안정기인 13~15주 이후부터 시작하는 것이 좋다.
 하지만 기존에 요가를 꾸준히 했던 분이라면 임신 초기에 가벼운 몸풀기 동작 정도는 해도 무방하다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '임산부라 복식 호흡을 하기가 어려운데, 어떻게 해야 하나요?',
'▶ 보통 일반인의 경우에는 숨을 들이마시고 참고 내쉬는 호흡을 최대한 길게 한다. 
하지만 임산부의 경우에는 참는 호흡은 생략하고, 마시고 내쉬는 호흡만 하되, 본인의 할 수 있는 정도로만 가볍게 해준다. 
코로 내쉬는 호흡이 힘들 때는 대신 이와 이 사이로 가볍게 내뱉는다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '임산부 요가는 언제까지 할 수 있나요?',
'▶ 임산부 요가는 출산 직전까지도 가능하다. 본인의 몸 상태에 맞춰 무리 없이 진행하면 된다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '산후 요가는 출산 후 언제부터 가능한가요?',
'▶ 산후 요가는 출산 후 1주일 이후부터 가능하다. 회음부 또는 절개 부위가 아물면 바로 시작해도 좋다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '홈트레이닝에 있는 각 운동법마다 소모되는 칼로리를 알고 싶습니다.',
'▶ 같은 운동을 하더라도 사람마다 체중, 운동 동작과 강도, 집중도, 체력수준 등이
개개인마다 다르므로 각 운동법에 따른 칼로리를 정확하게 따지기는 어렵습니다. 
목표 칼로리를 채우기 위해 운동을 하는 것보다 운동 동작 하나하나에 집중하여 목표 
부위를 충분히 자극시키는 것이 칼로리 소모에 더욱 효과적입니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '헬스장에서 운동하고 집에서 홈트레이닝 운동법을 병행해도 괜찮나요?',
'▶ 체력적으로 무리가 되지 않는다면 헬스장에서 운동 후 집에서 홈트레이닝 운동법을 병행하여도 무관합니다. 
하지만 같은 부위의 운동을 병행하게 된다면 오히려 몸에 피로감이 더해져 운동효과가 떨어질 수 있으므로, 
전체적인 운동계획을 잘 잡아서 운동을 해야 합니다. 
오전에 홈트레이닝 운동법을 했다면 오후에는 헬스장에서 유산소 운동을 병행하거나, 헬스장에서의 운동과 
홈트레이닝 운동을 격일로 병행하시길 권해 드립니다. 또는 헬스장에서 운동을 하지 않는 주말이나 취침 전, 
기상직후 등 잠깐의 짬을 내어 홈트레이닝 운동법을 실시하는 것도 좋습니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '마른 체격인데 운동을 하면 오히려 살이 빠지지 않을까요?',
'▶ 외형의 변화를 원하거나, 저체중으로 인한 건강에 이상이 있다면 근력운동은 오히려 필수적으로 하셔야 합니다. 
마른 체격의 경우에는 운동을 통해 살이 빠지는 것보다 그에 따른 에너지 섭취량이 적기 때문에 살이 빠지는 경우가 많습니다. 
그러므로 운동으로 인한 에너지 소모량보다 더 많이 열량 섭취를 높여주고, 충분한 단백질 섭취에 신경 써서 관리하신다면, 
더 멋진 체격으로 변화하실 수 있습니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '체중이 많이 나가는데, 제시된 운동량보다 더 많이 해야 하나요?',
'▶ 체중이 많이 나가시는 분들의 경우, 대부분은 과도한 체지방량으로 인해 체력수준이 낮은 경우가 많습니다. 
체력수준을 무시한 채로 욕심을 내어 더 많은 운동을 한다면, 
오히려 과다트레이닝이 되어 운동 수행력이 감소, 근육통, 혈압변화 등 신체에 안 좋은 변화들이 생길 수 있습니다. 
본인의 체력 수준에 맞춰 실시하되 올바른 자세와 호흡, 정확한 동작을 통해 운동효과를 높이는 것이 중요합니다.
 제시된 운동량 안에서 정확한 자세로 운동을 실시하다 체력수준이 높아져 제시된 운동량을 완벽히 소화 가능하다면 
운동량을 늘려주는 것도 좋습니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '요일별로 나누지 않고 매일 유산소운동과 근력운동을 함께 해도 되나요?',
'▶ 유산소 운동은 체지방을 빼주고, 근력운동은 체지방이 빠진 자리에 근육을 붙게 합니다. 
근력운동의 경우 특정 부위에 강한 자극을 주게 되므로, 다음날에는 운동한 부위에 휴식이 필요합니다. 
하지만 유산소 운동의 경우 자신의 체력수준과 운동목적에 따라 적절히 잘 나누어 운동한다면 매일 운동해도 큰 무리는 없습니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '나의 체중만으로 근력운동 효과를 볼 수 있나요?',
'▶ 보디빌더와 같이 큰 근육을 만들고 싶다면 체중을 이용한 운동으로는 한계가 있지만
 전체적인 발란스와 효율적인 근육을 만들기에는 체중을 이용한 다양한 근력운동으로 많은 효과를 보실 수 있습니다. 
나의 체중만으로도 정확한 운동 동작과 운동부위에 집중하고 자극시킨다면 근력뿐만 아니라 체력향상에도 효과를 보실 수 있습니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '홈트레이닝은 어느 시간 때에 운동하는 것이 좋은가요?',
'▶ 특별히 정해진 시간은 없습니다. 운동하기 편한 시간을 정해 매일 시행하다 보면 신체가 적응하게 되는데,
 그 시간이 바로 자신에게 가장 효과적인 시간입니다.');
insert into vt_faq values(vt_faq_sql.nextval, 'exercise', '운동 전/후에 스트레칭을 꼭 해야 하나요?',
'▶ 운동 시작 전의 스트레칭은 부상을 방지할 뿐만 아니라 본 운동을 들어가는 데 있어서 효과를 높일 수 있습니다. 
또한 운동 마무리 단계에서 하는 스트레칭은 운동 후의 일시적인 부종현상 및 근육 뭉침 현상을 방지에도 도움이 됩니다.');

CREATE TABLE vt_members
(
   id varchar2(15) NOT NULL,
   authority_id number NOT NULL,
   passwd varchar2(15) NOT NULL,
   name varchar2(30) NOT NULL,
   nickname varchar2(30) NOT NULL UNIQUE,
   phone varchar2(15),
   zipcode varchar2(10),
   address varchar2(100),
   email varchar2(30) NOT NULL UNIQUE,
   join_date date NOT NULL,
   PRIMARY KEY (id)
);
insert into vt_members values('lees', 1, '111', '이순신', 'nic_lee', '111-6666-2222', '031-222', '서울특별시 강남구 강남동|강남아파트 111-111',  
'1111@gmail.com', sysdate);
insert into vt_members values('kimy', 2,  '111', '김유신', 'nic_kim', '111-2222-7777', '031-111', '경기도 안양시 안양동|안양아파트 111-111', 
'2222@gmail.com', sysdate);
insert into vt_members values('jangb', 2,  '111', '장보고', 'nic_jang', '111-2222-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'3333@gmail.com',  sysdate);
insert into vt_members values('jangb1', 2,  '111', '장보고', 'nic_jang1', '111-2222-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'3@gmail.com',  sysdate);
insert into vt_members values('jangb2', 2,  '111', '장보고', 'nic_jang2', '111-2223-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'4@gmail.com',  sysdate);
insert into vt_members values('jangb3', 2,  '111', '장보고', 'nic_jang3', '111-2224-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'5@gmail.com',  sysdate);
insert into vt_members values('jangb4', 2,  '111', '장보고', 'nic_jang4', '111-2225-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'6@gmail.com',  sysdate);
insert into vt_members values('jangb5', 2,  '111', '장보고', 'nic_jang5', '111-2226-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'7@gmail.com',  sysdate);
insert into vt_members values('jangb6', 2,  '111', '장보고', 'nic_jang6', '111-2227-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'8@gmail.com',  sysdate);
insert into vt_members values('jangb7', 2,  '111', '장보고', 'nic_jang7', '111-2228-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'9@gmail.com',  sysdate);
insert into vt_members values('jangb8', 2,  '111', '장보고', 'nic_jang8', '111-2229-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'10@gmail.com',  sysdate);
insert into vt_members values('jangb9', 2,  '111', '장보고', 'nic_jang9', '111-2211-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'11@gmail.com',  sysdate);
insert into vt_members values('jangb10', 2,  '111', '장보고', 'nic_jang10', '111-2233-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'12@gmail.com',  sysdate);
insert into vt_members values('jangb11', 2,  '111', '장보고', 'nic_jang11', '111-2244-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'13@gmail.com',  sysdate);
insert into vt_members values('jangb12', 2,  '111', '장보고', 'nic_jang12', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', 
'55@gmail.com',  sysdate);
insert into vt_members values('14', 2,  '111', '장보고', '14', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '14@gmail.com', sysdate);
insert into vt_members values('15', 2,  '111', '장보고', '15', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '15@gmail.com', sysdate);
insert into vt_members values('16', 2,  '111', '장보고', '16', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '16@gmail.com', sysdate);
insert into vt_members values('17', 2,  '111', '장보고', '17', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '17@gmail.com', sysdate);
insert into vt_members values('18', 2,  '111', '장보고', '18', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '18@gmail.com', sysdate);
insert into vt_members values('19', 2,  '111', '장보고', '19', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '19@gmail.com', sysdate);
insert into vt_members values('20', 2,  '111', '장보고', '20', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '20@gmail.com', sysdate);
insert into vt_members values('21', 2,  '111', '장보고', '21', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '21@gmail.com', sysdate);
insert into vt_members values('22', 2,  '111', '장보고', '22', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '22@gmail.com', sysdate);
insert into vt_members values('23', 2,  '111', '장보고', '23', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '23@gmail.com', sysdate);
insert into vt_members values('24', 2,  '111', '장보고', '24', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '24@gmail.com', sysdate);
insert into vt_members values('25', 2,  '111', '장보고', '25', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '25@gmail.com', sysdate);
insert into vt_members values('26', 2,  '111', '장보고', '26', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '26@gmail.com', sysdate);
insert into vt_members values('27', 2,  '111', '장보고', '27', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '27@gmail.com', sysdate);
insert into vt_members values('28', 2,  '111', '장보고', '28', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '28@gmail.com', sysdate);
insert into vt_members values('29', 2,  '111', '장보고', '29', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '29@gmail.com', sysdate);
insert into vt_members values('30', 2,  '111', '장보고', '30', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '30@gmail.com', sysdate);
insert into vt_members values('31', 2,  '111', '장보고', '31', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '31@gmail.com', sysdate);
insert into vt_members values('32', 2,  '111', '장보고', '32', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '32@gmail.com', sysdate);
insert into vt_members values('33', 2,  '111', '장보고', '33', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '33@gmail.com', sysdate);
insert into vt_members values('34', 2,  '111', '장보고', '34', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '34@gmail.com', sysdate);
insert into vt_members values('35', 2,  '111', '장보고', '35', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '35@gmail.com', sysdate);
insert into vt_members values('36', 2,  '111', '장보고', '36', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '36@gmail.com', sysdate);
insert into vt_members values('37', 2,  '111', '장보고', '37', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '37@gmail.com', sysdate);
insert into vt_members values('38', 2,  '111', '장보고', '38', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '38@gmail.com', sysdate);
insert into vt_members values('39', 2,  '111', '장보고', '39', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '39@gmail.com', sysdate);
insert into vt_members values('40', 2,  '111', '장보고', '40', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '40@gmail.com', sysdate);
insert into vt_members values('41', 2,  '111', '장보고', '41', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '41@gmail.com', sysdate);
insert into vt_members values('42', 2,  '111', '장보고', '42', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '42@gmail.com', sysdate);
insert into vt_members values('43', 2,  '111', '장보고', '43', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '43@gmail.com', sysdate);
insert into vt_members values('44', 2,  '111', '장보고', '44', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '44@gmail.com', sysdate);
insert into vt_members values('45', 2,  '111', '장보고', '45', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '45@gmail.com', sysdate);
insert into vt_members values('46', 2,  '111', '장보고', '46', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '46@gmail.com', sysdate);
insert into vt_members values('47', 2,  '111', '장보고', '47', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '47@gmail.com', sysdate);
insert into vt_members values('48', 2,  '111', '장보고', '48', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '48@gmail.com', sysdate);
insert into vt_members values('49', 2,  '111', '장보고', '49', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '49@gmail.com', sysdate);
insert into vt_members values('50', 2,  '111', '장보고', '50', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '50@gmail.com', sysdate);
insert into vt_members values('51', 2,  '111', '장보고', '51', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '51@gmail.com', sysdate);
insert into vt_members values('52', 2,  '111', '장보고', '52', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '52@gmail.com', sysdate);
insert into vt_members values('53', 2,  '111', '장보고', '53', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '53@gmail.com', sysdate);
insert into vt_members values('54', 2,  '111', '장보고', '54', '111-2255-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '54@gmail.com', sysdate);
CREATE TABLE vt_member_routine
(
   mr_id number NOT NULL,
   routineinfo_id number NOT NULL,
   day varchar2(10) NOT NULL,   
   exercise_id number NOT NULL,
   count_check number,
   PRIMARY KEY (mr_id)
);
CREATE TABLE vt_notice_board
(
   num number NOT NULL,
   id varchar2(15) NOT NULL,
   subject varchar2(50) NOT NULL,
   readcount number,
   reg_date date NOT NULL,
   content varchar2(4000) NOT NULL,
   PRIMARY KEY (num)
);
insert into vt_notice_board values(vt_notice_board_seq.nextval, 'lees', '공지사항 게시판이 신설되었습니다.' , 0, sysdate, '공지사항 게시판이 2016년 8월 18일부터 시작되었습니다.');
insert into vt_notice_board values(vt_notice_board_seq.nextval, 'lees', '공지사항 게시판 대하여' , 0, sysdate, '공지사항 게시판은 운영자가 공지를 하기 위한 게시판이므로
일반 사용자는 열람만 가능합니다.');


CREATE TABLE vt_register
(
   register_id number NOT NULL,
   id varchar2(15) NOT NULL,
   start_date date NOT NULL,
   exp_date number NOT NULL,
   end_date date NOT NULL,
   gx_check varchar2(5) NOT NULL,
   pt_check varchar2(5) NOT NULL,
   pt_count number,
   PRIMARY KEY (register_id)
);
CREATE TABLE vt_routine_info
(
   routineinfo_id number NOT NULL,
   id varchar2(15) NOT NULL,
   sex varchar2(10),
   routine_type varchar2(15),
   start_date date,
   end_date date,
   PRIMARY KEY (routineinfo_id)
);
/* Create Foreign Keys */
ALTER TABLE vt_members
   ADD FOREIGN KEY (authority_id)
   REFERENCES vt_authority (authority_id)
;
ALTER TABLE vt_member_routine
   ADD FOREIGN KEY (exercise_id)
   REFERENCES vt_exercise (exercise_id)
;
ALTER TABLE vt_exercise
   ADD FOREIGN KEY (ex_part_id)
   REFERENCES vt_ex_part (ex_part_id)
;
ALTER TABLE vt_board
   ADD FOREIGN KEY (id)
   REFERENCES vt_members (id)
;
ALTER TABLE vt_inbody
   ADD FOREIGN KEY (id)
   REFERENCES vt_members (id)
;
ALTER TABLE vt_notice_board
   ADD FOREIGN KEY (id)
   REFERENCES vt_members (id)
;
ALTER TABLE vt_register
   ADD FOREIGN KEY (id)
   REFERENCES vt_members (id)
;
ALTER TABLE vt_routine_info
   ADD FOREIGN KEY (id)
   REFERENCES vt_members (id)
;
ALTER TABLE vt_chatting
   ADD FOREIGN KEY (ip)
   REFERENCES vt_request (ip) on delete cascade
;
ALTER TABLE vt_member_routine
   ADD FOREIGN KEY (routineinfo_id)
   REFERENCES vt_routine_info (routineinfo_id)
;
ALTER TABLE vt_comment 
	ADD FOREIGN KEY (num) 
	REFERENCES vt_board (num) on delete cascade
;
commit;
