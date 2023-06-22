# Google Data Analytics Capstone Project: How Can a Wellness Technology Company Play It Smart?

## Introduction

[Bellabeat](https://bellabeat.com/) is a  high-tech manufacturer of health-focused products for women. Bellabeat designs technology that informs and inspires women around the world. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with knowledge about their health and habits. Since it was founded in 2013, Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women.

**Characters:**
-   Urška Sršen: Bellabeat's co-founder and Chief Creative Officer
-   Sando Mur: Mathematician and Bellabeat's co-founder; a vital member of the Bellabeat executive team
-   Bellabeat marketing analytics team: A team of data analysts responsible for collecting, analyzing, and reporting data that helps guide Bellabeat's marketing strategy.

**Products:**
-   Bellabeat app: The Bellabeat app provides users health data related to their activity, sleep, stress, menstrual cycle, and mindfulness habits. This data can help users better understand their practices and make healthy decisions. The Bellabeat app connects to their line of intelligent wellness products.
-   Leaf: Bellabeat's classic wellness tracker can be worn as a bracelet, necklace, or clip. The Leaf Tracker connects to the Bellabeat app to track activity, sleep, and stress.
-   Time: This wellness watch combines the timeless look of a classic timepiece with intelligent technology to track user activity, sleep, and stress. The Time watch connects to the Bellabeat app to provide insights into your daily wellness.
-   Spring: This water bottle tracks daily water intake using innovative technology to ensure you are appropriately hydrated throughout the day. The Spring bottle connects to the Bellabeat app to track your hydration levels.
-   Bellabeat membership: Bellabeat also offers a subscription-based membership program for users.
Membership gives users 24/7 access to fully personalized guidance on nutrition, activity, sleep, health and beauty, and mindfulness-based on their lifestyle and goals.

In this hypothetical scenario, I am a junior data analyst working on the marketing analyst team at Bellabeat. Bellabeat's co-founders believe that analyzing smart device fitness data could help unlock new growth opportunities for the company. I have been asked to focus on one of Bellabeat's products and analyze intelligent device data to understand how consumers use their smart devices. The insights discovered will then help guide the marketing strategy for the company.

I have been encouraged to use public data that explores smart device users' daily habits, specifically, the [FitBit Fitness Tracker Data](https://www.kaggle.com/datasets/arashnic/fitbit). Analysing FitBit fitness tracker data will help gain insights into how consumers use the FitBit app and discover trends for Bellabeat marketing strategy.

## Ask

**Business Task:**

Analyse Fitbit Fitness tracker data to gain insights into how consumers use smart devices and discover trends to guide the Bellabeat marketing strategy.

**Key Questions:**
- What are some trends in smart device usage?
- How could these trends apply to Bellabeat customers?
- How could these trends help influence Bellabeat's marketing strategy?

## Prepare

In the prepare phase, we identify the data being used and its credibility.

**Data Source:** 

The data is publicly available on [Kaggle](https://www.kaggle.com/datasets/arashnic/fitbit). Thirty eligible Fitbit users consented to submit personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring, generated between 12 March 2016 and 12 May 2016. The data was inspired by human temporal routine behavioural analysis and pattern recognition.
The data is stored in 18 CSV files, but I have focused my analysis on the following five files:
- sleepDay_merged
- weightLogInfo_merged
- dailyActivity_merged
- dailyCalories_merged
- dailySteps_merged

**Data Limitations:**

Data was collected six years ago, which renders the insights derived from the data untimely and irrelevant as the participants’ daily activity, fitness, sleeping habits, diet and food consumption may have changed since then. The sample size of 30 FitBit users does not represent the entire fitness population, nor can it be representative of yearly trends in activity, as the data was collected over two months. 

**Data Credibility:**

To assess the credibility of the data, I followed the ROCCC criteria:
- Reliability: Data is reliable for the analysis as it contains fitness data relating to sleep, steps taken, calorie intake and heart rate.
- Original: Data was collected by a third-party provider (Amazon Mechanical Turk).
- Comprehensive: Data is comprehensive as its parameters match those of Bellabeat's products
- Current: Data needs to be updated as it was collected six years ago.
- Cited: Data is collected by a third-party provider and is not cited.

## Process

I initially selected Google Sheets to process the data and draw small conclusions from the dataset, afterwards using the R programming language to transform and process the data further.

**Google Sheets Changelog:**

*sleepDay_merged:*
- Changed SleepDay column from text to Date time.
- Created filters to check for missing values.
- COUNTUNIQUE function showed entries from 24 unique participants.

*weightLogInfo_merged:*
- Changed the Date column from text to Date time.
- Created filters to check for missing values.
- Changed WeightKg, WeightPounds and BMI columns to Number.
- Dropped Fat column as it contained only two values.
- COUNTUNIQUE function showed entries from 8 unique participants.

*dailyActivity_merged:*
- Changed ActivityDate column from text to Date.
- Created filters to check for missing values.
- Changed VeryActiveDistance, ModeratelyActiveDistance, LightActiveDistance and SedentaryActiveDistance to Number. 
- COUNTUNIQUE function showed entries from 33 unique participants.

*dailyCalories_merged*
- Changed ActivityDate column from text to Date.
- Created filters to check for missing values.
- COUNTUNIQUE function showed entries from 33 unique participants.

*dailySteps_merged*
- Changed ActivityDate column from text to Date.
- Created filters to check for missing values.
- COUNTUNIQUE function showed entries from 33 unique participants.

8 participants in the weightLogInfo_merged dataset are not significant to make any significant recommendations and conclusions. Furthermore, data from dailyCalories_merged and dailySteps_merged is available in the dailyActivity_merged dataset. Therefore, for further analysis, dailyActivity_merged and sleepDay_merged datasets will be used.

**R Data Cleaning:**
- Install and activate the required packages
- Count the number of unique participants
- Change the ActivityDate and SleepDay columns from character to Date time
- Remove duplicate rows from the dataset
```
install.packages(tidyverse)
library(tidyverse)
install.packages(lubridate)
library(lubridate)

activity <- read_csv("...dailyActivity_merged.csv")
sleep <- read_csv("...sleepDay_merged.csv")

n_distinct(activity$Id)
n_distinct(sleep$Id)

activity$ActivityDate <- mdy(activity$ActivityDate)
sleep$SleepDay <- mdy_hms(sleep$SleepDay,tz=Sys.timezone())

activity_cl <- distinct(activity)
sleep_cl <- distinct(sleep)
```

## Analyse 
To analyse the data, summary statistics were created using R
```
activity %>%
  select(TotalSteps, TotalDistance, Calories) %>%
  summary()
```
![Summary: Steps, Distance and Calories](https://github.com/anirudhaangiras/Bellabeat-Data_Analysis-Case-Study/blob/main/Analyse/1.png)

```
activity %>%
   select(VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes) %>%
   summary()
```
![Summary: Active Category Minutes](https://github.com/anirudhaangiras/Bellabeat-Data_Analysis-Case-Study/blob/main/Analyse/2.png)

```
sleep %>%
  select(TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed) %>%
  summary()
```
![Summary: Sleep Records](https://github.com/anirudhaangiras/Bellabeat-Data_Analysis-Case-Study/blob/main/Analyse/3.png)

Some interesting insights can be drawn from these statistics. 
- Average distance covered is 5.49 kilometres, and the average steps taken are 7,638. These numbers are lower than the CDC-recommended 10,000 steps per day, which is equivalent to about 8 kilometres for most people.
- The average participant burns 2304 calories per day or about 96 calories per hour.
- Active minutes summary shows that most participants are sedentary throughout the day, with some being lightly active. Very few people are fairly or very active.
- The average participant sleeps 1 time for about 7 hours, which is a good amount of sleep as recommended by the CDC.
- The average participant sleeps more than 90% of their time in bed.

## Share

Data visualisations were created using Tableau Public. The Dashboard is shown below and can be found [here](https://public.tableau.com/app/profile/anirudha.sharma/viz/BellabeatCaseStudy_16874537645290/BellabeatCaseStudy).

![Dashboard: Bellabeat Case Study](https://github.com/anirudhaangiras/Bellabeat-Data_Analysis-Case-Study/blob/main/Analyse/4.png)

These data visualisations show some interesting trends.
- The Weekday vs Average Distance bar graph shows a consistent amount of distance walked throughout the week with a slight decrease on Sunday.
- The Weekday vs Average Sleep bar graph shows consistent sleep throughout the week with a slight increase in sleep patterns on weekends on Wednesday.
- The Active Minutes Pie Chart shows that most participants remain sedentary throughout the day, with a very little amount of activity being very active or fairly active.

## Act
