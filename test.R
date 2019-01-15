pacman::p_load(
  "RMySQL"
)

years <- c('2006', '2007', '2008', '2009', '2010')
allFile <- "./data/original.csv"
if(!file.exists(allFile)){
  conn = dbConnect(
    MySQL(),
    user='deepAnalytics',
    password='Sqltask1234!',
    dbname='dataanalytics2018',
    host='data-analytics-2018.cbrosir2cswx.us-east-1.rds.amazonaws.com'
  )
  query <- ""
  for(yr in years){
    if(!yr == head(years,1)){
      query <- paste(query, "UNION ALL")
    }
    query <- paste(query, " SELECT * FROM yr_", yr, sep='')
  }
  df <- dbGetQuery(
    conn,
    query
  )
  write.csv(df, file=allFile)
} else {
  df <- read.csv(allFile)
}
df$Date <- as.Date(df$Date)
