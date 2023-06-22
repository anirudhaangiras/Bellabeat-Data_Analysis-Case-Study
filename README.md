# Google Data Analytics Capstone Project: How Can a Wellness Technology Company Play It Smart?

## Introduction
[Bellabeat](https://bellabeat.com/) is a  high-tech manufacturer of health-focused products for women. Bellabeat designs technology that informs and inspires women around the world. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with knowledge about their health and habits. Since it was founded in 2013, Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women.

**Characters:**
-   Urška Sršen: Bellabeat's co-founder and Chief Creative Officer
-   Sando Mur: Mathematician and Bellabeat's co-founder; a vital member of the Bellabeat executive team
-   Bellabeat marketing analytics team: A team of data analysts responsible for collecting, analyzing, and reporting data that helps guide Bellabeat's marketing strategy.

**Products:**
-   Bellabeat app: The Bellabeat app provides users health data related to their activity, sleep, stress, menstrual cycle, and mindfulness habits. This data can help users better understand their habits and make healthy decisions. The Bellabeat app connects to their line of intelligent wellness products.
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
- Current: Data is not current as it was collected six years ago.
- Cited: Data is collected by a third-party provider and is not cited.

## Process

I selected Google Sheets to process the data by cleaning and ensuring it is correct, relevant, complete and error-free.

*sleepDay_merged:*
- Changed SleepDay column from text to Date time.
- Created filters to check for missing values.
- COUNTUNIQUE function showed entries from 24 unique participants.

*weightLogInfo_merged:*
- Changed Date column from text to Date time.
- Changed WeightKg, WeightPounds and BMI columns to Number.
- Dropped Fat column as it contained only two values.
- COUNTUNIQUE function showed entries from 8 unique participants.

*dailyActivity_merged:*
- Changed ActivityDate column from text to Date.
- Changed VeryActiveDistance, ModeratelyActiveDistance, LightActiveDistance and SedentaryActiveDistance to Number. 
- COUNTUNIQUE function showed entries from 33 unique participants.

*dailyCalories_merged*
- Changed ActivityDate column from text to Date.
- COUNTUNIQUE function showed entries from 33 unique participants.

*dailySteps_merged*
- Changed ActivityDate column from text to Date.
- COUNTUNIQUE function showed entries from 33 unique participants.

