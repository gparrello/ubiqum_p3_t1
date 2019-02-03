CREATE VIEW `parsed` AS
SELECT
	STR_TO_DATE(CONCAT(Date, ' ', Time), '%Y-%m-%d %H:%i:%s') AS 'date',
    Sub_metering_1 AS 'Sub1',
    Sub_metering_2 AS 'Sub2',
    Sub_metering_3 AS 'Sub3',
    (Global_active_power*1000/60 - Sub_metering_1 - Sub_metering_2 - Sub_metering_3) AS 'NotSub'
FROM yr_2006

UNION ALL

SELECT
	STR_TO_DATE(CONCAT(Date, ' ', Time), '%Y-%m-%d %H:%i:%s') AS 'date',
    Sub_metering_1 AS 'Sub1',
    Sub_metering_2 AS 'Sub2',
    Sub_metering_3 AS 'Sub3',
    (Global_active_power*1000/60 - Sub_metering_1 - Sub_metering_2 - Sub_metering_3) AS 'NotSub'
FROM yr_2007

UNION ALL

SELECT
	STR_TO_DATE(CONCAT(Date, ' ', Time), '%Y-%m-%d %H:%i:%s') AS 'date',
    Sub_metering_1 AS 'Sub1',
    Sub_metering_2 AS 'Sub2',
    Sub_metering_3 AS 'Sub3',
    (Global_active_power*1000/60 - Sub_metering_1 - Sub_metering_2 - Sub_metering_3) AS 'NotSub'
FROM yr_2008

UNION ALL

SELECT
	STR_TO_DATE(CONCAT(Date, ' ', Time), '%Y-%m-%d %H:%i:%s') AS 'date',
    Sub_metering_1 AS 'Sub1',
    Sub_metering_2 AS 'Sub2',
    Sub_metering_3 AS 'Sub3',
    (Global_active_power*1000/60 - Sub_metering_1 - Sub_metering_2 - Sub_metering_3) AS 'NotSub'
FROM yr_2009

UNION ALL

SELECT
	STR_TO_DATE(CONCAT(Date, ' ', Time), '%Y-%m-%d %H:%i:%s') AS 'date',
    Sub_metering_1 AS 'Sub1',
    Sub_metering_2 AS 'Sub2',
    Sub_metering_3 AS 'Sub3',
    (Global_active_power*1000/60 - Sub_metering_1 - Sub_metering_2 - Sub_metering_3) AS 'NotSub'
FROM yr_2010
