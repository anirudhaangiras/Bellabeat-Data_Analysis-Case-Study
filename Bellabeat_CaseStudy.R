install.packages(tidyverse)
library(tidyverse)

activity <- read_csv("C:/Users...dailyActivity_merged.csv")
sleep <- read_csv("C:/Users...sleepDay_merged.csv")

head(activity)
head(sleep)

install.packages(lubridate)
library(lubridate)

activity$ActivityDate <- mdy(activity$ActivityDate)
sleep$SleepDay <- mdy_hms(sleep$SleepDay,tz=Sys.timezone())

n_distinct(activity$Id)
n_distinct(sleep$Id)

activity_cl <- distinct(activity)
sleep_cl <- distinct(sleep)

write.csv(activity_cl,"C:\\Users...activity.csv", row.names = FALSE)
write.csv(sleep_cl,"C:\\Users...sleep.csv", row.names = FALSE)


activity %>% select(TotalSteps, TotalDistance, Calories) %>%  summary()
activity %>% select(VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes) %>% summary()
sleep %>% select(TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed) %>% summary()

activity_cl %>% group_by(activity_cl$Id) %>% summarise(avg_steps = mean(TotalSteps), avg_distance = mean(TotalDistance))

sleep_cl %>% group_by(sleep_cl$Id) %>% summarise(avg_sleep = mean(TotalMinutesAsleep))