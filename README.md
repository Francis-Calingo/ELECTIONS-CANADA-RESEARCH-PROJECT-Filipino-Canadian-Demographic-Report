# Brief Demographic Snapshot of the Filipino Canadian Community (Using R)

# Table of Contents
* [Project Background](#project-background)
* [Data Structure and Initial Checks](#data-structure-and-initial-checks)
* [Executive Summary](#executive-summary)
* [Insights Deep Dive](#insights-deep-dive)
* [Recommendations](#recommendations)
* [Assumptions and Caveats](#assumptions-and-caveats)


# Project Background
Elections Canada, Canada’s non-partisan government agency responsible for the administration of federal-level elections and matters related to Canadian democratic institutions, is home to the Environmental Monitoring Centre (EMC), which monitors Canadian public sentiment of electoral affairs and democracy from the traditional and social media environment, and reports their findings weekly to the Chief Electoral Officer. Established right before the COVID-19 pandemic, it has since grown its capacity to not only monitor more “niche” platforms, but also monitor non-official language media (i.e., non-English and non-French posts and outlets). 

However, monitoring Tagalog language media proved to be a challenge until I was hired as the very first Filipino personnel in the Centre. My first-hand knowledge of the language and culture allowed me to integrate elections and democracy-related words from the Tagalog language, as well as Tagalog-language media, in the EMC’s multilingual monitoring arsenal. 

I decided to take my research a step further, and completed a report on the  demographic data on Filipino Canadians, as this knowledge would enhance the agency’s ability to optimize their community outreach on the fourth-largest visible minority group in Canada.

Insights and recommendations are provided on the following key areas:

- **Exploratory Data Analysis:** Surface-level analysis of the Filipino community in Canada.
- **Correlation Analysis:** More comprehensive analysis determining correlation between variables, resulting in a better understanding of localized characteristics of different Filipino communities.
- **Geospatial Analysis:** Better understanding of the characteristics of Filipino communities on a riding-by-riding level, helping the agency with their operations when they open their electoral district offices during the election or by-election period.

The following Excel file is an amalgamation of various datasets taken from Statistics Canada, as well as features that were engineered from existing variables: [Link to download](https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/raw/refs/heads/main/Census_Division_Stats_-_Sheet1.csv).
* <b>Census Profile, 2021 Census of Population:</b> https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E
* <b>Census Profile, 2016 Census of Population:</b> https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/prof/index.cfm?Lang=E
* <b>2021 Census – Boundary files:</b> https://www12.statcan.gc.ca/census-recensement/2021/geo/sip-pis/boundary-limites/index2021-eng.cfm?year=21

The following is the R Script used for the quantitative analysis portion of the reporting: [Link to download](https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/raw/refs/heads/main/PROFILE%20OF%20THE%20FILIPINO%20CANADIAN%20COMMUNITY%20(BY%20ELECTORAL%20DISTRICTS).R).
* <b>IDEs Used:</b> RStudio
* <b>R Version:</b> rstudio-2024.12.0
* <b>Libraries:</b> data.table, funModeling, Hmisc, ggplot2, sf, dplyr, corrplot, CatEncoders

The following is the report sent to senior analysts of the EMC: [Link to download](https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/raw/refs/heads/main/PROFILE%20OF%20THE%20FILIPINO%20CANADIAN%20COMMUNITY%20(BY%20ELECTORAL%20DISTRICTS).pdf).


# Data Structure and Initial Checks

The companies main database structure as seen below consists of four tables: table1, table2, table3, table4, with a total row count of X records. A description of each table is as follows:
- **Table 2:**
- **Table 3:**
- **Table 4:**
- **Table 5:**

[Entity Relationship Diagram here]



# Executive Summary

### Overview of Findings

Explain the overarching findings, trends, and themes in 2-3 sentences here. This section should address the question: "If a stakeholder were to take away 3 main insights from your project, what are the most important things they should know?" You can put yourself in the shoes of a specific stakeholder - for example, a marketing manager or finance director - to think creatively about this section.

[Visualization, including a graph of overall trends or snapshot of a dashboard]



# Insights Deep Dive
### Category 1:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 1]


### Category 2:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 2]


### Category 3:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 3]


### Category 4:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 4]



# Recommendations:

Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following: 

* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  


# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Ridings boundaries were based on the 2013 representation order. As there was no shapefile available for the current riding boundaries (based on the 2023 representation order), the shapefile for the 2013 representation order was used instead. An updated version of this analysis will need to be performed once that shapefile is available (Census data already accounts for the updated boundaries).
  
* Data was mostly scraped from 2021 Census data (the next census year is 2026). The astronomical increases in migration into Canada since then (permanent and non-permanent) may render the analysis slightly outdated.
  


=======================================================================


## Table of Contents
* [Introduction](#introduction)
* [Code and Resources Used](#code-and-resources-used)
* [Web Scraping](#web-scraping)
* [Feature Engineering](#feature-engineering)
* [Exploratory Data Analysis](#exploratory-data-analysis)
  * [Numerical Variables](#-numerical-variables-)
  * [Categorical Variables](#categorical-variables-)
  * [Histogram Plots](#histogram-plots-)
* [Correlation Analysis](#correlation-analysis)
* [Geospatial Analysis](#geospatial-analysis)

<details><summary><h2>Introduction</h2></summary> 


</details>

<details><summary><h2>Code and Resources Used</h2></summary> 

 </details>

<details><summary><h2>Web Scraping</h2></summary> 
 


 </details>

<details><summary><h2>Feature Engineering</h2></summary> 

<b>VARIABLES SCRAPPED FROM STATISTICS CANADA</b>
<li>Electoral District (2013 Representation Order)</li>
<li>Province/Territory</li>
<li>Population (2021 Census)</li>
<li>% Filipinos</li>
<li>Number of Filipinos (2021 Census)</li>
<li>Number of Filipinos (2016 Census)</li>
<li>% of Population with Knowledge of French</li>
<li>Healthcare Workers (NOC Classification)</li>
<li>Number of Recent Immigrants (2016-2021)</li>
<li>Recent Immigrants from PH (2016-2021)</li>
<li>Number of People with Bachelors Degree or Higher</li>
<li>Median Age</li>
<li>Bikol Mother Tongue</li>
<li>Bisaya, n.o.s. Mother Tongue</li>
<li>Cebuano Mother Tongue</li>
<li>Hiligaynon Mother Tongue</li>
<li>Ilocano Mother Tongue</li>
<li>Kankanaey Mother Tongue</li>
<li>Kinaray-a Mother Tongue</li>
<li>Pampangan Mother Tongue</li>
<li>Pangasinan Mother Tongue</li>
<li>Tagalog Mother Tongue</li>
<li>Waray-Waray Mother Tongue</li>
<li>Second Most Spoken Philippine Language</li>

<b>CONSTRUCTED VARIABLES:</b>
<li>Healthcare Workers (per 100,000)</li>
<li>% of Recent Immigrants from PH (2016-2021)</li>
<li>Number of People with Bachelor's Degree or Higher (per 100,000)</li>
<li>Filipino Growth Rate (2016-2021)</li>
<li>% Second Most Spoken Philippine Language</li>

</details>

<details><summary><h2>Exploratory Data Analysis</h2></summary> 

#### <i> Numerical Variables </i>

<img width="911" alt="image" src="https://github.com/user-attachments/assets/a846c99a-43a9-4ad8-87fa-7e6e3622d249" />

#### <i>Categorical Variables </i>

<img width="1013" alt="image" src="https://github.com/user-attachments/assets/1821d092-6d6b-4d31-a1b3-93efa74b6030" />

<img width="999" alt="image" src="https://github.com/user-attachments/assets/23c4b4a9-99f7-473f-b84a-2371b10d0c72" />

#### <i>Histogram Plots </i>
<i> Canada </i>

<img width="993" alt="image" src="https://github.com/user-attachments/assets/7b0cd999-3dd9-425e-8b93-39057ab4f95d" />

<i> Atlantic Canada </i>

<img width="950" alt="image" src="https://github.com/user-attachments/assets/9b62c0ab-9205-4912-bc15-1d7002b453da" />

<img width="973" alt="image" src="https://github.com/user-attachments/assets/5d22eb83-9e9e-4b0f-b07e-00b980765f67" />

<img width="944" alt="image" src="https://github.com/user-attachments/assets/6d25beec-38ec-45ed-9a5e-bba412117b68" />


<i> Quebec </i>

<img width="1029" alt="image" src="https://github.com/user-attachments/assets/a037a4fd-ea41-493f-9673-dfbd1beedf37" />


<i> Ontario </i>

<img width="545" alt="image" src="https://github.com/user-attachments/assets/a7cbe29c-b448-41e6-b333-47c28356a627" />


<i> Prairies </i>

<img width="712" alt="image" src="https://github.com/user-attachments/assets/5fd4f046-9ef7-4f92-9e74-6b8e29b344f5" />

<img width="734" alt="image" src="https://github.com/user-attachments/assets/e8a77b28-ff37-4f41-89bd-aa353dd7ad74" />

<img width="749" alt="image" src="https://github.com/user-attachments/assets/88b9fe36-aaeb-4005-a32f-08fb68c6d364" />

<i> British Columbia </i>

<img width="763" alt="image" src="https://github.com/user-attachments/assets/0ac266d8-b029-47bf-812c-4fcc18fd4904" />

</details>

<details><summary><h2>Correlation Analysis</h2></summary> 

<ul>
    <li>Variables used for analysis:</li>
    <ul>
      <li>Province/Territory</li>
      <li>% Filipinos</li>
      <li>% Population with Knowledge of French</li>
      <li>Median Age</li>
      <li>Healthcare workers (per 100,000)</li>
      <li>% of Recent Immigrants from the PH (2016-2021)</li>
      <li>Number of People with Bachelors Degree or Higher (per 100,000)</li>
      </ul>
    <li>Label encoding (i.e., assigning integers for each province and territory) was used for the variable Province/Territory</li>
  </ul>

  <img width="636" alt="image" src="https://github.com/user-attachments/assets/bd648d12-bcbc-437e-9602-c94458daf0fe" />
</details>

<details><summary><h2>Geospatial Analysis</h2></summary> 

<img width="604" alt="image" src="https://github.com/user-attachments/assets/a2b151f7-d4c7-4f7a-bb01-cac2b213f890" />

<img width="607" alt="image" src="https://github.com/user-attachments/assets/b639a44d-e2bc-4309-b83d-fe10a91a1f1d" />

<img width="554" alt="image" src="https://github.com/user-attachments/assets/39f99f77-70ec-40d9-9042-af35a8a365f2" />

<img width="590" alt="image" src="https://github.com/user-attachments/assets/ed72cc26-efa0-4d8e-8474-7fcdb4ad1d87" />

</details>


