
/*
	unique key vs primary key
	-> 공통점 : 중복된 값이 생길 수 없다.
	-> 차이점 : unique key는 null이 될 수 있다. 하지만, primary key는 무조건 값이 있어야 한다.
*/

/*
	1. Table 단위
		-> 어떻게 해야 중복된 정보 없이 테이블을 효율적으로 나눌 수 있을까?
	
	2. Table 설계
		-> Column, Data type, Options...
*/

use FirstDatabase;
CREATE table if not exists Building_In_Out (
	rid int auto_increment primary key comment '데이터 일련번호',
	building_id smallint unsigned comment '건물 고유번호, Building_Info 테이블에서 사용되는 값',
	reg_date timestamp default current_timestamp comment '측정시간',
	num_in smallint unsigned default 0 comment '건물 입장 인원',
	num_out smallint unsigned default 0 comment '건물 퇴장 인원',
	sensor_id varchar(20) null comment '센서 이름',
	sensor_hash varchar(40) unique comment '센서 해쉬값, 데이터 정확성, 변조불가성'
);

SELECT * from Building_In_Out bio ;

INSERT into Building_In_Out(building_id, num_in, num_out, sensor_hash) values(1, 10, 3, 'sasd3891');
INSERT into Building_In_Out(building_id, num_in, sensor_hash) values(1, 10, 'djfi3647');

# sensor_hash는 unique key이므로, Error 발생. 
INSERT into Building_In_Out(building_id, num_in, num_out, sensor_hash) values(3, 10, 3, 'sasd3891');





