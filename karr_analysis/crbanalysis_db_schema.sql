-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Lake_Mead" (
    "Year" varchar   NOT NULL,
    "Month" varchar   NOT NULL,
    "Storage_Avg" numeric   NOT NULL
);

CREATE TABLE "Lake_Powell" (
    "Year" varchar   NOT NULL,
    "Month" varchar   NOT NULL,
    "Storage_Avg" numeric   NOT NULL
);

CREATE TABLE "Headwaters" (
    "AvgSWE" int   NOT NULL,
    "Year" varchar   NOT NULL,
    "Month" varchar   NOT NULL
);

CREATE TABLE "Drought_Info" (
    "Year" varchar   NOT NULL,
    "Month" varchar   NOT NULL,
    "Month_Name" varchar   NOT NULL,
    "None" int   NOT NULL,
    "D0" int   NOT NULL,
    "D1" int   NOT NULL,
    "D2" int   NOT NULL,
    "D3" int   NOT NULL,
    "D4" int   NOT NULL,
    "D_Combined" int   NOT NULL
);

