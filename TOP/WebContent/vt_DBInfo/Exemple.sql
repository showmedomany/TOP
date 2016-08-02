
/* Drop Tables */

DROP TABLE address CASCADE CONSTRAINTS;
DROP TABLE vt_comm CASCADE CONSTRAINTS;
DROP TABLE vt_board CASCADE CONSTRAINTS;
DROP TABLE vt_inbody CASCADE CONSTRAINTS;
DROP TABLE vt_notice_board CASCADE CONSTRAINTS;
DROP TABLE vt_register CASCADE CONSTRAINTS;
DROP TABLE vt_member_routine CASCADE CONSTRAINTS;
DROP TABLE vt_routine_info CASCADE CONSTRAINTS;
DROP TABLE vt_members CASCADE CONSTRAINTS;
DROP TABLE vt_authority CASCADE CONSTRAINTS;
DROP TABLE vt_chatting CASCADE CONSTRAINTS;
DROP TABLE vt_exercise CASCADE CONSTRAINTS;
DROP TABLE vt_ex_part CASCADE CONSTRAINTS;
DROP TABLE vt_faq CASCADE CONSTRAINTS;
DROP TABLE vt_request CASCADE CONSTRAINTS;
DROP TABLE vt_trainer CASCADE CONSTRAINTS;
DROP TABLE chatTest CASCADE CONSTRAINTS;
DROP SEQUENCE register_seq;
DROP SEQUENCE board_seq;
DROP SEQUENCE nt_board_seq;
commit;


/*vt_board_seq*/
CREATE SEQUENCE board_seq
START WITH 1
MAXVALUE 999999999999
MINVALUE 1
INCREMENT BY 1
CYCLE;

/*vt_nt_board_seq*/
CREATE SEQUENCE nt_board_seq
START WITH 1
MAXVALUE 999999999999
MINVALUE 1
INCREMENT BY 1
CYCLE;

/*vt_register*/
CREATE SEQUENCE register_seq
START WITH 1
MAXVALUE 999999999999
MINVALUE 1
INCREMENT BY 1
CYCLE;

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


CREATE TABLE vt_chatting
(
   chat_num number NOT NULL,
   request_num number NOT NULL,
   request_id varchar2(20) NOT NULL,
   content varchar2(4000) NOT NULL,
   PRIMARY KEY (chat_num)
);


CREATE TABLE vt_comm
(
   cmm_id number NOT NULL,
   num number NOT NULL,
   id varchar2(15) NOT NULL,
   cmm_content varchar2(200) NOT NULL,
   cmm_date date NOT NULL,
   PRIMARY KEY (cmm_id)
);


CREATE TABLE vt_exercise
(
   exercise_id number NOT NULL,
   ex_part_id number NOT NULL,
   name varchar2(50) NOT NULL UNIQUE,
   machine varchar2(50) NOT NULL,
   method1 varchar2(4000) NOT NULL,
   method2 varchar2(4000) NOT NULL,
   method3 varchar2(4000) NOT NULL,
   method4 varchar2(4000) NOT NULL,
   PRIMARY KEY (exercise_id)
);

