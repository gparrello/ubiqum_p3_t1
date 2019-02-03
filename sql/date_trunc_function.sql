DELIMITER //
create function date_trunc(vInterval varchar(7), vDate timestamp)
returns timestamp
begin
    declare toReturn timestamp;

    if vInterval = 'year' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(YEAR, '1900-01-01', vDate) YEAR);
    elseif vInterval = 'quarter' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(QUARTER, '1900-01-01', vDate) QUARTER);
    elseif vInterval = 'month' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(MONTH, '1900-01-01', vDate) MONTH);
    elseif vInterval = 'week' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(WEEK, '1900-01-01', vDate) WEEK);
    elseif vInterval = 'day' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(DAY, '1900-01-01', vDate) DAY);
    elseif vInterval = 'hour' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(HOUR, '1900-01-01', vDate) HOUR);
    elseif vInterval = 'minute' then set toReturn = date_add('1900-01-01', interval TIMESTAMPDIFF(MINUTE, '1900-01-01', vDate) MINUTE);
    END IF;

    return toReturn;
end//
DELIMITER ;
