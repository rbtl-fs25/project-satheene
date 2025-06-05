# README

## General information

1.  Title of Dataset:  
Waste Separation Habits and Incentives Among ETH Students (Responses)

2.  Author Information

**Author A**

- First name: Satheene Alison Morgane Ethel Marie
- Surname: Michel
- ORCID iD: 0009-0004-3387-4385
- Email: smiche@ethz.ch

etc.

3.  Date of data collection (single date, range, approximate date): 
12.05.20205 - 20.05.2025

4.  Geographic location of data collection: 
Zurich, Switzeland

5.  Information about funding sources that supported the collection of
    the data: 
No funds were provided for the data collection

## Sharing / access information

1.  Licenses/restrictions placed on the data:  

This work is licensed under the Creative Commons Attribution 4.0 International license (CC-BY-4.0).

2.  Links to publications that cite or use the data: 
No publications use or cite this data

3.  Links to other publicly accessible locations of the data: 
https://docs.google.com/spreadsheets/d/1rMYHboIyDNtRs2hTklsqiASm0Dzan4JDel6BfTkZdRw/edit?resourcekey=&gid=176152037#gid=176152037 

4.  Links/relationships to ancillary data sets: 
None

5.  Was data derived from another source? 
No data was derived from another source

## Methodological information

1.  Description of methods used for collection/generation of data:
The data was collected through an online survey created using Google Forms. The survey targeted ETH Zurich students and was distributed via social media platforms and personal outreach. Participants were asked to respond to questions related to their waste separation habits, behavioral changes during exam season, and the impact of economic incentives on their recycling behavior.

2.  Methods for processing the data:
The raw data was exported from Google Forms and cleaned using the R programming language (tidyverse package). Invalid responses (e.g., unrealistic household sizes) were removed. Additional processing included normalizing text responses, converting categorical answers into factor levels, and generating new columns for analysis (e.g., behavioral changes, timing of incentive effectiveness).

3.  Instrument- or software-specific information needed to interpret the
    data: 
- R (version 3.4)
- Tidyverse package (v2.0.0)
- Additional R packages: dplyr, ggplot2, stringr, forcats

4.  Standards and calibration information, if appropriate: 
Not applicable

5.  Environmental/experimental conditions: 
Survey conducted among students at ETH Zurich during the spring semester 2025; no specific environmental conditions were imposed

6.  Describe any quality-assurance procedures performed on the data: 
Data cleaning included filtering out inconsistent entries, missing values, and responses outside the valid range (e.g., household size > 15). Manual inspection was conducted to ensure logical consistency (e.g., non-empty responses for key variables).

7.  People involved with sample collection, processing, analysis and/or
    submission:

Satheene Michel (survey design, data collection, data cleaning, analysis and documentation)

