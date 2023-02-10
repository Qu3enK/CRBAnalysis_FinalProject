-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Lake_Mead" (
    "Year" varchar   NOT NULL,
    "Month" varchar   NOT NULL,
    "Month_Name" varchar   NOT NULL,
    "Storage_Avg" numeric   NOT NULL
);

CREATE TABLE "Lake_Powell" (
    "Year" varchar   NOT NULL,
    "Month" varchar   NOT NULL,
    "Month_Name" varchar   NOT NULL,
    "Storage_Avg" numeric   NOT NULL
);

CREATE TABLE "Headwaters" (
    "AvgSWE" numeric   NOT NULL,
    "Year" varchar   NOT NULL,
    "Month" varchar   NOT NULL
);

CREATE TABLE "Drought_Info" (
    "Year" varchar   NOT NULL,
    "Month" varchar   NOT NULL,
    "Month_Name" varchar   NOT NULL,
    "None" numeric   NOT NULL,
    "D0" numeric   NOT NULL,
    "D1" numeric   NOT NULL,
    "D2" numeric   NOT NULL,
    "D3" numeric   NOT NULL,
    "D4" numeric   NOT NULL,
    "D_Combined" numeric   NOT NULL
);

