SELECT
       FROM_UNIXTIME(UNIX_TIMESTAMP('2006-01-01 00:00:00') + `seq_1_to_157766400`.`seq` - 1) AS `date`
   FROM
       `seq_1_to_157766400`
