SELECT * FROM Building_Info bi ;
SELECT * FROM Building_Temperature bt ;
SELECT * FROM Building_Humidity bh ;

SELECT *
FROM Building_Info join Building_Temperature on Building_Info.building_id = Building_Temperature.building_id ;

# join을 이용해 building_id가 같은 것끼리 붙인다.
SELECT Building_Info.building_name, Building_Temperature.temperature , Building_Temperature.reg_date
FROM Building_Info join Building_Temperature on Building_Info.building_id = Building_Temperature.building_id ;

# 위 코드를 alias를 이용해 줄여보자.
SELECT bi.building_name, bt.temperature, bt.reg_date
FROM Building_Info bi join Building_Temperature bt on bi.building_id = bt.building_id ;

SELECT *
from Building_Info bi join Building_Humidity bh on bi.building_id = bh.building_id ;

/*
	join 		: on 조건에 맞는 것만 테이블에 남긴다.
	left join	: on 조건에 맞지 않더라도, 왼쪽 테이블에 있는 row는 남긴다. ( 빈 정보는 null이 된다. )
	right join	: 오른쪽 남김.
	
	left / right join은 누락된 데이터를 찾을 때 유용하다.
*/
SELECT *
FROM Building_Info bi left join Building_Temperature bt on bi.building_id = bt.building_id ;

SELECT *
FROM Building_Info bi right join Building_Temperature bt on bi.building_id = bt.building_id ;

SELECT bi.building_name , bh.humidity , bh.reg_date 
FROM Building_Info bi left join Building_Humidity bh on bi.building_id = bh.building_id ;

# 3개의 테이블을 붙여보자.
#
# reg_date가 맞지 않는 row가 생성된다.

SELECT *
FROM Building_Info bi 
	JOIN Building_Temperature bt on bi.building_id = bt.building_id 
	JOIN Building_Humidity bh on bi.building_id = bh.building_id ; 


# and로 reg_date에 대한 조건을 걸어주자.
#
#	-> multiple condition

SELECT bi.building_name , bt.temperature , bh.humidity , bh.reg_date 
FROM Building_Info bi 
	JOIN Building_Temperature bt on bi.building_id = bt.building_id 
	JOIN Building_Humidity bh on bi.building_id = bh.building_id 
		and bt.reg_date = bh.reg_date ;
	
	
	
	
	
	
	
	
	

