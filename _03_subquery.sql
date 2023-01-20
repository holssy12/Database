
/* 
	SQL 문법 규칙
	-> 아래 순서대로 써야 한다!

	select
	from
	where
	group by
	having
	order by
*/

SELECT * FROM Building_Temperature;

SELECT * FROM Building_Temperature WHERE `temperature` >= 15;

# 괄호 안 부분이 곧 15가 된다! ( 9번 빌딩의 온도 )
SELECT * FROM Building_Temperature WHERE `temperature` >= ( SELECT `temperature` FROM Building_Temperature WHERE `building_id` = 9 );

# 괄호 안 부분이 2개 이상이 되어 오류가 발생한다.
# SELECT * FROM Building_Temperature WHERE `building_id` >= ( SELECT `building_id` FROM Building_Temperature WHERE `temperature` = 15 );

/*
	any, some, all
	
	any  : or
	all  : and
	some : or	( == any )
*/

SELECT * FROM Building_Temperature WHERE `building_id` >= all ( SELECT `building_id` FROM Building_Temperature WHERE `temperature` = 15 );
SELECT * FROM Building_Temperature WHERE `building_id` >= any ( SELECT `building_id` FROM Building_Temperature WHERE `temperature` = 15 );
SELECT * FROM Building_Temperature WHERE `building_id` >= some ( SELECT `building_id` FROM Building_Temperature WHERE `temperature` = 15 );

/*
	테이블 생성, 서브쿼리를 이용한 테이블 생성  
	
	참고) 
		Drop Table : 테이블을 완전히 삭제시킨다. 
		Truncate Table : 테이블은 남겨두고, 내용만 삭제시킨다.  
*/

CREATE table temp_table (select * from Building_Temperature WHERE `building_id` > 3);
SELECT * FROM temp_table;

/*
	distinct : 중복된 것은 한 번만 찍으시오. 
*/

SELECT distinct reg_date from Building_Temperature;

/*
	aggregate funtion
	-> avg, max, min
	-> stddev   : 표준편차 
	-> var_samp : 분산 
	
	Tip) as `문자열`을 활용하여, 결과 테이블에 표시 될 이름을 바꿀 수 있다.
		 원본 테이블을 바꾸는 건 아니다. 단지, 결과로 보일 때만 변경되는 것.
*/

SELECT avg(`temperature`), max(`temperature`), min(`temperature`) from Building_Temperature;
SELECT stddev(`temperature`) as `온도 표준편차`, var_samp(`temperature`) as `온도 분산` from Building_Temperature;

/*
 	count : 개수만 세고 싶을 때.
 */

SELECT count(*) FROM Building_Temperature;

# 빌딩 1과 빌딩 2의 평균 온도보다 같거나 높았던 빌딩의 정보를 모두 출력하시오.
SELECT * from Building_Temperature where temperature >= 
( SELECT avg(temperature) from Building_Temperature WHERE (building_id = 1 or building_id  = 2 ) AND 
building_id != 1 or building_id != 2);


/*
	group by
*/

# 빌딩 별로 평균 온도를 출력해 보고 싶다.
SELECT building_id, avg(temperature) from Building_Temperature group by `building_id`;


/*
	having : aggregate function이 들어간 조건
	
	Why? ) where에서는 aggregate function 사용이 어렵기 때문... 
*/

# 평균 온도가 12도 보다 높았던 빌딩 번호를 알아보자.
SELECT building_id, avg(temperature) from Building_Temperature group by `building_id` having avg(`temperature`) > 12.0;


/*
	rollup
*/

# group by로 구한 빌딩 별 평균 온도 말고도, 전체 평균 온도도 보고 싶다.
SELECT building_id, avg(temperature) from Building_Temperature group by `building_id` with rollup;





