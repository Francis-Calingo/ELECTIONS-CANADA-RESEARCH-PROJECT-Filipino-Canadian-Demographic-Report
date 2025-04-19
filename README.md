# Brief Demographic Snapshot of the Filipino Canadian Community (Using R)

# Table of Contents
* [Project Background](#project-background)
* [Data Structure and Initial Checks](#data-structure-and-initial-checks)
* [Executive Summary](#executive-summary)
* [Insights Deep Dive](#insights-deep-dive)
* [Recommendations](#recommendations)
* [Assumptions and Caveats](#assumptions-and-caveats)

---

# Project Background
Elections Canada, Canada’s non-partisan government agency responsible for the administration of federal-level elections and matters related to Canadian democratic institutions, is home to the Environmental Monitoring Centre (EMC), which monitors Canadian public sentiment of electoral affairs and democracy from the traditional and social media environment, and reports their findings weekly to the Chief Electoral Officer. Established right before the COVID-19 pandemic, it has since grown its capacity to not only monitor more “niche” platforms, but also monitor non-official language media (i.e., non-English and non-French posts and outlets). 

However, monitoring Tagalog language media proved to be a challenge until I was hired as the very first Filipino personnel in the Centre. My first-hand knowledge of the language and culture allowed me to integrate elections and democracy-related words from the Tagalog language, as well as Tagalog-language media, in the EMC’s multilingual monitoring arsenal. 

I decided to take my research a step further, and completed a report on the  demographic data on Filipino Canadians, as this knowledge would enhance the agency’s ability to optimize their community outreach on the fourth-largest visible minority group in Canada.

Insights and recommendations are provided on the following key areas:

- **Exploratory Data Analysis:** Surface-level analysis of the Filipino community in Canada.
- **Correlation Analysis:** More comprehensive analysis determining correlation between variables, resulting in a better understanding of localized characteristics of different Filipino communities.
- **Geospatial Analysis:** Better understanding of the characteristics of Filipino communities on a riding-by-riding level, helping the agency with their operations when they open their electoral district offices during the election or by-election period.

The following Excel file is an amalgamation of various datasets taken from Statistics Canada, as well as features that were engineered from existing variables: [Link to download](https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/raw/refs/heads/main/Census_Division_Stats_-_Sheet1.csv).
* <a href="https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E">Census Profile, 2021 Census of Population</a> 
* <a href="https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/prof/index.cfm?Lang=E">Census Profile, 2016 Census of Population</a> 
* <a href="https://www12.statcan.gc.ca/census-recensement/2021/geo/sip-pis/boundary-limites/index2021-eng.cfm?year=21">2021 Census – Boundary files</a> 

The following is the R Script used for the quantitative analysis portion of the reporting: [Link to see script](https://raw.githubusercontent.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/main/PROFILE%20OF%20THE%20FILIPINO%20CANADIAN%20COMMUNITY%20(BY%20ELECTORAL%20DISTRICTS).R)
* <b>IDEs Used:</b> RStudio
* <b>R Version:</b> rstudio-2024.12.0
* <b>Libraries:</b> data.table, funModeling, Hmisc, ggplot2, sf, dplyr, corrplot, CatEncoders

The following is the report sent to senior analysts of the EMC: [Link to download](https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/raw/main/PROFILE%20OF%20THE%20FILIPINO%20CANADIAN%20COMMUNITY%20(BY%20ELECTORAL%20DISTRICTS).pdf).

---

# Data Structure and Initial Checks

The Excel file has a total of **12,506 entries (37 fields x 338 records)**

<details><summary><b>FIELDS</b></summary> 

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

<b>CONSTRUCTED VARIABLES:</b>
<li>Second Most Spoken Philippine Language</li>
<li>Healthcare Workers (per 100,000)</li>
<li>% of Recent Immigrants from PH (2016-2021)</li>
<li>Number of People with Bachelor's Degree or Higher (per 100,000)</li>
<li>Filipino Growth Rate (2016-2021)</li>
<li>% Second Most Spoken Philippine Language</li>

</details>

The shapefile has ** entries ( fields x 338 records)**

<details><summary><b>FIELDS</b></summary> 

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

</details>

The following two entity relationship diagrams helps visualize the data workflow:

<b>Figure 1.1: Creating the main Excel File</b>

<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure1.1.jpg" alt="Figure 1.1" width="600">


<b>Figure 1.2: Amalgamating geospatial data from the shapefile with certain variables from the Excel files to create choropleth maps via R's sf library</b>

---


# Executive Summary

### Overview of Findings

Ilocano and Cebuano remain the dominant secondary Philippine-based language (i.e., non-Tagalog) used by the Filipino community based on the number of ridings where either or were identified as the most-used Philippine language in the 2021 Census. [Figure 2.1].

<img align="center"
    src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure2.1.jpg"
    alt="Figure 2.1" width="600" />

The correlation analysis showed that Filipino presence (i.e., % of census respondents in a riding that identified as Filipino) is most strongly correlated with the % of recent immigrants (i.e., immigrated between 2016-2021) (0.37) followed by French language use (-0.34) [Figure 2.2].

  <img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure2.2.jpg" alt="Figure 2.2" width="600">

Four choropleth maps were created for this analysis, but the map that stood out the most was the choropleth map showing the growth rate of the Filipino population by riding between 2016-2021, with Eastern Canada showing a comparatively high growth rate compared to the rest of Canada [Figure 2.3].

  <img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure2.3.jpg" alt="Figure 2.3" width="600">

---

# Insights Deep Dive
### Exploratory Data Analysis:

* **A few ridings experienced extremely high growth rates for their Filipino population.** While the majority riding-level Filipino populations grew by less than 100% between 2016-2021, a few experienced growth rates in the 400-800% range. [Figure 3.1]
  
* **The breakdown of secondary Philippine languages (i.e., non-Tagalog languages) is dominated by Ilocano and Cebuano.** 308 out of 338 ridings (91.12%) reported either Cebuano, Ilocano, a combination of the two, or a combination of the two with another language as the most-spoken non-Tagalog Philippine language. 23 ridings (6.8%) did not record any secondary Philippine language speaker while only 7 (2.07%) reported another language as the second most-spoken Philippine language. [Figure 3.2]
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 1]


### Correlation Analysis:

* **Most variables with respect to “% of population who is Filipino” as well as “% of recent immigrants from the PH (2016-21)” are weakly correlated.** Only three correlation scores were either less than -0.35 or greater than 0.35. [Figure 4.1]
  
* **“% of recent immigrants from the PH (2016-21)” and “Province/Territory”(label encoded) exhibited the strongest correlation.** There was a correlation score of -0.41, the only correlation score that was greater than 0.4 in absolute terms. [Figure 4.1]
  
* **“% of recent immigrants from the PH (2016-21)” and “% of population who is Filipino” exhibited the second strongest correlation.** There was a correlation score of 0.37. [Figure 4.1]
  
* **“% of recent immigrants from the PH (2016-21)” and “% of population with knowledge of French”.** There was a correlation score of -0.37. [Figure 4.1]

[Visualization specific to category 2]


### Geospatial Analysis:

* **Filipinos are more concentrated in Western and Northern Canada.** British Columbia, Prairie provinces, Yukon, and Northwest Territories are home to many ridings where at least 2.5% of the population identify as Filipino, while the vast majority of ridings east of Manitoba have less than 1% of their populations identifying as such (with the notable exception of Greater Toronto Area and a few urban ridings). [Figure 5.1]
  
* **Recent immigration patterns exhibit differences between more rural ridings and more urban ridings.** Besides Southern Ontario and Quebec, where the patterns are quite scattered, most urban ridings in the country recorded that only a small portion of their recent immigrant population (i.e., less than 10% of immigrant who migrated to Canada between 2016-2021) come from the Philippines, while the reverse (i.e., a plurality or majority of the recent immigrant population) is generally true across more rural ridings. [Figure 5.2]
  
* **There were no discernible broad patterns in terms of secondary Philippine language use.** Some patterns exist at a provincial and sub-provincial level (e.g., Ilocano being the second most-used Philippine language in Northern Alberta and broad swaths of Southern Ontario, Cebuano usage being notable in rural Saskatchewan, and many Quebec ridings having no recorded usage of secondary Philippine languages).  [Figure 5.3]

  
* **Filipino growth is concentrated in Eastern Canada.** Most ridings that recorded a growth rate of over 200% for their Filipino population (2016-2021) are based in Atlantic Canada or Quebec, with rural ridings (particularly in Western Canada) exhibiting moderate growth rates (i.e., at least 50%).  [Figure 5.4]

---

# Recommendations:

Based on the insights and findings above, we would recommend the agency to consider the following: 

* There is variability across the country in terms of the growth rate of the Filipino population, as well as their presence. For regions where the presence of Filipinos is a relatively new but rapidly growing phenomenon, particularly in the Maritimes, the agency should consider working with Immigration, Refugees and Citizenship Canada in informing newly-landed Filipino migrants about civic engagement so that they are provided with the proper tools and resources when they become eligible to vote (i.e., after they become Canadian citizens). **For regions with more established Filipino populations such as Winnipeg and in major urban centres of British Columbia and Ontario, the agency should look to collaborate with established Filipino organizations in mitigating barriers to voting for the local Filipino populations.
From the categorical bar plot measuring secondary Philippine language use by ridings, Ilocano and Cebuano were dominant. Elections Canada should consider producing Ilocano and Cebuano language resources (e.g., have translations of voter information resources available).**

* From the categorical bar plot measuring secondary Philippine language use by ridings, Ilocano and Cebuano were dominant. **Elections Canada should consider producing Ilocano and Cebuano language resources (e.g., have translations of voter information resources available).**
  
* From the correlation analysis, we saw that Filipino presence is most strongly correlated with geographic location (i.e., province and territory, which, in turn, is moderately correlated with French language use), % of recent immigrants coming from the Philippines, and French language use. **Therefore, the agency should consider: (1) increasing French language accessibility for Filipino voters, whose settlement pattern suggests that French language barriers remain a major obstacle (2) increasing capacity for making Tagalog (and other Philippine-based languages) available, especially in locations that have seen a rapid growth of immigrants coming from the Philippines.**
  
* From the spatial analysis surfaced from the four choropleth maps, the main takeaways were that the Filipino community is rapidly growing in Eastern Canadian and rural ridings-as evidenced by the many ridings where they make up the plurality or majority of recent immigrants, although the Filipino population remains concentrated in Western Canadian ridings (rural and urban) and the Greater Toronto Area. **The agency should monitor the experiences of Filipino voters in those regions and prepare to respond to any accessibility concerns pertinent to that community. (e.g., equip staff who are deployed to the Maritimes region of Canada with multilingual training to better prepare them for an increase of eligible voters from across different language communities, including from the Filipino community, in the coming years.)**

---

# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Ridings boundaries were based on the 2013 representation order. As there was no shapefile available for the current riding boundaries (based on the 2023 representation order), the shapefile for the 2013 representation order was used instead. An updated version of this analysis will need to be performed once that shapefile is available (Census data already accounts for the updated boundaries).
  
* Data was mostly scraped from 2021 Census data (the next census year is 2026). The astronomical increases in migration into Canada since then (permanent and non-permanent) may render the analysis slightly outdated.
  
* The data utilized analyzed the Filipino Canadian population as a whole. It does not specify the breakdown of that population in terms of citizenship (i.e., Canadian citizens vs. permanent residents vs. non-permanent residents). That is an important caveat to note because only Canadian citizens are eligible to vote in Canadian federal elections. Therefore, a rapid increase of the Filipino population in certain ridings may not automatically translate to an rapid increase in eligible Filipino Canadian voters, as the growth could be largely fuelled by non-permanent migration (made more likely by the rapid growth of the non-permanent resident population as a whole in Canada over the past few years).
  


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


