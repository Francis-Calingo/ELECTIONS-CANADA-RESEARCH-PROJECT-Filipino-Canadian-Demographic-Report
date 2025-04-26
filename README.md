# Brief Demographic Snapshot of the Filipino Canadian Community (Using R)

# Table of Contents
* [Project Background](#project-background)
* [Data Structure and Initial Checks](#data-structure-and-initial-checks)
* [Executive Summary](#executive-summary)
* [Insights Deep Dive](#insights-deep-dive)
* [Recommendations](#recommendations)
* [Assumptions and Caveats](#assumptions-and-caveats)
* [Credits and Acknowledgements](#credits-and-acknowledgements)

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

If you'd like to fork or run this locally:

```bash
git clone https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report.git
cd ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report
```

[<b>Back to Table of Contents</b>](#table-of-contents)

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

The shapefile has **2,366 entries (7 fields x 338 records)**. 

It is important to note that the shapefile was extracted from a zip file that was downloaded from the Boundary files webpage of Statistics Canada. There are no associated CSVs, so in order to ascertain the fields, the shapefile needed to be exported as a CSV file via QGIS.
As you can see, most of the fields are irrelevant in isolation besides FEDENAME, which houses the English names of the ridings *in order* . The csv itself is not needed, the shapefile is. [But it is in this repo for reference](https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Shapefile_Features.csv) to better understand the structure of the shapefile as well as the workflow of merging it with the main CSV file to create choropleth maps in R [Figure 1.2].

<details><summary><b>FIELDS</b></summary> 

<li>FEDUID</li>
<li>DGUID</li>
<li>FEDNAME</li>
<li>FEDENAME</li>
<li>FEDFNAME</li>
<li>LANDAREA</li>
<li>PRUID</li>

</details>

The following two entity relationship diagrams helps visualize the data workflow:

<b>Figure 1.1: Creating the main Excel File</b>
<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure1.1.jpg" alt="Figure 1.1" width="600">
          <figcaption>Figure 1.1</figcaption>
    </figure>


<b>Figure 1.2: Amalgamating geospatial data from the shapefile with certain variables from the Excel files to create choropleth maps via R's sf library</b>
<figure>
<img align="center" src=https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure1.2.jpg alt="Figure 1.2" width="600">
          <figcaption>Figure 1.2</figcaption>
    </figure>
    
[<b>Back to Table of Contents</b>](#table-of-contents)

---


# Executive Summary

### Overview of Findings

Ilocano and Cebuano remain the dominant secondary Philippine-based language (i.e., non-Tagalog) used by the Filipino community based on the number of ridings where either or were identified as the most-used Philippine language in the 2021 Census. [Figure 2.1].
<figure>
<img align="center"
    src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure2.1.jpg"
    alt="Figure 2.1" width="600" />
              <figcaption>Figure 2.1</figcaption>
    </figure>

The correlation analysis showed that Filipino presence (i.e., % of census respondents in a riding that identified as Filipino) is most strongly correlated with the % of recent immigrants (i.e., immigrated between 2016-2021) (0.37) followed by French language use (-0.34) [Figure 2.2].
<figure>
  <img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure2.2.jpg" alt="Figure 2.2" width="600">
            <figcaption>Figure 2.2</figcaption>
    </figure>

Four choropleth maps were created for this analysis, but the map that stood out the most was the choropleth map showing the growth rate of the Filipino population by riding between 2016-2021, with Eastern Canada showing a comparatively high growth rate compared to the rest of Canada [Figure 2.3].
<figure>
  <img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure2.3.jpg" alt="Figure 2.3" width="600">
          <figcaption>Figure 2.3</figcaption>
    </figure>
    
[<b>Back to Table of Contents</b>](#table-of-contents)

---

# Insights Deep Dive
### Exploratory Data Analysis:

* **A few ridings experienced extremely high growth rates for their Filipino population.** While the majority riding-level Filipino populations grew by less than 100% between 2016-2021, a few experienced growth rates in the 400-800% range. [Figure 3.1]
<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure3.1.JPG" alt="Figure 3.1" width="300">
        <figcaption>Figure 3.1</figcaption>
    </figure>
  
* **The breakdown of secondary Philippine languages (i.e., non-Tagalog languages) is dominated by Ilocano and Cebuano.** 308 out of 338 ridings (91.12%) reported either Cebuano, Ilocano, a combination of the two, or a combination of the two with another language as the most-spoken non-Tagalog Philippine language. 23 ridings (6.8%) did not record any secondary Philippine language speaker while only 7 (2.07%) reported another language as the second most-spoken Philippine language. [Figure 3.2]
<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure3.2.jpg" alt="Figure 3.2" width="600">
        <figcaption>Figure 3.2</figcaption>
    </figure>
  
* **The Atlantic Region’s Filipino community is characterized by low numbers but rapid growth.** No electoral district exceed 3% in terms of the proportion of its population identifying as Filipino [Figure 3.3], but most ridings are in the triple digits in terms of the growth rate of their Filipino populations (2016-21) [Figure 3.4], while in some instances, people from the Philippines make up over 40% of immigrants that immigrated to Canada between 2016-2021. [Figure 3.5]
<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure3.3.jpg" alt="Figure 3.3" width="600">
        <figcaption>Figure 3.3</figcaption>
    </figure>

<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure3.4.jpg" alt="Figure 3.4" width="600">
        <figcaption>Figure 3.4</figcaption>
    </figure>

<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure3.5.jpg" alt="Figure 3.5" width="600">
        <figcaption>Figure 3.5</figcaption>
    </figure>
  
* **Quebec’s francophone nature remains a barrier for Filipinos, as, despite their increasing presence in some parts of the province, they only make up less than 1% of the population in the vast majority of the ridings.** Quebec’s unique nature with regards with migration and settlement patterns in comparison with the rest of the country is punctuated by Figure 3.6, which shows that while some ridings experienced Filipino growth rates in the triple digits, the vast majority experienced moderate growth (and some even experiencing negative growth rate), resulting in continually low numbers of Filipinos settling and currently living in Quebec.

<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure3.6.jpg" alt="Figure 3.6" width="600">
        <figcaption>Figure 3.6</figcaption>
    </figure>

  
* **Since Filipinos already have an established history in Ontario and BC (with the Greater Toronto Area and Metro Vancouver being the primary destinations for Filipino immigrants coming to Canada), and since international migration to both provinces is highly diverse, Filipino migration to both provinces is not as impactful as Filipino migration to other provinces.** The categorical bar plots corroborates that, with most ridings recording less than 60% growth rate in their Filipino population while migrants from the Philippines do not make up more than 10% of their recent immigrant population, although unlike Quebec, Filipinos continue to have a strong presence in Ontario and BC, with some ridings’ Filipino population percentage exceeding 5% (and 10% in some cases). [Figures 3.7, 3.8]
<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure3.7.jpg" alt="Figure 3.7" width="600">
        <figcaption>Figure 3.7</figcaption>
    </figure>

<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure3.8.jpg" alt="Figure 3.8" width="600">
        <figcaption>Figure 3.8</figcaption>
    </figure>

  
* **The Filipino population continues to grow steadily, both in Manitoba, where their long established history there has made Winnipeg the Canadian city with the highest per-capita Filipino population, and in the rest of the Prairies.** As a consequence of the aforementioned history, one Manitoba riding recorded over 30% of its population identifying as Filipino. While settlement patterns are quite varied, Filipinos in the prairies continue to increase steadily in numbers, remaining an important part in Alberta’s continuing rapid population growth, increasing their presence in Saskatchewan where their presence is still relatively new, and continuing to add to Manitoba’s long standing Filipino population history.[Figures 3.9, 3.10. 3.11]
<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure3.9.jpg" alt="Figure 3.9" width="600">
        <figcaption>Figure 3.9</figcaption>
    </figure>

<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure3.10.jpg" alt="Figure 3.10" width="600">
        <figcaption>Figure 3.10</figcaption>
    </figure>

<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure3.11.jpg" alt="Figure 3.11" width="600">
        <figcaption>Figure 3.11</figcaption>
    </figure>

### Correlation Analysis:

* **Most variables with respect to “% of population who is Filipino” as well as “% of recent immigrants from the PH (2016-21)” are weakly correlated.** Only three correlation scores were either less than -0.35 or greater than 0.35. [Figure 4.1]
  
* **“% of recent immigrants from the PH (2016-21)” and “Province/Territory”(label encoded) exhibited the strongest correlation.** There was a correlation score of -0.41, the only correlation score that was greater than 0.4 in absolute terms. [Figure 4.1]
  
* **“% of recent immigrants from the PH (2016-21)” and “% of population who is Filipino” exhibited the second strongest correlation.** There was a correlation score of 0.37. [Figure 4.1]
  
* **“% of recent immigrants from the PH (2016-21)” and “% of population with knowledge of French”.** There was a correlation score of -0.37. [Figure 4.1]

<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure4.1.jpg" alt="Figure 4.1" width="600">
        <figcaption>Figure 4.1</figcaption>
    </figure>


### Geospatial Analysis:

* **Filipinos are more concentrated in Western and Northern Canada.** British Columbia, Prairie provinces, Yukon, and Northwest Territories are home to many ridings where at least 2.5% of the population identify as Filipino, while the vast majority of ridings east of Manitoba have less than 1% of their populations identifying as such (with the notable exception of Greater Toronto Area and a few urban ridings). [Figure 5.1]
<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure5.1.jpg" alt="Figure 5.1" width="600">
        <figcaption>Figure 5.1</figcaption>
    </figure>

* **Recent immigration patterns exhibit differences between more rural ridings and more urban ridings.** Besides Southern Ontario and Quebec, where the patterns are quite scattered, most urban ridings in the country recorded that only a small portion of their recent immigrant population (i.e., less than 10% of immigrant who migrated to Canada between 2016-2021) come from the Philippines, while the reverse (i.e., a plurality or majority of the recent immigrant population) is generally true across more rural ridings. [Figure 5.2]
<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure5.2.jpg" alt="Figure 5.2" width="600">
        <figcaption>Figure 5.2</figcaption>
    </figure>
  
* **There were no discernible broad patterns in terms of secondary Philippine language use.** Some patterns exist at a provincial and sub-provincial level (e.g., Ilocano being the second most-used Philippine language in Northern Alberta and broad swaths of Southern Ontario, Cebuano usage being notable in rural Saskatchewan, and many Quebec ridings having no recorded usage of secondary Philippine languages).  [Figure 5.3]
<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure5.3.jpg" alt="Figure 5.3" width="600">
        <figcaption>Figure 5.3</figcaption>
    </figure>

* **Filipino growth is concentrated in Eastern Canada.** Most ridings that recorded a growth rate of over 200% for their Filipino population (2016-2021) are based in Atlantic Canada or Quebec, with rural ridings (particularly in Western Canada) exhibiting moderate growth rates (i.e., at least 50%).  [Figure 5.4]
<figure>
<img align="center" src="https://github.com/Francis-Calingo/ELECTIONS-CANADA-RESEARCH-PROJECT-Filipino-Canadian-Demographic-Report/blob/main/Figures/Figure5.4.jpg" alt="Figure 5.4" width="600">
        <figcaption>Figure 5.4</figcaption>
    </figure>

[<b>Back to Table of Contents</b>](#table-of-contents)

---

# Recommendations:

Based on the insights and findings above, we would recommend the agency to consider the following: 

* There is variability across the country in terms of the growth rate of the Filipino population, as well as their presence. For regions where the presence of Filipinos is a relatively new but rapidly growing phenomenon, particularly in the Maritimes, the agency should consider working with Immigration, Refugees and Citizenship Canada in informing newly-landed Filipino migrants about civic engagement so that they are provided with the proper tools and resources when they become eligible to vote (i.e., after they become Canadian citizens). **For regions with more established Filipino populations such as Winnipeg and in major urban centres of British Columbia and Ontario, the agency should look to collaborate with established Filipino organizations in mitigating barriers to voting for the local Filipino populations.
From the categorical bar plot measuring secondary Philippine language use by ridings, Ilocano and Cebuano were dominant. Elections Canada should consider producing Ilocano and Cebuano language resources (e.g., have translations of voter information resources available).**

* From the categorical bar plot measuring secondary Philippine language use by ridings, Ilocano and Cebuano were dominant. **Elections Canada should consider producing Ilocano and Cebuano language resources (e.g., have translations of voter information resources available).**
  
* From the correlation analysis, we saw that Filipino presence is most strongly correlated with geographic location (i.e., province and territory, which, in turn, is moderately correlated with French language use), % of recent immigrants coming from the Philippines, and French language use. **Therefore, the agency should consider: (1) increasing French language accessibility for Filipino voters, whose settlement pattern suggests that French language barriers remain a major obstacle (2) increasing capacity for making Tagalog (and other Philippine-based languages) available, especially in locations that have seen a rapid growth of immigrants coming from the Philippines.**
  
* From the spatial analysis surfaced from the four choropleth maps, the main takeaways were that the Filipino community is rapidly growing in Eastern Canadian and rural ridings-as evidenced by the many ridings where they make up the plurality or majority of recent immigrants, although the Filipino population remains concentrated in Western Canadian ridings (rural and urban) and the Greater Toronto Area. **The agency should monitor the experiences of Filipino voters in those regions and prepare to respond to any accessibility concerns pertinent to that community. (e.g., equip staff who are deployed to the Maritimes region of Canada with multilingual training to better prepare them for an increase of eligible voters from across different language communities, including from the Filipino community, in the coming years.)**

[<b>Back to Table of Contents</b>](#table-of-contents)

---

# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Ridings boundaries were based on the 2013 representation order. As there was no shapefile available for the current riding boundaries (based on the 2023 representation order), the shapefile for the 2013 representation order was used instead. An updated version of this analysis will need to be performed once that shapefile is available (Census data already accounts for the updated boundaries).
  
* Data was mostly scraped from 2021 Census data (the next census year is 2026). The astronomical increases in migration into Canada since then (permanent and non-permanent) may render the analysis slightly outdated.
  
* The data utilized analyzed the Filipino Canadian population as a whole. It does not specify the breakdown of that population in terms of citizenship (i.e., Canadian citizens vs. permanent residents vs. non-permanent residents). That is an important caveat to note because only Canadian citizens are eligible to vote in Canadian federal elections. Therefore, a rapid increase of the Filipino population in certain ridings may not automatically translate to an rapid increase in eligible Filipino Canadian voters, as the growth could be largely fuelled by non-permanent migration (made more likely by the rapid growth of the non-permanent resident population as a whole in Canada over the past few years).

[<b>Back to Table of Contents</b>](#table-of-contents)

---

# Credits and Acknowledgements:

“Choropleth Maps in Ggplot2.” R CHARTS | A Collection of Charts and Graphs Made with the R Programming Language, 4 May 2021, https://r-charts.com/spatial/choropleth-map-ggplot2/

"Exploratory Data Analysis on Covid-19 Dataset | Data Profiling & Visualization". Uploaded by Thu Vu, 2022-03-09. YouTube, https://www.youtube.com/watch?v=IjLRk2Q_A0U

[<b>Back to Table of Contents</b>](#table-of-contents)

