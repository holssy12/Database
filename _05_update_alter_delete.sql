/*
	update
	alter table add
	on duplicate key update
	delete
*/

select * from Building_Info bi ;

# 1번 빌딩의 이름을 첨단연구동으로 재할당.
UPDATE `Building_info` set `building_name` = '첨단연구동' where `building_id` = 1;

# 테이블에 max_capacity라는 column 추가.
ALTER table `Building_Info`
add max_capacity smallint unsigned;

# update 시 where를 사용하지 않으면, 모든 row에 적용된다.
update `Building_Info` set `max_capacity` = 200;

# unsigned에 음수값을 저장하면 Error 발생.
update `Building_Info` set `max_capacity` = -200;

# column에 연산 가능.
update `Building_Info` set `max_capacity` = `max_capacity` * 2 where `building_name` = '식당';

# 중복된 정보가 있을 시, 지정해서 할당 가능.
INSERT into `Building_Info` values(null, 1, '자유연구동', 200)
on duplicate key update `building_name` = '자유연구동';

# delete는 위험하다. 꼭 조건에 맞는 것만 지울 수 있게 하자.
DELETE FROM `Building_Info` where `max_capacity` > 200;


