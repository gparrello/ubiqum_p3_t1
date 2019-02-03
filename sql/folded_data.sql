CREATE TABLE `data_weeks` AS
SELECT
	date_trunc('week', date) AS 'date2',
    SUM(Sub1) AS 'Sub1',
    SUM(Sub2) AS 'Sub2',
    SUM(Sub3) AS 'Sub3',
    SUM(NotSub) AS 'NotSub'
FROM parsed
GROUP BY date2
;
ALTER TABLE `energy`.`data_weeks`
CHANGE COLUMN `date2` `date` TIMESTAMP NULL DEFAULT NULL
;
