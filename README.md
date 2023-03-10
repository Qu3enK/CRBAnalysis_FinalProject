# Colorado River Basin Analysis (CRB) - Final Project
![readme_main_pic4](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/readme_main_pic4.jpg), ![readme_main_pic](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/readme_main_pic.jpg), ![readme_main_pic5](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/readme_main_pic5.jpg)

## Overview of Project
The Colorado River Basin provides water to several states in the Western part of the United States and in recent years the region has face severe droughts, which has led to supply and demand challenges. As part of this effort, information was collected as it pertains to associated lake water levels, snowpacks and precipitation.  The data will be organized, conformed and analyzed to determine future potential drought severity for the Western Region.

## Communication Protocols
The Colorado River Basin Team established the following communication protocol:
- Communication method(s): Slack, Huddle, Zoom
- Frequecy: Daily
- Information Communicated: 
  - CRB data (lake levels, snowpacks, etc)
  - GitHub for sharing and reviewing scripts
- Project review prior to submitting final work for grading

## ETL Process
### Extract Process
The team searched the internet for the Colorado River Basin drought data, Colorado Rocky Mountain snow pack data and Lake Mead and Powell water storage data.  For each dataset the data was queried in the respective site and csv formatted files were extracted.  The csv datasets are as follows:
- Drought for the Colorado River Basin as percent area
- Colorado River headwaters: Rocky Mountain snow pack as snow water equivalent (SWE) in inches
- Lake Mead water storage in square feet
- Lake Powell water storage in square feet  

### Transform Process
We used python and pandas for the transform process.

### Colorado River headwaters: Rocky Mountain snow water equivalent (SWE) dataset 

The data content needed for the database build and ML component is 'year', 'month', and 'AvgSWE' as singular columns.  The raw csv extract format was as follows:

![SWE_dataset_horizontalYear](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_dataset_horizontalYear.png)

1) The raw csv extract had multiple columns not needed which were removed with the `remove_columns` function.  Second, the csv extract was formatted with 'year' horizontally across the first row and date (mo/day) vertically down column A.  The transform step to convert the first row with year into a column corresponding with the dataset was achieved by using `set_index` and `reset_index` functions as follows:
![SWE_dataset_horizontalYear_reformat](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_dataset_horizontalYear_reformat.png)

2) The year and date were merged into a single column labeled "DATE" by the following `datetime` code:

![SWE_stringDate](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_stringDate.png)

![SWE_DATEcolumn](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_DATEcolumn.png)

3) To split the year and month into separate columns the `DatetimeIndex` was used as follows:

![SWE_DatetimeIndex](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_DatetimeIndex.png)

![SWE_year&month](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_year&month.png)

4) The final transform steps were using the `groupby` function to aggregate by-year, by-month and the `mean` function on the "Value" column to calculate the average by month.  The "Value" column was renamed as "AvgSWE".

![SWE_groupby&mean2](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_groupby&mean2.png)

![SWE_dataset_removeColumns5](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/SWE_dataset_removeColumns5.png)

### Lake Mead water storage dataset

The Lake Mead raw dataset 

![LM_dataset_1a](https://user-images.githubusercontent.com/112449480/217949533-eda1bcd4-644e-4b47-878f-ed522a84788a.png)

1) Converted the format of the 'datetime' column to a `date` type, then split out the month and year.  

![LM_dateconversion_1b](https://user-images.githubusercontent.com/112449480/217950344-9a3a47db-8fe5-4093-a5bc-23b080f4935f.png)

2) The final transformation was obtaining the `mean` of the lake level by year and month.  

![LM_finalformat_1c](https://user-images.githubusercontent.com/112449480/217951521-fdba7446-70f1-4d03-8e4e-9db653ac6b45.png)


### Lake Powell water storage dataset

The Lake Powell raw dataset

![LP_dataset_1a](https://user-images.githubusercontent.com/112449480/217954734-04740c09-71d3-43c2-88e7-4c9aace78f15.png)

1) Converted the format of the 'datetime' column to a `date` type, then split out the month and year.  

![LP_dateconversion_1b](https://user-images.githubusercontent.com/112449480/217954760-2f410e61-5713-483b-b5de-7cd30946f338.png)

2) The final transformation was obtaining the `mean` of the lake level by year and month.  

![LP_finalformat_1c](https://user-images.githubusercontent.com/112449480/217954797-668c1904-2046-4f2f-9485-7bccf14e5b16.png)

### Drought Dataset
For the drought dataset, the following steps were performed to transform and clean the data:

1)	We imported the csv and looked at the data types to determine if any columns needed to be converted
![Import steps](https://user-images.githubusercontent.com/112994018/217967455-5d746a1b-cb69-492a-acc6-68ec7bd9cf62.png)

2)	We then determined if any null values were present to avoid skewing the dataset. The .isna revealed there were 0 null values present

3)	Next the MapDate column was converted to a date format using the ???Datetime??? tool. In order to get the correct format, we applied ???format =??? %Y%m%d" to the table
![Datetime](https://user-images.githubusercontent.com/112994018/217967525-7f3c72df-e05f-4a35-ad24-28d2eddd0c83.png)

4)	We then separated month and year into two new columns and sorted values based on year and month
![Seperate month](https://user-images.githubusercontent.com/112994018/217967545-11f40138-b5e9-41f8-8037-67b65335c693.png)

5)	Next the month name was extracted using the str.slice() function
![Slice](https://user-images.githubusercontent.com/112994018/217967578-0237d6e3-5ce2-4f1b-a645-89f9390d0a5d.png)

6)	A filter was then applied to the table to only pull information from the ???West??? region since that represents the intended study area for the model
![Filter](https://user-images.githubusercontent.com/112994018/217967594-38ca5a3d-24e6-41cb-b973-ad67b4a8f831.png)

7)	Next we dropped the 'MapDate','ValidStart','ValidEnd','StatisticFormatID' columns since the data weren???t needed for the future analysis
![drop columns](https://user-images.githubusercontent.com/112994018/217967605-a2c6f368-9f42-4f2a-b726-7b70ef3c906f.png)

8)	Averages for the year and month were then calculated to get monthly drought averages across the years (2000-2023)
![Averages](https://user-images.githubusercontent.com/112994018/217967624-d2f14b7b-c0f8-47f0-a286-452df6625d9c.png)

9)	Since the analysis is intended to predict severe drought conditions, columns D2-D4 were then summed together. These columns indicate severe to exceptional drought categories.  In addition, since logistical regression will be used in the machine learning component the "D_Combined" column needed to be converted to a seperate column with "0" and "1" values to be used for the y target.
![Final_merge_dataset](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/Final_merge_dataset.png)

