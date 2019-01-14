SELECT Date, (24*60)-records AS missing
FROM (
	SELECT Date, COUNT(1) AS records
	FROM (
		SELECT * FROM dataanalytics2018.yr_2006
		UNION ALL
		SELECT * FROM dataanalytics2018.yr_2007
		UNION ALL
		SELECT * FROM dataanalytics2018.yr_2008
		UNION ALL
		SELECT * FROM dataanalytics2018.yr_2009
		UNION ALL
		SELECT * FROM dataanalytics2018.yr_2010
		) AS united
	GROUP BY Date
    ) AS sub
WHERE records != 24*60
ORDER BY missing DESC
;
