#  SOVScorecard

SOVScorecard is a web application that is used for valuation professionals to consider the assumptions and weaknesses in their analyses and opinions regarding Fannie Mae valuation products.

## Installation

Use github to clone the repository to your local hard drive. Open the Scorecard.Rproj. Open the global.R file and make sure you have all the required librairies installed. Then click Run App in R Studio.

![Dependencies](https://github.com/wtrombly/SOVScorecard/blob/main/small-dependencies.JPG)

## How To Use

Editing is required for the amount the property sold header for and should be "ClosePrice". 
### Make sure to change the header in your data file before importing. Do not include listings that have not sold.

Changing the header in the dataframe being called is also possible by changing the code in the Histogram section of server.R by using the search and replace tool.
The code has been written in an easy to view format for users that are not professional software developers and for ease of use for learners of R programming.

![Headers](https://github.com/wtrombly/SOVScorecard/blob/main/ClosePriceHeader.JPG)

Use the browse button to import the data set, using a CSV file you should not need to change the seperator field.

![Browse](https://github.com/wtrombly/SOVScorecard/blob/main/Browse.JPG)

After selecting an appropriate csv file you should get a histogram and purposeful readouts.

![Preview](https://github.com/wtrombly/SOVScorecard/blob/main/Importeddatapreview.JPG)

Adjust Histogram options and input the developed opinon of value

![Preview](https://github.com/wtrombly/SOVScorecard/blob/main/Histogramoptions.JPG)

After these steps you can then go to each of the ratings pages and select accordingly. You can download just parts of the whole PDF report or the actual PDF and use as necessary.



SOV Ethos: 
As a fellow Student of Value, you believe and know that you are not the cause of value in real property. You confirm that you are the reporter of value in the market place. You confirm that you are a practitioner of developing credible opinions of value using standards that exceed the industry minimum even in a changing industry. You confirm that your study of the real estate market is paramount to your success in determining where value comes from. You confirm that by implementing the Student of Value Scorecard in your appraisal assignments you will uphold the ongoing study of your field, you will uphold public trust for the industry by working with homeowners in addition to stakeholders, and you will report assignment results as more important or at least equally as important than the developed opinion of value because you hold this to be true.

William Trombly and The Real Estate Examiner are the Students of Value Score Card and spreadsheet owners. No sale of this service and or product is permitted by anyone other than the explicitly stated owners in this document.
(“Copyright © The Real Estate Examiner 2022”)
Written by William J Trombly – Certified Residential Appraiser


<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
