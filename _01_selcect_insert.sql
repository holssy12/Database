-- Tip) 세미콜론을 만나지 않는 이상, 하나의 명령어로 취급한다.

-- 테이블 내용을 보여주는 명령어
-- limt n : n개의 데이터만 보여준다.
select * from building_Temperature limit 4;

/*
새로운 데이터 입력
*/
insert into building_Temperature(building_id, temperature, reg_date)
values(8, 15, '2021-12-06 13:00:00');

-- 여러 개 데이터 동시입력
insert into building_Temperature(building_id, temperature, reg_date)
values(9, 15, '2021-12-06 13:00:00'), (3, 15, '2021-12-06 13:00:00');