### Load Process
We used python and pandas for the load process.  The four reformatted datasets (individual csv files) were merged on the "year" and "month" attributes into a single "CRB_merged.csv" file and written to the directory.  For the machine learning component the "CRB_merged.csv" file is read into the code using pandas.

## Machine Learning Component
We used python, pandas and sklearn for the machine learning component.  For the machine learning component we used logistical regression to classify whether or not the Colorado River Basin was in a severe-to-worse-drought or not based on percent land area in the combined drought categories.  The X features are Lake Mead water storage (Mead_Storage), Lake Powell water storage (Powell_Storage) and Rocky Mountain snow water equivalent (AvgSWE) while the y target is the combined drought variable (D_Outcome).  After training and testing the data set we used the logistic regression classifer.

## Results
### Training and testing scores:
- The training and testing score values are extremely close which is a positive sign that the train and test data split is appropriate.
![train_test_score](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/train_test_score.png)


### Predictions for y-value:
- When the first 20 rows of the predicted y-values are compared with the actual values 12 predictions are correct while 8 predictions are incorrect.  This outcome alone of a subset of the data is not a strong indicator that the model has the necessary features to produce greater accuracy.
![y_pred](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/y_pred.png)

### Accuracy score:
- 70% accuracy is a somewhat strong indicator that the model has the ability to predict the outcome of severe drought or worse, but it also indicates that there could be other features that could improve the model or there could be outliers in the dataset distorting that results.
![accuracy_score](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/accuracy_score.png)

### Confusion matrix:
- The model is highly accurate when predicting false (less than severe drought) when the outcome is actually false (33 vs. 6), but much less accurate when predicting true (severe drought or worse) when the outcome is actually true (11 vs. 13).
![confusion_matrix](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/confusion_matrix.png)

### Classification report:
-  The precision for the prediction of non-severe-drought and severe-or-worse-drought are somewhat in line with other.  However, the recall (sensitivity) for predicting severe-or-worse-drought is much lower than it is for predicting non-severe-drought.  The lower recall for severe-or-worse-drought is reflected in the lower F1 score.
![classification_report](https://raw.githubusercontent.com/Qu3enK/CRBAnalysis_FinalProject/master/Images_for_readme/classification_report.png)

## Summary
The Colorado River Basin is a complex region with high population growth in many of the metro areas as well as expansive agriculture areas that both depend on and use the river water.  There are most likely other features that when added to the dataset could enhance and improve the machine learning component to better predict severe-to-worse-drought for this region.  In particular, it would be ideal to find features that could improve the recall (sensitivity) value for predicting severe-to-worse-drought because even when predicted true with an actual false outcome it would trigger the region to conserve water usage as a reaction to the prediction.  Having a solid drought prediction model would better prepare the region for water conservation action during periods of drought or non-drought.

## Reference Section
- Header pictures from left to right: https://www.watereducationcolorado.org/fresh-water-news/as-2020-kicks-in-historic-colorado-river-drought-plan-gets-first-tests/ Credit: EcoFlight; https://www.azcentral.com/story/news/local/arizona-environment/2022/03/21/climate-change-dries-colorado-river-force-new-rules-users/9453476002/ John Locher/Associated Press; https://grist.org/drought/indigenous-fight-water-colorado-river-drought-cuts/ Justin Sullivan/Getty Images.
- Drought data for the Colorado River Basin as percent area; https://droughtmonitor.unl.edu/DmData/DataDownload/ComprehensiveStatistics.aspx
- Colorado River headwaters data: Rocky Mountain snow pack as snow water equivalent (SWE) in inches; https://www.nrcs.usda.gov/Internet/WCIS/AWS_PLOTS/basinCharts/POR/WTEQ/assocHUCco_8/colorado_headwaters.html
- Lake Mead water storage data in square feet; https://www.usbr.gov/uc/water/hydrodata/
- Lake Powell water storage data in squre feet; https://www.usbr.gov/uc/water/hydrodata/
- CRB Analysis Tableau Dashboard; https://public.tableau.com/app/profile/bruce.jones7168/viz/Final_16765941384530/Story1?publish=yes