/* 가슴운동 */
insert into vt_exercise values(1, 1, '덤벨플라이', '덤벨',
'
운동 준비 자세 개요 ^
대흉근 운동의 마무리 동작으로 많이 사용된다.^
남성들의 가슴 안쪽 라인을 발달시키는 데 필수적인 운동으로 추천된다. ^
정확한 동작으로 집중적으로 실시하는 것이 중요하다.',
'* 운동 방법 *^
1. 벤치에 앉아 팔을 가슴 옆에 붙이고 덤벨을 든다.^
2. 벤치에 누워 가슴 중앙과 덤벨이 수직이 되도록 위치시키고 팔꿈치를 살짝 구부려 고정시킨다.^
3. 어깨관절만을 사용해 반원을 그리며 가슴이 늘어나는 느낌으로 가슴과 평행이 될 때까지 덤벨을 당긴다.^
4. 겨드랑이에 힘을 준 상태에서 안아주듯이 반원을 그리며 덤벨을 밀어 올린다.^',
'* Tip * ^
1.두 손의 그립은 몸쪽을 향하도록 한다.^
2.팔꿈치의 각도가 너무 굽혀져서도 너무 펴져서도 안 된다.^
3.덤벨을 어깨 밑으로 너무 내리지 않도록 한다.^
4.덤벨을 들어올리는 동작에서 양손이 벌어지게 않게 살짝 모아줌으로써 대흉근의 수축을 최대화한다.^
5.덤벨 플라이 운동을 진행할 때는 "자세와 무게"에 특히 신경을 쓰면서 진행하는 것이 좋습니다. ^
1개의 관절만을 이용하는 운동이므로,너무 무거운 무게는 오히려 관절에 부담이 되고 해당부위에 자극을 주기가 쉽지 않으므로
자신에게 맞는 무게를 선정하여 바른자세로 진행하는것이 좋습니다.^
6.또한 너무 빠른동작으로 진행하는것보다 천천히 진행하는 것이 효과적인 운동이 될 수 있습니다.^',
'* 주의 *^
덤벨이 어깨 밑으로 지나치게 내려갈 경우 어깨 주변 근육의 상해를 유발할 수 있다.
');

insert into vt_exercise values(2,1,'디클라인 덤벨 프레스','덤벨',
'
* 운동 준비 자세 / 개요 * ^
대흉근의 아랫부분을 발달시킴으로써 보다 완성도 높은 대흉근의 모양을 만들어준다. ^
덤벨을 이용하기 때문에 바벨로 하는 디클라인 벤치 프레스보다 더 많은 균형을 요구한다.^
 벤치의 각도는 30~45도가 적당하다.^',
'* 운동 방법 *^
1. 경사진 벤치 발걸이에 두 발을 걸치고 덤벨을 가슴 옆에 붙인다.^
2. 벤치에 누워 어깨너비만큼 팔을 벌리고 덤벨이 가슴과 수직이 되도록 한다.^
3. 엉덩이와 견갑골을 벤치에 최대한 붙이고 허리는 10cm가량 아치형을 만든다.^
4. 가슴이 양옆으로 스트레칭되는 느낌을 가지면서 덤벨이 가슴과 수평이 될 때까지 당긴다.^
5. 겨드랑이에 힘을 준 상태에서 가슴을 모아주는 느낌으로 덤벨을 밀어 올린다.^',
'* Tip * ^
1.덤벨을 밀어 올릴 때 덤벨이 서로 부딪히지 않도록 유의하면서 덤벨을 모아 올린다.^
2.덤벨을 내리고 올릴 때 전완이 양옆으로 벌어지지 않고 수직을 유지하도록 한다.^',
'* 주의 *^
정상 혈압 범위를 벗어난 경우에는 절대적으로 삼가 하도록 한다.^
');

insert into vt_exercise values(3,1,'디클라인 프레스','바벨',
'
* 운동 준비 자세 / 개요 * ^
벤치 프레스, 인클라인 벤치 프레스와 더불어 실시하는 운동으로 ^
대흉근의 아랫부분을 발달시켜 보다 완성도 높은 대흉근의 모양을 만들어준다. ^
벤치의 각도는 30~45도가 적당하다.^',
'* 운동 방법 *^
1. 경사진 벤치 발걸이에 두 발을 걸치고 눈과 바벨이 수직이 되도록 눕는다.견갑골과 엉덩이를 ^
      최대한 붙이고 허리는 10cm가량 아치형을 만든다.^
2. 어깨너비 두 배 정도로 바를 잡고 바벨을 들어 가슴과 수직이 되도록 위치시킨다.^
3. 손목은 꺾이지 않도록 주의하면서 바벨을 가슴 바로 위까지 당긴다.^
4. 겨드랑이에 힘을 준다는 느낌으로 바벨을 밀어 올린다.^',
'* Tip * ^
1.손목이 뒤로 꺾이지 않도록 손목을 고정시킨다.^
2.바벨을 밀어 올릴 때 팔꿈치를 완전히 펴지지 않도록 하여 대흉근의 긴장을 유지한다.^',
'* 주의 *^
정상 혈압 범위를 벗어난 경우에는 절대적으로 삼가하도록 한다.^
');

insert into vt_exercise values(4,1,'딥스','평행바',
'* 운동 준비 자세 / 개요 *^
1. 평행으로 된 바 위에 두 손을 짚고 올라선다.^
2. 무릎을 구부리고 엉덩이를 뒤로 살짝 빼면서 중심을 잡는다.^',
'* 운동 방법 *^
1. 가슴을 바닥 쪽으로 숙이면서 팔꿈치가 90도가 될 때까지 저항을 느끼며 몸을 내린다.^ 
2. 가슴 하부가 스트레칭되는 느낌으로 다시 원위치한다.^',
'* Tip * ^
1. 평행 바의 간격을 50~60cm정도가 적당하다. 이보다 좁거나 넓으면 운동 범위가 줄어들어 ^
      효과가 떨어지며, 팔꿈치와 어께를 다칠 수 있다.^ 
2. 트레이닝 목적에 따라 몸통을 앞으로 굽힐수록 대흉근이 좀 더 발달하고, 몸통을 세우면^
      삼두근 중심으로 운동이 된다.^
3. 초보자의 경우 어께 운동 범위가 과도하지 않도록 보조자를 두고 운동할 수 있도록 한다.^',
'* 주의 *^
어께가 유연하지 않거나 어께를 지나치게 많이 내리면 근육과 인대의 손상 위험성이 ^
커질수 있으므로 반드시 스트레칭을 먼저 실시 하도록 한다. ^
');
insert into vt_exercise values(5,1,'벤치 덤벨 프레스','덤벨',
'
* 운동 준비 자세 / 개요 * ^
대흉근 전체 가동 범위에서 동작이 이루어지기 때문에 가슴을 모아주는 ^
중앙 부위와 바깥쪽 근육의 크기를 키우는 데 효과적이다. ^
덤벨을 들었을 때 균형을 유지하기 위한 근육들을 함께 발달시킬 수 있는 장점이 있어 ^
강하고 안정된 상체를 만들 수 있다.^',
'* 운동 방법 *^
1. 벤치에 앉아 팔을 가슴 옆에 붙이고 덤벨을 든다.^
2. 벤치에 누워 가슴 중앙 부분과 수직이 되게 덤벨을 위치시키면서 팔꿈치를 살짝 구부린다.^
3. 가슴이 양옆으로 늘어나는 느낌을 느끼면서 덤벨이 가슴과 평행이 될 때까지 당긴다.^
4. 겨드랑이에 힘을 주면서 가슴을 모아주는 느낌으로 덤벨을 밀어 올린다.^',
'* Tip * ^
1.덤벨을 밀어 올리는 동작에서 양손이 벌어지게 않게 살짝 모아줌으로써 대흉근의 수축을 최대화한다.^
2.덤벨을 밀어 올릴 때 팔은 모아주되,덤벨이 부딪히지 않도록 유의한다.^
3.팔로만 미는 경우엔 가슴근육의 발달이 이루어지지 않는다.^
4.덤벨을 당기고 밀어 올릴 때 전완이 양옆으로 벌어지지 않고 수직을 유지하도록 한다.^',
'* 주의 *^
덤벨을 내리면서 어깨가 등 뒤로 과도하게 젖혀지면 어깨 주변 근육의 부상 위험이 커질 수 있다.^
벤치에 누울 때는 엉덩이,허리,등,어깨가 순서대로 닿을 수 있도록 한다.^
');

insert into vt_exercise values(6,1,'벤치프레스','바벨',
'
* 운동 준비 자세 / 개요 * ^
1. 벤치에 등을 대고 눕는다. ^
2. 바닥에 내려놓은 양발은 어께너비로 벌리고 무릎을 직각으로 구부린다. ^
3. 팔을 어께너비보다 약간 넓게 벌리고 오버그립하여 바를 지면과 평행을 이루도록하여 팔을 펴고 잡는다.^',
'* 운동 방법 *^
1. 팔을 구부리면서 바가 흉골 가운데 위치하도록 바벨을 내리며 호흡을 들이마신다.^
2. 팔을 위로 펴면서 바벨을 올리며 호흡을 내쉰다.^
3. 같은 동작으로 12~15회 반복한다.^',
'* Tip * ^
1. 운동을 할때 팔꿈치는 수직으로 이동하며 손보다 아래에 위체한다.^
2. 발이 바닥에 잘 닿지 않거나 요추 부위가 과도하게 안으로 휘어 있는 경우에는 발을 들고 한다. 이 때 발을 꼬아서는 안된다. ^
      -- 발을 꼬고 하면 무릎의 인대와 관절 반월 부위에 힘이 들어간 위험이 있다. --^
3. 골반은 벤치에 붙이고 움직이지 않는다.^
4. 바벨을 내릴 때 머리가 들리지 않도록 유의한다.^
5. 바벨을 든 손과 손사이의 간격을 다양하게 할수 있다. 간격이 좁아지면 안쪽 흉근과 삼두근에 가해지는 자극이 더욱 강렬해진다. ^
      간격을 넓히면 근육의 바깥쪽이 자극된다.^',
'* 주의 *^
바벨을 흉곽에 튕기는 식으로 운동하면 안된다. 갈비뼈가 골절되거나 금이 갈수 있다. ^
');

insert into vt_exercise values(7,1,'인클라인 덤벨 프레스','덤벨',
'
* 운동 준비 자세 / 개요 * ^
대흉근의 상부 근육 발달을 목적으로 하는 운동이다.^
인클라인 벤치 각도가 커질수록 어깨 근육 중 특히 전면 삼각근이^
더 많이 동원되기 때문에 대흉근 상부를 집중하여 발달시키기 위해서는 벤치 각도를 ^
30~40도로 유지하는 것이 중요하다.^',
'* 운동 방법 *^
1. 벤치에 누워 쇄골 아랫부분과 수직이 되게 덤벨을 위치시키면서 팔꿈치를 살짝 구부려 고정시킨다.^
2. 가슴 양옆으로 늘어나는 느낌을 느끼면서 덤벨이 가슴과 평행이 될 때까지 당긴다.^
3. 겨드랑이에 힘을 주면서 모아주는 느낌으로 덤벨을 밀어 올린다.^',
'* Tip * ^
1.덤벨을 들어올리는 동작에서 양손이 벌어지게 않게 살짝 모아줌으로써 대흉근의 수축을 최대화한다.^
2.덤벨을 밀어 올릴 때 팔은 모아주되, 덤벨이 부딪히지 않도록 유의한다.^
3.덤벨을 당기고 밀어 올릴 때 전완이 양옆으로 벌어지지 않고 수직을 유지하도록 한다.^',
'* 주의 *^
덤벨을 내리면서 팔꿈치가 등 뒤쪽으로 과도하게 젖혀지면 어깨 주변 근육의 부상 위험이 커질 수 있으므로 주의한다.^
빠르게 운동을 할 경우 자칫 균형을 잃어 상해를 입을 수 있으므로 천천히 동작을 실시하도록 한다.'
);

insert into vt_exercise values(8,1,'인클라인 프레스','바벨',
'
* 운동 준비 자세 / 개요 * ^
대흉근의 상부 근육 발달을 목적으로 하는 운동이다.^
인클라인 벤치 각도가 커질수록 어깨 근육 중 특히 전면 삼각근이^
더 많이 동원되기 때문에 대흉근 상부를 집중하여 발달시키기 위해서는 벤치 각도를 ^
30~40도로 유지하는 것이 중요하다.^',
'* 운동 방법 *^
1. 벤치에 누워 엉덩이와 견갑골을 등받이에 최대한 붙이고 허리는 아치형을 만들어준다.^
2. 어깨너비 두 배로 바를 잡고 바벨을 든다.바벨을 들어 쇄골 아랫부분과 수직이 되게^
      바를 위치시키면서 팔꿈치를 살짝 구부린다.^
3. 손목은 꺾이지 않도록 주의하면서 가슴과 바가 자석처럼 서로 만나는 느낌으로 바벨을 ^
      쇄골 아랫부분과 약간 떨어진 정도까지 당긴다.^
4. 겨드랑이에 힘을 주는 느낌으로 바벨을 밀어 올린다.^',
'* Tip * ^
1. 손목이 지나치게 꺾이지 않도록 한다.^
2. 바를 잡을 때는 손바닥 아래쪽으로 더 가깝게 잡도록 한다.^
3. 운동 중 팔꿈치를 완전히 펴지 않고 대흉근의 긴장을 유지한다.^
4. 어깨 관절의 참여도를 줄이기 위해 플랫 벤치 프레스보다는 약간 좁은 그립을 사용한다.^',
'* 주의 *^
1. 지나치게 손목을 젖혀서 바를 잡을 경우 손목에 부상을 초래할 수 있으므로 주의한다.^
2. 무거운 중량을 가슴 부위로 지나치게 내리는 경우 어깨 관련 근육의 부상과 회전근개 손상이 ^
      발생할 수 있으므로 주의한다.^'
);
insert into vt_exercise values(9,1,'체스트 프레스','체스트 프레스 머신',
'
* 운동 준비 자세 / 개요 * ^
초보자에게 적합한 운동법이다. 바벨 벤치 프레스보다 더 쉽게 실시할 수 있으며 ^
운동 시 부상 위험이 적은 장점이 있다. 자세를 교정하는 데 효과적이고 중급 프로그램으로^
운동을 바꾸기 전 대흉근의 긴장감을 미리 느껴보는 연습을 하기에 최적의 운동이다.^',
'* 운동 방법 *^
1. 벤치에 앉아 엉덩이와 견갑골을 등받이에 최대한 붙인다. 허리는 10cm가량 아치형을 만들어준다^
2. 바와 팔꿈치, 손이 가슴 중앙과 수평이 되도록 의자를 조절한다.바와 전완이 수직이 되는 곳에 손을 ^
      위치시킨다.^
3. 발걸이와 바를 동시에 밀어 팔꿈치가 펴진 상태에서 발을 발걸이에서 내려놓는다^
4. 가슴을 턱 쪽으로 끌어올리면서 바가 가슴과 나란하게 될 때까지 당긴다.^
5. 겨드랑이에 힘을 준다는 느낌으로 바를 앞으로 밀어준다.^',
'* Tip * ^
1. 가슴으로 당기고 미는 동작에서 가급적 느리게 일정한 속도로 운동을 할 때 대흉근에 자극을 ^
      효과적으로 전달할 수 있다.^
2. 운동 중 팔꿈치를 완전히 펴지 않고 대흉근의 긴장을 유지한다.^',
'* 주의 *^
중량을 들어올릴 때 손목이 엄지손가락 쪽으로 지나치게 꺾이지 않도록 팔꿈치를 완전히 펴지 않는다.^
어깨 상해 위험을 최소화하기 위해 전완이 바와 수직이 이루는 동선이 일정하게 유지되도록 한다.
');


/* 팔 운동 */

insert into vt_exercise values(10,2,'덤벨 컨센트레이션 컬','덤벨',
'
* 운동 준비 자세 / 개요 * ^
상완이두근을 집중적으로 발달시키는 운동이다. 천천히 실시하는 것이 매우 중요하며 ^
상완이두근의 중간 부위를 돋보이게 하는 데 효과적이다.^',
'* 운동 방법 *^
1. 벤치에 앉아 허리를 숙여 한 손으로 덤벨을 잡고 반대쪽 손은 무릎을 짚는다 .^
2. 덤벨을 잡은 손의 팔꿈치를 대퇴부 안쪽에 고정시킨다.^
3. 손목을 꺾지 말고 곧게 편 상태로 덤벨을 손목 바깥쪽 방향으로 들어올린다.^
4. 천천히 저항을 느끼며 덤벨을 내린다.반대쪽도 같은 방법으로 실시한다.^',
'* Tip *^ 
1. 가슴 쪽이 아닌 어깨 쪽을 향해 덤벨을 들어올린다.^
2. 들어올리는 중간에서 손목을 바깥쪽으로 돌려주어 상완이두근이 더욱 강하게 수축하도록 한다.^',
'* 주의 *^
팔을 흔들어서 생기는 반동을 이용하지 않는다.^
팔꿈치를 대퇴 안쪽에 지지하면서 흔들리지 않도록 한다.^
');

insert into vt_exercise values(11,2,'덤벨 컬','덤벨',
'* 운동 준비 자세 / 개요 * ^
바벨 컬에 비해 상완이두근의 선명도를 높일 수 있는 운동이다. 선 자세와 앉은 자세(벤치, 짐볼)에서 ^
운동이 가능하며, 그립을 잡는 방향에 따라 발현되는 근육이 달라지며, 양팔을 동시에 운동하거나 한 팔씩^
번갈아가며 운동을 할 수도 있다.^',
'* 운동 방법 *
1. 벤치에 앉아 다리는 골반 너비만큼 벌린 후 양손으로 덤벨을 잡고, 손바닥이 앞을 향하도록 한다.^
2. 팔꿈치를 옆구리에 고정시키고 덤벨을 들어올린다.들어올리는 마지막 지점에서 손목이 바깥쪽을 향하도록 한다.^
3. 천천히 이두근의 저항을 느끼며 덤벨을 내린다.^',
'* Tip * ^
1. 전완이 지면과 수평을 이루는 시점에서부터 손목을 바깥쪽으로 돌려주는 것이 상완이두근을 더욱 자극시킬 수 있다.^
2. 목표 근육의 수축에 최대한 집중하기 위해 벤치에 앉아서 실시하는 것이 좋다.^',
'* 주의 *^
팔꿈치가 앞으로 나가지 않도록 고정시킨다.^
덤벨이 몸 바깥쪽으로 벗어나지 않도록 한다.^
');
insert into vt_exercise values(12,2,'리버스 컬','바벨',
'
* 운동 준비 자세 / 개요 * ^
상완이두근의 바깥쪽 부위를 발달시킬 수 있는 동작이다. 전완 신전근과 손목의 힘을 강화하는 데도 도움이 된다.^',
'* 운동 방법 *^
1. 바벨을 어깨너비로 손등이 앞으로 보이도록(오버 그립) 잡고 다리를 어깨너비만큼 벌리고 선다.^
2. 팔꿈치를 옆구리에 고정시킨 상태에서 몸을 움직이지 말고 이두근 힘을 이용해 바벨을 들어올린다.^
3. 손의 방향을 삼각근 전면을 향하도록 한다.^
4. 천천히 이두근의 저항을 느끼면서 바벨을 내린다.^',
'* Tip * ^
1. 이지바를 이용하면 손목의 부담을 줄일 수 있다.^',
'* 주의 *^
상체와 무릎의 반동을 이용하지 않는다.^
팔꿈치가 앞으로 나가지 않도록 고정시킨다.
');
insert into vt_exercise values(13,2,'컬 바벨','바벨',
'
* 운동 준비 자세 * ^
허리를 곧게 펴고 서서 손을 어깨보다 약간 넓게 벌랜채 언더그립으로 바벨을 잡는다.^
이때 복근과 허리,엉덩이에 힘을 단단히 주고 준비한다.^
숨을 내쉬면서 팔꿈치를 구부려 바를 어깨 높이까지 들어 올리고,다시 숨을 들이쉬면서 바를 다시 팔 시작위치로 내린다.^',
'* 운동 방법 *^
1. 두 손으로 바벨을 어깨너비로 잡고 다리도 어깨너비만큼 벌리고 선다.^
2. 팔꿈치를 옆구리에 고정시키고, 이두근의 힘을 이용해 바벨을 들어올린다.손의 방향은 삼각근 전면을 향하도록 한다.^
3. 천천히 이두근의 저항을 느끼면서 바벨을 내린다.^',
'* Tip * ^
1. 어깨보다 좁게 그립을 잡으면 상완이두근 바깥쪽 근육에 집중할 수 있다.^
2. 어깨보다 넓게 와이드 그립을 잡으면 상완이두근 안쪽 근육에 집중할 수 있다.^
3. 내릴때 긴장을 유지하고 천천히 내려야 운동효과가 배가된다.^',
'* 주의  *^
상체와 무릎의 반동을 이용하지 않는다.^
팔꿈치가 앞으로 나가지 않도록 고정시킨다.'
);
insert into vt_exercise values(14,2,'프리쳐 컬','바벨',
'
* 운동 준비 자세 / 개요 * ^
상완이두근의 완전한 고립 운동을 목적으로 실시한다. ^
다른 상완이두근 운동에 비해 상완이두근 안쪽 중간 부분을 좀 더 자극시킬 수 있다.^',
'* 운동 방법 *^
1. 프리쳐 벤치 위에 겨드랑이를 밀착시키고 양쪽 팔꿈치를 고정시킨다.^
2. 엉덩이를 살짝 들어 양손으로 어깨너비 정도로 바벨을 잡고 벤치에 다시 앉는다.^
3. 몸통을 최대한 움직이지 말고 이두근의 힘으로만 바벨을 위로 들어올린다.^
4. 이두근의 저항을 느끼며 천천히 바벨을 내린다.^',
'* Tip * ^
1. 덤벨이나 머신, 이지바(ez-bar)를 이용할 수 있다.^',
'* 주의 *^
어깨너비 정도로 팔꿈치 간격을 평행하게 유지하면서 들어올린다.'
);
insert into vt_exercise values(15,2,'해머 컬 덤벨','덤벨',
'
* 운동 준비 자세 * ^
벤치에 앉아 다리는 골반 너비만큼 벌려준 후^
덤벨을 잡고, 손바닥을 몸쪽으로 향하게 한다. ^
팔꿈치를 옆구리에 고정시키고, 덤벨을^
이두근의 힘으로 들어올려 준다.^
천천히 이두근의 저항을 느끼며 덤벨을 내린다.^',
'* 운동 방법 *^
1. 벤치에 앉아 다리는 골반 너비만큼 벌린 후 덤벨을 잡고, 손바닥을 몸쪽으로 향하게 한다.^
2. 팔꿈치를 옆구리에 고정시키고, 덤벨을 이두근의 힘으로 들어올린다.^
3. 천천히 이두근의 저항을 느끼며 덤벨을 내린다.^',
'* Tip * ^
1. 시작 자세에서 팔을 완전혀 펴야 이두근을 최대로 이완시켜, 운동 동작시 모든 이두근이 운동에 적극적으로 참여하게 된다.^
2. 한 팔씩 교대로 들어주는 얼터네이트  컬을 통해 집중도를 높일 수 있다.^
3. 케이블 기구에서 로프를 이용하여 실시할 수 있다.^',
'* 주의 *^
팔꿈치가 앞으로 나가지 않도록 고정시킨다.'
);
insert into vt_exercise values(16,2,'덤벨 원암 익스텐션','덤벨',
'
* 운동 준비 자세 / 개요 * ^
상완삼두근 중 특히 장두 부분을 발달시키는 운동으로 중량 설정 시에는 고중량보다 저중량을 설정하여 반복횟수를 늘리는 것이 중요하다.^
탄력 있는 팔을 원하는 여성에게 추천되는 운동이다.^
어깨에 힘이 과도하게 들어가지 않도록 주의하여 실시한다. ^
벤치에 앉아서 실시하거나 또는 서서 하는 두 가지 방법 모두 가능하다.^',
'* 운동 방법 *^
1. 오른손으로 덤벨을 잡고 머리 위로 쭉 펴서 올린다.^
2. 손바닥이 앞을 향하게 하고 왼손은 팔이 움직이지 않도록 받쳐준다.^
3. 팔꿈치와 상완을 머리 옆에 고정시킨 후 저항을 느끼면서 팔꿈치를 서서히 구부린다.^
4. 손의 힘이 아닌 삼두근의 힘으로 팔꿈치를 쭉 편다.반대쪽도 같은 방법으로 실시한다.^',
'* Tip * ^
1. 한쪽 팔로만 실시할 때는 다른 팔로 팔꿈치를 고정시켜 지속적인 운동에 지장이 되지 않도록 한다.^',
'* 주의 *^
운동 중 팔꿈치가 움직이지 않도록 하며 어깨선 위에 고정시킨다.^
팔꿈치를 옆으로 벌리지 않도록 한다.^'
);
insert into vt_exercise values(17,2,'덤벨 킥백','덤벨',
'
* 운동 준비 자세 / 개요 * ^
상완삼두근의 상부, 특히 바깥쪽 부분을 발달시키는 데 효과적인 운동이다. ^
가벼운 중량으로 반복횟수를 늘려 정확한 자세로 근육의 긴장과 수축에 집중하는 것이 중요하다.^
양손으로 실시하거나 벤치에 엎드려서 실시할 수 있으며, 보다 확실한 긴장과 ^
수축으로 상완삼두근의 발달을 도모하기 위해서는 한 팔씩 교대로 실시하는 방법이 추천된다.^',
'* 운동 방법 *^
1. 벤치에 왼쪽 무릎과 왼손을 대고 등을 곧게 펴고 지면과 수평이 되도록 엎드린다.^
      오른쪽 무릎은 살짝 구부려준다^
2. 오른손으로 덤벨을 잡고 이두근 안쪽을 옆구리에 고정시킨다.^
3. 팔이 지면과 수평을 이룰 때까지 덤벨을 뒤로 들어올린 후 1~2초간 정지한다.^
4. 천천히 저항을 느끼면서 덤벨을 내리며 처음 자세로 돌아온다.반대쪽도 같은 방법으로 실시한다.^',
'* Tip * ^
1. 덤벨을 잡은 손이 어깨선과 나란하거나 약간 높은 위치에 있을 때 수축 효과가 더 크다.^',
'* 주의  *^
등이 지면과 수평에 가깝게 한다. ^
어깨가 과도하게 등 위로 올라가지 않도록 한다.^
운동 중 팔은 옆구리에 붙이고 팔꿈치 각도가 90도 이하가 되지 않게 한다.^
마지막 수축 시 3초간 유지하지 못하면 좀 더 가벼운 무게의 덤벨을 사용한다.'
);
insert into vt_exercise values(18,2,'바벨 트라이셉스 익스텐션','바벨',
'
* 운동 준비 자세 / 개요 * ^
팔 뒤쪽 상완삼두근의 근력을 증가시키고 삼두근의 안쪽 모양을 선명하게 만들어주는 운동이다. ^
상완삼두근의 전체적인 근매스 증대에 효과적이기 때문에 정확한 자세로 운동해야 한다.^',
'* 운동 방법 *^
1. 벤치에 누워 머리 위로 어깨너비보다 좁은 간격으로 바벨을 잡는다.^
2. 팔꿈치를 가슴 앞으로 펴면서 바벨을 들어올린다.손의 힘이 아닌 삼두근의 힘을 이용한다.^
3. 얼굴이 아닌 정수리 위로 포물선을 그리며 천천히 팔꿈치를 구부리며 바벨을 내린다.^',
'* Tip * ^
1. 디클라인 벤치에서 실시하면 가동 범위를 증가시킬 수 있다.^',
'* 주의  *^
팔꿈치가 양옆으로 벌어지지 않도록 해야 한다.^
수축 시 고정된 팔꿈치가 움직이지 않도록 주의한다.^
바벨을 머리 뒤로 내릴 때 허리가 과도하게 들리지 않도록 주의한다.'
);
insert into vt_exercise values(19,2,'오버헤드 덤벨 익스텐션','덤벨',
'
* 운동 준비 자세 / 개요 * ^
상완삼두근 중 특히 장두 부분을 발달시키기에 좋은 운동이다. ^
벤치에 앉아서도 가능하고 일어서서도 가능하며, 상체가 덤벨의 반동으로 인해 흔들리지 않도록 하는 것이 중요하다.^
탄력 있는 팔을 만들고 싶어하는 여성에게 추천하는 운동이다.^',
'* 운동 방법 *^
1. 다리는 어깨너비로 벌리고 덤벨의 한쪽을 두 손으로 포개어 잡는다.^
2. 손바닥이 위쪽을 향하게 덤벨을 머리 위로 쭉 올린다.^
3. 팔꿈치를 머리 측면에 고정시키고 팔꿈치를 구부리며 덤벨을 천천히 머리 뒤로 내린다.^
4. 팔꿈치를 펴는 느낌으로 덤벨을 들어올려 원위치시킨다.^',
'* Tip * ^
1. 이지바로 실시하면 삼두근의 깊은 쪽이 조금 더 많이 활성화된다.^',
'* 주의  *^
팔꿈치를 완전히 펴지 않도록 한다.^
운동 중 팔꿈치가 움직이지 않도록 하며 팔꿈치는 어깨 위에 최대한 고정시킨다.^
팔꿈치가 양옆으로 벌어지면 가동 범위가 줄어들어 운동 효과가 떨어진다.'
);
insert into vt_exercise values(20,2,'케이블 트라이셉스 프레스 다운','케이블 바',
'
* 운동 준비 자세 / 개요 * ^
상완삼두근 운동의 가동 범위를 최대로 활용하여 삼두근의 외측두를 발달시키는 데 효과적인 운동이다. ^
상완삼두근 운동 중 가장 안정적인 자세로 실시할 수 있으며 다른 상완삼두근 운동과 비교했을때 ^
고중량에서도 안정된 자세를 유지하기에 최적의 운동이다.^',
'* 운동 방법 *^
1. 케이블 바를 어깨너비보다 좁게 잡고 무릎을 약간 굽힌다.^
2. 팔꿈치를 옆구리에 고정시키고, 삼두근의 힘으로 팔꿈치를 아래쪽으로 편다.^
3. 천천히 저항을 느끼면서 팔꿈치를 90도 정도로 구부린다.^',
'* Tip * ^
1. 팔꿈치를 옆구리에 붙인 상태로 실시하면 외측부에 많은 자극이 주어진다.^
2. 팔꿈치를 앞으로 내밀거나 로프를 이용하면 삼두근 깊은 곳에 더 많은 자극이 주어진다.^',
'* 주의 *^
팔꿈치를 뒤로 빼지 않도록 한다.^
이완시 몸을 앞으로 구부리지 않도록 한다.^
팔꿈치가 양옆으로 벌어지지 않도록 한다.'
);

/* 다리 운동 */

insert into vt_exercise values(21,3,'런지','바벨',
'
* 운동 준비 자세 / 개요 * ^
대퇴 전면과 둔근을 발달시키기 위한 운동이다. ^
바벨 대신 덤벨을 이용해 실시할 수도 있다.^
또한 다리의 위치 변화를 통해 walking lunge, side lunge등 다양하게 실시할 수 있으며 ^
런지운동 초기엔 다리를 앞으로 내민 상태에서 지속적으로 up/down을 실시하여 균형감과 근육의 동원능력을 숙달시키는 것이 필요하다.^',
'* 운동 방법 *^
1. 바벨을 어깨너비보다 넓게 잡고 선 다음, 바벨을 들어 승모근에 위치시킨다.^
2. 왼발을 앞으로 70~100cm 정도 벌려 내민다.^
3. 앞으로 내민 왼쪽 다리는 허벅지가 지면과 수평이 될 때까지 구부리고, ^
4. 뒤의 오른쪽 다리는 무릎이 자연스럽게 바닥을 향하게 한다.^
5. 발뒤꿈치로 민다는 느낌을 주면서 하체의 힘으로 무릎을 다시 펴서 원위치한다.반대쪽도 같은 방법으로 실시한다.^',
'* Tip * ^
1.등과 허리는 항상 똑바로 편 상태로 실시해야 부상을 방지할 수 있다.^',
'* 주의 *^
운동전 체중을 이용한 자세유지 및 균형운동을 꼭 실시하도록 한다.^
대둔근 발달에 보다 주안점을 두는 운동이므로 보폭을 넓게 하는 것이 권장된다.^
앞으로 걸어나가면서 실시하는 워킹 런지:앞으로 내민 발을 중심으로 일어서게 되면서 대퇴이두근의 역할이 보다 강조되는 효과가 있다.'
);




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
   question varchar2(100) NOT NULL,
   answer varchar2(4000) NOT NULL,
   PRIMARY KEY (num)
);


CREATE TABLE vt_inbody
(
   inbody_id number NOT NULL,
   id varchar2(15) NOT NULL,
   age number NOT NULL,
   height number NOT NULL,
   sex varchar2(10) NOT NULL,
   weight number NOT NULL,
   bmi number NOT NULL,
   check_date date NOT NULL,
   PRIMARY KEY (inbody_id)
);
insert into vt_inbody values(1, 'kimy', 22, 170, 'male', 90, 70, sysdate);
insert into vt_inbody values(2, 'jangb', 32, 160, 'male', 90, 70, sysdate);


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
insert into vt_members values('lees', 1, '111', '이순신', 'nic_lee', '111-6666-2222', '031-222', '서울특별시 강남구 강남동|강남아파트 111-111',  '1111@gmail.com', sysdate);
insert into vt_members values('kimy', 2,  '111', '김유신', 'nic_kim', '111-2222-7777', '031-111', '경기도 안양시 안양동|안양아파트 111-111', '2222@gmail.com',  sysdate);
insert into vt_members values('jangb', 2,  '111', '장보고', 'nic_jang', '111-2222-0000', '121-292', '경기도 군포시 군포동|군포아파트 111-111', '3333@gmail.com',  sysdate);


CREATE TABLE vt_member_routine
(
   mr_id number NOT NULL,
   routineinfo_id number NOT NULL,
   day varchar2(10) NOT NULL,
   exercise_id number NOT NULL,
   count_check number,
   PRIMARY KEY (mr_id)
);
insert into vt_member_routine values(1, 1, 'mon',  1, 24);
insert into vt_member_routine values(2, 1, 'mon',  2, 24);
insert into vt_member_routine values(3, 1, 'mon',  3, 24);

insert into vt_member_routine values(4, 1, 'tue',  4, 24);
insert into vt_member_routine values(5, 1, 'tue',  5, 24);
insert into vt_member_routine values(6, 1, 'tue',  6, 24);

insert into vt_member_routine values(7, 1, 'wed',  1, 24);
insert into vt_member_routine values(8, 1, 'wed',  2, 24);
insert into vt_member_routine values(9, 1, 'wed',  3, 24);

insert into vt_member_routine values(10, 1, 'thur',  4, 24);
insert into vt_member_routine values(11, 1, 'thur',  5, 24);
insert into vt_member_routine values(12, 1, 'thur',  6, 24);

insert into vt_member_routine values(13, 1, 'fri',  1, 24);
insert into vt_member_routine values(14, 1, 'fri',  2, 24);
insert into vt_member_routine values(15, 1, 'fri', 3, 24);


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

insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '공지사항 테스트1' , 0, sysdate, '공지사항 테스트 하하 하');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '공지사항 테스트2' , 0, sysdate, '공지사항 테스트 호호 호');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '공지사항 테스트3' , 0, sysdate, '공지사항 테스트 후후 후');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '공지사항 테스트4' , 0, sysdate, '공지사항 테스트 크크 크');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '공지사항 테스트5' , 0, sysdate, '공지사항 테스트 쿠쿠 쿠');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '공지사항 테스트6' , 0, sysdate, '공지사항 테스트 쿠쿠 쿠');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '공지사항 테스트7' , 0, sysdate, '공지사항 테스트 쿠쿠 쿠');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '공지사항 테스트8' , 0, sysdate, '공지사항 테스트 쿠쿠 쿠');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '공지사항 테스트9' , 0, sysdate, '공지사항 테스트 쿠쿠 쿠');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '하하하하하하하하' , 0, sysdate, '공지사항 테스트 쿠쿠 쿠');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '호호호호호호호호' , 0, sysdate, '공지사항 테스트 쿠쿠 쿠');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '코딩은 재미있어' , 0, sysdate, '공지사항 테스트 쿠쿠 쿠');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '나는야 퉁퉁이' , 0, sysdate, '공지사항 테스트  쿠쿠쿠');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '골목대장 이라네~' , 0, sysdate, '공지사항 테스트 쿠쿠 쿠');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '도라에몽~' , 0, sysdate, '공지사항 테스트 쿠쿠쿠');
insert into vt_notice_board values(nt_board_seq.nextval, 'lees', '뭐 쓰지' , 0, sysdate, '공지사항 테스트 쿠쿠쿠');


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
   trainer_id varchar2(30) NOT NULL,
   PRIMARY KEY (register_id)
);
insert into vt_register values(register_seq.nextval, 'kimy', sysdate, 1, add_months(sysdate, 1), 'true', 'true', 20, 'kimTrainer');
insert into vt_register values(register_seq.nextval, 'jangb', sysdate, 3, add_months(sysdate, 3), 'false', 'true', 20, 'leeTrainer');


