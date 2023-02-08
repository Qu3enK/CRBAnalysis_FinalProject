# Colorado River Basin Analysis (CRB) - Final Project

## Overview of Project
The Colorado River Basin provides water to several states in the Western part of the United States and in recent years the region has face severe droughts, which has led to supply and demand challenges. As part of this effort, information was collected as it pertains to associated lake water levels, snowpacks and precipitation.  The data will organized, conformed and analyzed to determine future potential drought severity for the Western Region.

## Communication Protocols
The Colorado Basin Team established the following communication protocol:
- Communication method(s): Slack, Huddle, Zoom
- Frequecy: Daily
- Information Communicated: 
  - CRB data (lake levels, snowpacks, etc)
  - GitHub for sharing and reviewing scripts
- Project review prior to submitting final work for grading
- 

## ETL Process
### Extract Process
Searched the internet for Western region drought data, Colorado Rocky Mountain snow pack data and Lake Mead and Powell water storage data.  For each dataset the data was queried in the respective site and csv formatted files were extracted.  The csv datasets are as follows:
- Drought for the Western region as percent area
- Colorado river headwaters: Rocky Mountain snow pack as snow water equivalent (SWE) in inches
- Lake Mead water storage in square feet
- Lake Powell water storage in squre feet  

### Transform Process
- Drought dataset for the Western region

- Colorado River headwaters: Rocky Mountain snow pack dataset 

![SWE_dataset_horizontalYear](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_dataset_horizontalYear.png)

![SWE_dataset_removeColumns5](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_dataset_removeColumns5.png)

- Lake Mead water storage dataset

- Lake Powell water storage dataset

### Load Process

