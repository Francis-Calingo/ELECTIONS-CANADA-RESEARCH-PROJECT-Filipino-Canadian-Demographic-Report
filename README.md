# PROJECT OVERVIEW: Brief Demographic Snapshot of the Filipino Canadian Community (Using R)

  <ul>
    <li>Spearheaded and led a special research initiative (which included this project) that helped with Elections Canada's outreach and policy strategies pertaining to the Filipino Canadian community.</li>
    <li>Performed exploratory data analysis, correlation analysis, and geospatial mapping of data on the Filipino/a/x community in Canada.</li>
    <li>Scraped data from Statistics Canada.</li>
    <li>Performed feature engineering on some variables to create new variables.</li>
    <li>Downloaded shapefile of Canada's previous federal electoral district boundaries to create choropleth maps.</li>

  </ul>
  
## Code and Resources Used
  <ul>
    <li><b>IDEs Used:</b> RStudio</li>
    <li><b>R Version:</b> rstudio-2024.12.0</li>
    <li><b>Libraries:</b> data.table, funModeling, Hmisc, ggplot2, sf, dplyr, corrplot, CatEncoders</li>
  </ul>
  
## Web Scraping
 
 <ul>
 <li><b>Census Profile, 2021 Census of Population:</b> https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E </li>
 <li><b>Census Profile, 2016 Census of Population:</b> https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/prof/index.cfm?Lang=E </li>
 <li><b>2021 Census – Boundary files:</b> https://www12.statcan.gc.ca/census-recensement/2021/geo/sip-pis/boundary-limites/index2021-eng.cfm?year=21 </li>
 </ul>

## Feature Engineering

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


## Exploratory Data Analysis

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


## Correlation Analysis
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

  
## Geospatial Analysis

<img width="604" alt="image" src="https://github.com/user-attachments/assets/a2b151f7-d4c7-4f7a-bb01-cac2b213f890" />

<img width="607" alt="image" src="https://github.com/user-attachments/assets/b639a44d-e2bc-4309-b83d-fe10a91a1f1d" />

<img width="554" alt="image" src="https://github.com/user-attachments/assets/39f99f77-70ec-40d9-9042-af35a8a365f2" />

<img width="590" alt="image" src="https://github.com/user-attachments/assets/ed72cc26-efa0-4d8e-8474-7fcdb4ad1d87" />