CREATE TABLE vt_request
(
   request_num number NOT NULL,
   request_ip varchar2(15) NOT NULL,
   reqest_id varchar2(20) NOT NULL,
   PRIMARY KEY (request_num)
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
insert into vt_routine_info values(1, 'kimy', 'male', 'A-course', sysdate, add_months(sysdate, 1));


CREATE TABLE vt_trainer
(
   trainer_id varchar2(30) NOT NULL,
   trainer_nickname varchar2(30) NOT NULL UNIQUE,
   name varchar2(30) NOT NULL,
   phone varchar2(15) NOT NULL,
   sex varchar2(10) NOT NULL,
   PRIMARY KEY (trainer_id)
);
insert into vt_trainer values('kimTrainer', 'KT', '김트', '010-0001-0001', 'male');
insert into vt_trainer values('leeTrainer', 'LT', '이트', '010-3331-2201', 'male');



/* Create Foreign Keys */

ALTER TABLE vt_members
   ADD FOREIGN KEY (authority_id)
   REFERENCES vt_authority (authority_id)
;


ALTER TABLE vt_comm
   ADD FOREIGN KEY (num)
   REFERENCES vt_board (num)
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


ALTER TABLE vt_comm
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
   ADD FOREIGN KEY (request_num)
   REFERENCES vt_request (request_num)
;


ALTER TABLE vt_member_routine
   ADD FOREIGN KEY (routineinfo_id)
   REFERENCES vt_routine_info (routineinfo_id)
;


ALTER TABLE vt_register
   ADD FOREIGN KEY (trainer_id)
   REFERENCES vt_trainer (trainer_id)
;


