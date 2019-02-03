CREATE TABLE `days` AS
SELECT
        FROM_UNIXTIME(UNIX_TIMESTAMP('2006-01-01 00:00:00') + (`seq_1_to_1826`.`seq` - 1) * 60 * 60 * 24) AS `date`
FROM
        `seq_1_to_1826`
