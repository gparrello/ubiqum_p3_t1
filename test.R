pacman::p_load(
  "RMySQL",
  "lubridate",
  "dplyr",
  "imputeTS",
  "rbokeh",
  "padr"
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

# some transformations
df$Datetime <- paste(df$Date, '', df$Time)
df$Datetime <- as.POSIXct(df$Datetime, "%Y/%m/%d %H:%M:%S")
#attr(df$Datetime, "tzone") <- "Europe/Paris"
df$X <- NULL

aggregated_df <- list()
granularity <- c("hour", "day", "week", "month", "season", "year")
for(g in granularity){
  aggregated_df[[g]] <- df %>%
    group_by(date = as.Date(floor_date(Datetime, g))) %>%
    summarize(
      obs = n(),
      sub1 = sum(Sub_metering_1),
      sub2 = sum(Sub_metering_2),
      sub3 = sum(Sub_metering_3),
      nosub = sum(Global_active_power*1000/60 - Sub_metering_1 - Sub_metering_2 - Sub_metering_3),
      active = sum(Global_active_power),
      reactive = sum(Global_reactive_power),
      intensity = mean(Global_intensity),
      voltage = mean(Voltage)
    )
}

daily_df$obs <- as.integer(daily_df$obs)
daily_df <- pad(daily_df)
daily_df[is.na(daily_df$obs),]$obs <- 0
daily_ts <- ts(daily_df, start=c(2006,12,16), frequency = 365)
daily_ts_imputed <- na.kalman(daily_ts)

# p <- figure() %>%
  # ly_points(daily_ts, x = date, y = obs, color='purple') #%>%
  #ly_lines(daily_df, x = date, y = sub1, color='green') %>%
  #ly_lines(daily_df, x = date, y = sub2, color='red') %>%
  #ly_lines(daily_df, x = date, y = sub3, color='blue')
