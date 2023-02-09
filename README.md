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

- Colorado River headwaters: Rocky Mountain snow water equivalent (SWE) dataset 

The data content needed for the database build and ML component is 'year', 'month', and 'AvgSWE' as singular columns.  The raw csv extract format was as follows:

![SWE_dataset_horizontalYear](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_dataset_horizontalYear.png)

The raw csv extract had multiple columns not needed which were removed with the `remove_columns` function.  Second, the csv extract was formatted with 'year' horizontally across the first row and date (mo/day) vertically down column A.  The transform step to convert the first row with year into a column corresponding with the dataset was achieved by using `set_index` and `reset_index` functions as follows:
![SWE_dataset_horizontalYear_reformat](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_dataset_horizontalYear_reformat.png)

Next, the year and date were merged into a single column labeled "DATE" by the following `datetime` code:

![SWE_stringDate](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_stringDate.png)

![SWE_DATEcolumn](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_DATEcolumn.png)

Next, to split the year and month into separate columns the `DatetimeIndex` was used as follows:

![SWE_DatetimeIndex](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_DatetimeIndex.png)

![SWE_year&month](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_year&month.png)

The final transform steps were using the `groupby` function to aggregate by-year, by-month and the `mean` function on the "Value" column to calculate the average by month.  The "Value" column was renamed as "AvgSWE".

![SWE_groupby&mean2](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_groupby&mean2.png)

![SWE_dataset_removeColumns5](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_dataset_removeColumns5.png)

- Lake Mead water storage dataset

The Lake Mead raw dataset 

![LM_dataset_1a](https://user-images.githubusercontent.com/112449480/217949533-eda1bcd4-644e-4b47-878f-ed522a84788a.png)

Converted the format of the 'datetime' column to a `date` type, then split out the month and year.  

![LM_dateconversion_1b](https://user-images.githubusercontent.com/112449480/217950344-9a3a47db-8fe5-4093-a5bc-23b080f4935f.png)

The final transformation was obtaining the `mean` of the lake level by year and month.  

![LM_finalformat_1c](https://user-images.githubusercontent.com/112449480/217951521-fdba7446-70f1-4d03-8e4e-9db653ac6b45.png)


- Lake Powell water storage dataset

The Lake Powell raw dataset

![LP_dataset_1a](https://user-images.githubusercontent.com/112449480/217954734-04740c09-71d3-43c2-88e7-4c9aace78f15.png)


Converted the format of the 'datetime' column to a `date` type, then split out the month and year.  

![LP_dateconversion_1b](https://user-images.githubusercontent.com/112449480/217954760-2f410e61-5713-483b-b5de-7cd30946f338.png)


The final transformation was obtaining the `mean` of the lake level by year and month.  

![LP_finalformat_1c](https://user-images.githubusercontent.com/112449480/217954797-668c1904-2046-4f2f-9485-7bccf14e5b16.png)



### Load Process

## Reference Section
- Drought for the Western region as percent area; https://droughtmonitor.unl.edu/DmData/DataDownload/ComprehensiveStatistics.aspx
- Colorado river headwaters: Rocky Mountain snow pack as snow water equivalent (SWE) in inches; https://www.nrcs.usda.gov/Internet/WCIS/AWS_PLOTS/basinCharts/POR/WTEQ/assocHUCco_8/colorado_headwaters.html
- Lake Mead water storage in square feet; https://www.usbr.gov/uc/water/hydrodata/
- Lake Powell water storage in squre feet; https://www.usbr.gov/uc/water/hydrodata/
