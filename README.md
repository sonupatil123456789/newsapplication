# News application!

## Problem statement

  

Develop a mobile application using Flutter that presents users with concise news
summaries, allowing them to stay updated without sifting through long articles.

  

# Getting started

  

To run the app go in to root of the directory that is **Nuse** and run the command **flutter run!** to view output of app

  
  

The whole application structure was developed by **MVC** pattern .
which consist of model view controllers using **provider** as a state management solution


### api service used 

https://newsapi.org/docs/get-started



### apk link

(https://drive.google.com/drive/folders/1AdV3KZdBIIe2WFDCqj1HZBfYbu2_QMeP?usp=drive_link)

  

## Implemented features

  

### 1 Search news

(https://newsapi.org/v2/everything?q=apple&apiKey=2e84bca55c074be98bd9802fc81002f6)

 - search news from api
 - the default search is all
 - only the api key is writen wrong for safety purpose
 - for searching query parameters used is   **?q=apple**

  
### 2 Get latest news

(https://newsapi.org/v2/top-headlines?country=us&apiKey=2e84bca55c074be98bd9802fc81002f6)

 - getting top headlines news from api and displaying it to main crowsel component on main page 
  

### 3 Get filters by category

(https://newsapi.org/v2/top-headlines?category=science&country=us&apiKey=2e84bca55c074be98bd9802fc81002f6)
 - the second half section of main page is used for filrers section 
 - the category changes according to chips filters 
 - these are all filters given below 
 - the filter chip patameter is  **?category=science**

 - ***business, entertainment ,general, health ,science ,sports .technology.***
 

### 4 Book mark news page

book mark page has being implemanted on second icon of navbar  all the data has stored in the local database 
using shared prifference 


### 5 Dark mode 

i have implemented the industry  trending feature which is *dark mode* 
which is located deeply nested in page as follows  at 

**5 profile  > darkmode**
  

### 6 Handling no internet connection when network is disconnected  

the connectiviety package is used for handelling the states of internet 

  



## Image optimization's

  

for image optimization's i used cashing technique and used library called

**cached_network_image** so that image will be stored in cash format wont downlead same image again and again which will save server bandwidth which will also increase speed of application

  

## Meamory managemnet

for memory management i used provider package **streamproviders** which automatically handles memory and dispose all data automatically after widget lifecycle is over

this helps in prevent un necessary memory leakages and also un necessary usage of resources like *ram* , *rom* , *battery* and will increases application performance

(we cand similar with **stream builders** but for memory management we have to manully dispose the variable memory to avoid leakage of memory by using on **dispose method**

  

  

and many more can be done by by working with experience developers of this company 