SELECT
  time,
  SUM(Sub1) AS S1,
  SUM(Sub2) AS S2,
  SUM(Sub3) AS S3,
  SUM(NotSub) AS NS
FROM (

SELECT
	UNIX_TIMESTAMP(DATE(FROM_UNIXTIME(1293836400) /*$__timeTo()*/) - INTERVAL c.number DAY) AS time,
	0 AS Sub1,
  0 AS Sub2,
  0 AS Sub3,
  0 AS 'NotSub'
FROM (SELECT singles + tens + hundreds + thousands number FROM
( SELECT 0 singles
UNION ALL SELECT   1 UNION ALL SELECT   2 UNION ALL SELECT   3
UNION ALL SELECT   4 UNION ALL SELECT   5 UNION ALL SELECT   6
UNION ALL SELECT   7 UNION ALL SELECT   8 UNION ALL SELECT   9
) singles JOIN
(SELECT 0 tens
UNION ALL SELECT  10 UNION ALL SELECT  20 UNION ALL SELECT  30
UNION ALL SELECT  40 UNION ALL SELECT  50 UNION ALL SELECT  60
UNION ALL SELECT  70 UNION ALL SELECT  80 UNION ALL SELECT  90
) tens  JOIN
(SELECT 0 hundreds
UNION ALL SELECT  100 UNION ALL SELECT  200 UNION ALL SELECT  300
UNION ALL SELECT  400 UNION ALL SELECT  500 UNION ALL SELECT  600
UNION ALL SELECT  700 UNION ALL SELECT  800 UNION ALL SELECT  900
) hundreds JOIN
(SELECT 0 thousands
UNION ALL SELECT  100 UNION ALL SELECT  200 UNION ALL SELECT  300
UNION ALL SELECT  400 UNION ALL SELECT  500 UNION ALL SELECT  600
UNION ALL SELECT  700 UNION ALL SELECT  800 UNION ALL SELECT  900
) thousands
ORDER BY number DESC) c
WHERE c.number BETWEEN 0 and (DATEDIFF(FROM_UNIXTIME(1293836400) /*$__timeTo()*/, FROM_UNIXTIME(1136070000) /*$__timeFrom()*/))-1

UNION ALL

SELECT
  UNIX_TIMESTAMP(STR_TO_DATE(CONCAT(Date, ' ', Time), '%Y-%m-%d %H:%i:%s')) AS 'time',
  Sub1,
  Sub2,
  Sub3,
  (Global_active_power*1000/60 - Sub1 - Sub2 - Sub3) AS 'NotSub'
FROM (
  SELECT
    Date,
    Time,
    Sub_metering_1 AS 'Sub1',
    Sub_metering_2 AS 'Sub2',
    Sub_metering_3 AS 'Sub3',
    Global_active_power
  FROM yr_2006
  UNION ALL
  SELECT
    Date,
    Time,
    Sub_metering_1 AS 'Sub1',
    Sub_metering_2 AS 'Sub2',
    Sub_metering_3 AS 'Sub3',
    Global_active_power
  FROM yr_2007
  UNION ALL
  SELECT
    Date,
    Time,
    Sub_metering_1 AS 'Sub1',
    Sub_metering_2 AS 'Sub2',
    Sub_metering_3 AS 'Sub3',
    Global_active_power
  FROM yr_2008
  UNION ALL
  SELECT
    Date,
    Time,
    Sub_metering_1 AS 'Sub1',
    Sub_metering_2 AS 'Sub2',
    Sub_metering_3 AS 'Sub3',
    Global_active_power
  FROM yr_2009
  UNION ALL
  SELECT
    Date,
    Time,
    Sub_metering_1 AS 'Sub1',
    Sub_metering_2 AS 'Sub2',
    Sub_metering_3 AS 'Sub3',
    Global_active_power
  FROM yr_2010
  ) AS s
WHERE
      UNIX_TIMESTAMP(STR_TO_DATE(CONCAT(Date, ' ', Time), '%Y-%m-%d %H:%i:%s')) >= FROM_UNIXTIME(1136070000) /*$__timeFrom()*/
  AND UNIX_TIMESTAMP(STR_TO_DATE(CONCAT(Date, ' ', Time), '%Y-%m-%d %H:%i:%s')) < FROM_UNIXTIME(1293836400) /*$__timeTo()*/

) as a
GROUP BY time
ORDER BY time

;
