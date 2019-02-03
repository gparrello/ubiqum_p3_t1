SELECT
	date,
    SUM(Sub1),
    SUM(Sub2),
    SUM(Sub3),
    SUM(NotSub)
FROM (

SELECT *
FROM parsed_data

UNION ALL

SELECT
	date,
    0 AS 'Sub1',
	0 AS 'Sub2',
    0 AS 'Sub3',
    0 AS 'NotSub'
FROM all_minutes
) s
GROUP BY date

;
