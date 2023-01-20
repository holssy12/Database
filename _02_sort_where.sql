
select * from building_Temperature;

/*
	select with column names : 원하는 comlums만 출력한다.
    pin table : 가져온 테이블에 핀을 설정해 남아있게 한다. 
    names with backtick : 필수는 아니지만, 명확한 구분을 위해서 쓰기도 한다.
*/
select `building_id`, `temperature` from `building_Temperature`;
select `reg_date`, building_id, temperature, `rid` from building_Temperature;

/*
	sort by column names
    order by
    asc (default) : 오름차순이 디폴트이다.
    desc
    order by with limit : 출력 개수 제한
    order by multiple columns : 여러 기준으로 정렬하기.
*/

select * from building_Temperature order by `building_id` asc;
select * from building_Temperature order by `building_id` desc limit 1; -- building_id가 가장 큰 1개만 출력하라.

-- building_id를 오름차순으로 정렬 후, rid 내림차순으로 정렬한다.
-- building_id가 같은 것이 있으면, rid가 높은 것부터...
select * from building_Temperature order by `temperature` asc, `rid` desc;

/*
	where clause -- condition
    comparison operators : >, <, >=, <=, =, !=
    logical operators : and, or
    in operator
*/

select * from building_Temperature where `reg_date` < '2021-12-06 13:30:00';
select * from building_Temperature where `reg_date` < '2021-12-06 13:30:00' order by `rid` desc;

SELECT * FROM Building_Temperature WHERE `reg_date` < '2021-12-06 13:30:00' AND building_id  = 1;
SELECT * FROM Building_Temperature WHERE `reg_date` != '2021-12-06 13:00:00';

# SELECT * FROM Building_Temperature WHERE `building_id` = 1 OR `building_id` = 8 OR `building_id` = 9;
SELECT * FROM Building_Temperature WHERE `building_id` in (1, 8, 9); # 위 코드와 같은 표현

SELECT * FROM Building_Temperature WHERE (reg_date < '2021-12-06 13:30:00' and temperature > 9) or
(building_id = 1 and temperature < 20.0);








