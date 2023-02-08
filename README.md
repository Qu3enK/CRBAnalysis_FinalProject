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

CSV extract:
![SWE_dataset_horizontalYear](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_dataset_horizontalYear.png)

The data content needed for the database build and ML component is 'year', 'month', and 'AvgSWE'.  The csv extract was formatted with 'year' horizontally across the first row and date (mo/day) vertically down column A.  The first transform step was converting the year row into a column corresponding with the dataset.  This was achieved by using `set_index` and `reset_index` functions.
![SWE_dataset_horizontalYear_reformat](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_dataset_horizontalYear_reformat.png)

Next, the year and date were merged into a single column labeled "DATE" by the following code:

![SWE_stringDate](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_stringDate.png)

![SWE_DATEcolumn](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_DATEcolumn.png)

![SWE_DatetimeIndex](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_DatetimeIndex.png)

![SWE_year&month](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_year&month.png)

![SWE_groupby&mean2](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_groupby&mean2.png)

![SWE_dataset_removeColumns5](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_dataset_removeColumns5.png)

- Lake Mead water storage dataset

- Lake Powell water storage dataset

### Load Process

