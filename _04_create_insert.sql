SELECT * from Building_Temperature;

/*
	Building_Info table creation
*/

use FirstDatabase;
CREATE table Building_Info
(
	# column name, column datatype
	rid int auto_increment primary key,
	building_id smallint unique,
	building_name varchar(100)
);

INSERT into Building_Info values(null, 1, '연구동');
INSERT into Building_Info values(null, 2, '도서관');
INSERT into Building_Info values(null, 3, '기숙사');
INSERT into Building_Info values(null, 8, '식당');
INSERT into Building_Info values(null, 9, '체육관');

SELECT * FROM Building_Info bi ;

# 다음 번 INSERT부터 rid가 10에서 증가하기 시작한다.
ALTER table `Building_Info` auto_increment=10;
INSERT into Building_Info values(null, 4, '수영장');


/*
	insert ignore
*/

# building_id는 unique attribute이기 때문에, Error가 뜨고 추가되지 않는다.
#
# 아래 첫 번째 line에서 Error가 발생하기 때문에, 다음 line으로 넘어가지 못 한다.
#	-> ignore 옵션을 통해, Error가 발생해도 다음 줄로 넘어가게 한다.
INSERT ignore into Building_Info values(null, 1, '기초연구동');
INSERT ignore into Building_Info values(null, 5, '과학연구동');

