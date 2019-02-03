CREATE TABLE `hours` AS
SELECT
        FROM_UNIXTIME(UNIX_TIMESTAMP('2006-01-01 00:00:00') + (`seq_1_to_43824`.`seq` - 1) * 60 * 60) AS `date`
FROM
        `seq_1_to_43824`
