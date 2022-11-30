

ui <- fluidPage(theme = shinytheme("darkly"),
                navbarPage(
                    theme = "cerulean",  # <--- To use a theme, uncomment this (I find uncommenting this creates an error, I'm an amatuer)
                    title = "SOV Score Card",
                    tabPanel("Reliability", 
                             
                             mainPanel(
                               
                                selectInput(inputId = "reli1", label = "Reliability 1", choices =  c("", "Rating 1: The developed opinion of value falls outside of 3 standard deviations of the comparable sales data set", 
                                                                                                     "Rating 2: The developed opinion of value falls within 3 standard deviations of the comparable sales data set",
                                                                                                     "Rating 3: The developed opinion of value falls within 2 standard deviations of the comparable sales data set",
                                                                                                     "Rating 4: The developed opinion of value falls within 1 standard deviations of the comparable sales data set",
                                                                                                     "Rating 5: The developed opinion of value falls within .5 standard deviations of the comparable sales data set"),
                                                                                                     selected = NULL, multiple = FALSE, width = "600px", ),
                                
                                
                                selectInput(inputId = "reli2", label = "Reliability 2", choices =  c("", "Rating 1: There were 1 or fewer comparable sales available", 
                                                                                                     "Rating 2: There were at least 3 comparable sales available",
                                                                                                    "Rating 3: There were at least 5 comparable sales available with the option to use the best available requiring the least adjustments and or the most recent.",
                                                                                                    "Rating 4: There were numerous comparable sales available with the ability to minimize the need for adjustments",
                                                                                                    "Rating 5: The best available comparable sales were available with the ability to minimize the need for adjustments"),
                                                                                                      selected = NULL, multiple = FALSE, width = "600px",  ),
                                
                                
                                selectInput(inputId = "reli3", label = "Reliability 3", choices =  c("", "Rating 1: The use of the extraordinary assumption/s was used in the analysis and if were to be found false would alter the opinion of value by more than 5% of the opinion of value.", 
                                                                                                     "Rating 2: The use of the extraordinary assumption/s was used in the analysis and if were to be found false would alter the opinion of value by more than 2% of the opinion of value but less than 5% of the opinion of value.",
                                                                                                     "Rating 3: The use of the extraordinary assumption/s was used in the analysis and if were to be found false would alter the opinion of value by less than 2% of the opinion of value",
                                                                                                     "Rating 4: The use of the extraordinary assumption/s was used in the analysis and if were to be found false would alter the opinion of value by less than 1% of the opinion of value",
                                                                                                     "Rating 5: No extraordinary assumptions were used in the analysis and development of the appraisal assignment"),
                                                                                                     selected = NULL, multiple = FALSE, width = "600px",),
                                
                                selectInput(inputId = "reli4", label = "Reliability 4", choices =  c("", "Rating 1: Current market trends indicate a strong decline", 
                                                                                                     "Rating 2: Current market trends indicate a decline in contrast to 5–10-year trends",
                                                                                                     "Rating 3: Current trends are increasing or decreasing at a strong rate",
                                                                                                     "Rating 4: Current trends are steadily increasing or similar to that of 5–10-year trends",
                                                                                                     "Rating 5: Current trends are stable with little to no fluctuations as compared to 5–10-year trends"),
                                            selected = NULL, multiple = FALSE, width = "600px",),
                                
                                selectInput(inputId = "reli5", label = "Reliability 5", choices =  c("", "Rating 1: The subject property in its current state does is not the highest and best use", 
                                                                                                     "Rating 2: The subject property is grandfathered in its current state and is subject to change in the near future",
                                                                                                     "Rating 3: The subject property is in a transitional period and possibly grandfathered in and not expected to change within the next economic cycle",
                                                                                                     "Rating 4: The subject property in its current state is the highest and best use categorically, however, improvements could be made",
                                                                                                     "Rating 5: The subject property in its current state is the highest and best use with little to no indication of change"),
                                            selected = NULL, multiple = FALSE, width = "600px",),
                             )
                    ),
                               
                                tabPanel("Validity", 
                                         
                                            mainPanel(
                                              h3("Sales Comparison Approach"),
                                              
                                              selectInput(inputId = "validsca1", label = "Validity-SCA 1", choices =    c("", "Rating 1: We had barely enough to develop a credible opinion with each observation point", 
                                                                                                                          "Rating 2: Some of the data with each observation point were available but not all data could be verified with a second source.",
                                                                                                                          "Rating 3: Most data was available with each observation point and almost all could be verified with a second source",
                                                                                                                          "Rating 4: Almost all data was available with each observation point and all data could be verified with a second source",
                                                                                                                          "Rating 5: We had everything we typically would need for such an assignment with each observation point"),
                                                          selected = NULL, multiple = FALSE, width = "600px",),
                                              
                                              selectInput(inputId = "validsca2", label = "Validity-SCA 2", choices =    c("", "Rating 1: Nothing like the subject property", 
                                                                                                                          "Rating 2: Some data points used are comparable to the subject.",
                                                                                                                          "Rating 3: Most data observations used are similar to the subject property with the need for less than 10% net adjustments for physical factors of value for significantly weighted comparables.",
                                                                                                                          "Rating 4: Data observations are very similar to the subject property with the need for less than 5% net adjustments for physical factors of value of significantly weighted comparables",
                                                                                                                          "Rating 5: Comparable sales are VERY similar to the subject property with the need for less than 2% net adjustments for physical factors of value"),
                                                          selected = NULL, multiple = FALSE, width = "600px",),
                                              
                                              selectInput(inputId = "validsca3", label = "Validity-SCA 3", choices =    c("", "Rating 1: 3 to make a market, the bare minimum.", 
                                                                                                                          "Rating 2: 4-5 comparable sales were able to be considered using at least 1 sale within the neighborhood",
                                                                                                                          "Rating 3: 6-7 comparable sales were able to be considered using at least 2 sales within the neighborhood",
                                                                                                                          "Rating 4: At least 3 - 5 comparable sales are available within the neighborhood",
                                                                                                                          "Rating 5: At least 3 - 5 comparable sales are available within the neighborhood and all significant factors of value are bracketed using these sales"),
                                                          selected = NULL, multiple = FALSE, width = "600px",),
                                              
                                              selectInput(inputId = "validsca4", label = "Validity-SCA 4", choices =    c("", "Rating 1: The best available sales were used in the analysis. Although these sales are logical due to the lack of available data, these are the best available and would be considered by market participants. There are numerous differences between the subject and sales", 
                                                                                                                          "Rating 2: The best available comparable sales were used in the analysis. Although these sales are logical due to the lack of available data, these are the best available and would be considered by market participants. There are some differences between the subject and comparable sales",
                                                                                                                          "Rating 3: Comparable sales have been used with some differences from the subject property",
                                                                                                                          "Rating 4: Evidence-based valuation methods have been well implemented and sales have limited differences from the subject property",
                                                                                                                          "Rating 5: Evidence-based valuation methods were used for selecting comparables and were easily applicable to the data"),
                                                          selected = NULL, multiple = FALSE, width = "600px",),
                                              
                                              ##############SCA CONTINUED############################################
                                              
                                              selectInput(inputId = "validsca5", label = "Validity-SCA 5", choices =    c("", "Rating 1: There is a lack of measurable evidence to support adjustments concerning most factors of value", 
                                                                                                                          "Rating 2: There is adequate evidence to support adjustments concerning significant factors of value",
                                                                                                                          "Rating 3: Paired sales analysis and aggregate market analyses were used to develop adjustments with credible results",
                                                                                                                          "Rating 4: Multiple linear regression models were developed with adequate indications of adjustments",
                                                                                                                          "Rating 5: Multiple linear regression models were developed with strong indications of adjustments, or no adjustments were required"),
                                                          selected = NULL, multiple = FALSE, width = "600px",),
                                              
                                              selectInput(inputId = "validsca6", label = "Validity-SCA 6", choices =    c("", "Rating 1: There is a lack of comparable and market area data to support a credible market condition adjustment", 
                                                                                                                          "Rating 2: There is some data available to support a market condition adjustment",
                                                                                                                          "Rating 3: There is a good amount of data available to support a market condition adjustment",
                                                                                                                          "Rating 4: There is a good amount of quality data available to support market condition adjustments with multiple models available for analysis and consideration",
                                                                                                                          "Rating 5: There is a good amount of quality data available to support market condition adjustments with multiple models available for analysis and consideration that adhere to higher quality standards"),
                                                          selected = NULL, multiple = FALSE, width = "600px",),
                                              
                                              selectInput(inputId = "validsca7", label = "Validity-SCA 7", choices =    c("", "Rating 1: Adjustments appear to be needed based on historical data and are derived based on sensitivity analysis within the sales grid", 
                                                                                                                          "Rating 2: These adjustments are derived based on simple summary statistics differences with a below-average quality data set",
                                                                                                                          "Rating 3: These adjustments are derived based on simple summary statistics differences with an average to good quality data set",
                                                                                                                          "Rating 4: These adjustments are derived based on simple summary statistics differences with an average to good quality data set with additional consideration to pairs data",
                                                                                                                          "Rating 5: Multiple observations of true pairs were available and resulted in a credible adjustment, or no additional adjustments are needed"),
                                                          selected = NULL, multiple = FALSE, width = "600px",),
                                              
                                              selectInput(inputId = "validsca8", label = "Validity-SCA 8", choices =    c("", "Rating 1: No comparable listings are available", 
                                                                                                                          "Rating 2: Few comparable listings are available requiring less than 10% physical adjustments that do not allow clear application of the principle of substitution",
                                                                                                                          "Rating 3: Multiple comparable listings are available requiring less than 10% physical adjustments that allow for easy application of the principle of substitution from within the market area",
                                                                                                                          "Rating 4: Multiple comparable listings are available requiring less than 5% physical adjustments that allow for easy application of the principle of substitution",
                                                                                                                          "Rating 5: Multiple immediate area (subdivision or neighborhood) comparable & very similar listings are available requiring less than 5% physical adjustments that clearly define the supply side pricing and allow for easy application of the principle of substitution"),
                                                          selected = NULL, multiple = FALSE, width = "600px",),
                                              
                                              h3("Validity - Cost Approach"),
                                              
                                              selectInput(inputId = "validcost1", label = "Validity-Cost 1", choices =    c("", "Rating 1: There is little to no evidence of cost data available for this style or structure of real estate, or the cost approach was not performed", 
                                                                                                                            "Rating 2: Some evidence of cost data is available using industry-accepted sources",
                                                                                                                            "Rating 3: There is strong evidence of cost data available using industry-accepted sources with some new construction data points available",
                                                                                                                            "Rating 4: Moderate evidence of land value is available with evidence of cost data and new construction data being similar and or superior to Rating 3",
                                                                                                                            "Rating 5: Very strong evidence of land value is available with multiple new construction data cost models used considering industry-accepted data sources and similar new construction occurring within 6 months"),
                                                          selected = NULL, multiple = FALSE, width = "600px",),
                                              
                                              selectInput(inputId = "validcost2", label = "Validity-Cost 2", choices =    c("", "Rating 1: Only 1 available industry-accepted source was used in the analysis, or the cost approach was not performed", 
                                                                                                                            "Rating 2: At least 2 cost estimates were able to be developed using industry accepted data sources (not new construction)",
                                                                                                                            "Rating 3: At least 2 cost estimates were able to be developed using industry accepted data sources and one of these estimates uses new construction data costs",
                                                                                                                            "Rating 4: At least 2 cost estimates were able to be developed using industry accepted data sources and one of these estimates uses new construction data costs with adequate indications of new construction lot values",
                                                                                                                            "Rating 5: At least 2 cost estimates were able to be developed using industry accepted data sources and one of these estimates uses new construction data costs with STRONG indications of new construction lot values"),
                                                          selected = NULL, multiple = FALSE, width = "600px",),
                                              
                                              selectInput(inputId = "validcost3", label = "Validity-Cost 3", choices =    c("", "Rating 1: Cost estimates appear to be reasonable in analysis, or the cost approach was not performed", 
                                                                                                                            "Rating 2: Cost estimates are reasonable in analysis and are supported with new construction",
                                                                                                                            "Rating 3: Lot value is adequately developed and cost estimates are supported with new construction",
                                                                                                                            "Rating 4: Lot value is clearly developed and cost estimates are supported with new construction",
                                                                                                                            "Rating 5: Lot value is very clearly developed and cost estimates are nearly identical with new construction"),
                                                          selected = NULL, multiple = FALSE, width = "600px",),
                                              
                                              selectInput(inputId = "validcost4", label = "Validity-Cost 4", choices =    c("", "Rating 1: The developed cost approach was used at the request of the client and provides little to no validity to the appraisal assignment due to a lack of data sources and or costs are considered a moving target with strong continuous fluctuations both up and down given market trends or a large margin of supplier pricing making the approach less valid, or the cost approach was not performed", 
                                                                                                                            "Rating 5: The developed cost approach was adequately developed and considered logical analysis and application"),
                                                          selected = NULL, multiple = FALSE, width = "600px",),
                                              
                                            
                                        
                                         h3("Validity - Income Approach"),
                                         
                                         selectInput(inputId = "validincome1", label = "Validity-Income 1", choices =    c("", "Rating 1: There is little to no evidence of income GRM data available for the subject property and comparable sales, or the income approach was not performed", 
                                                                                                                           "Rating 2: Some evidence of income data is available and some extrapolation of the data or development of additional data points has occurred to derive a credible result",
                                                                                                                           "Rating 3: There is moderate evidence of income data available using similar comparable sales data with no need for extrapolation or development of data points",
                                                                                                                           "Rating 4: There is strong evidence of income data due to many available using similar comparable sales data with no need for extrapolation or development of data points",
                                                                                                                           "Rating 5: There is strong evidence of income data due to many available using similar comparable sales data with no need for extrapolation or development of data points with a majority of the considered data points occurring within the last 6 months"),
                                                     selected = NULL, multiple = FALSE, width = "600px",),
                                         
                                         selectInput(inputId = "validincome2", label = "Validity-Income 2", choices =    c("", "Rating 1: 3 or less data points were available to develop gross rent multiplier data points, or the income approach was not performed", 
                                                                                                                           "Rating 2: 4-5 comparable data points were able to be considered using at least 1 sale within the neighborhood",
                                                                                                                           "Rating 3: 6-7 comparable GRM data points were able to be considered using at least 2 sales within the neighborhood",
                                                                                                                           "Rating 4: At least 3 - 5 comparable GRM data points are available within the neighborhood",
                                                                                                                           "Rating 5: At least 5 comparable GRM data points are available within the neighborhood and all significant factors of value are bracketed using these comparable data points"),
                                                     selected = NULL, multiple = FALSE, width = "600px",),          
                                         
                                         selectInput(inputId = "validincome3", label = "Validity-Income 3", choices =    c("", "Rating 1: There are no comparable GRM data points available for analysis, or the income approach was not performed", 
                                                                                                                           "Rating 2: Some data points used are comparable to the subject",
                                                                                                                           "Rating 3: Most data observations used are similar to the subject property with the need for less than 10% net adjustments for physical factors of value for significantly weighted comparables",
                                                                                                                           "Rating 4: Data observations are very similar to the subject property with the need for less than 5% net adjustments for physical factors of value of significantly weighted comparables",
                                                                                                                           "Rating 5: Comparable sales are VERY similar to the subject property with the need for less than 2% net adjustments for physical factors of value"),
                                                     selected = NULL, multiple = FALSE, width = "600px",),
                                         
                                         selectInput(inputId = "validincome4", label = "Validity-Income 4", choices =    c("", "Rating 1: The developed income approach was used at the request of the client and provides little to no validity to the appraisal assignment due to a lack of data or the need for extrapolation of a limited data set, or the income approach was not performed", 
                                                                                                                           "Rating 5: The developed income approach was adequately developed and considered logical analysis and application"),
                                                     selected = NULL, multiple = FALSE, width = "600px",),
                                         br(),
                                         br(),
                                         br(),
                                         br(),
                                         br(),
                                         br()
                                              
                                              
                                            ) #mainPanel
                                         ), #tabPanel
                                
                             
                  tabPanel("Subject Property Risk", 
                               mainPanel(
                             
                             selectInput(inputId = "risk1", label = "Subject Risk - Structure Condition", choices =              c("", "Rating 1: The subject property is in a poor and unlivable condition that provides numerous health and safety risks", 
                                                                                                               "Rating 2: The subject property is in poor to fair condition that may have safety risks",
                                                                                                               "Rating 3: The subject property is in average condition with no apparent safety or health risks",
                                                                                                               "Rating 4: The subject property is in good condition with no apparent safety or health risks",
                                                                                                               "Rating 5: The subject property is in very good to excellent condition with no apparent safety or health risks"),
                                         selected = NULL, multiple = FALSE, width = "600px",),
                             
                             selectInput(inputId = "risk2", label = "Subject Property Risk - Location and External Influences", choices =              c("", "Rating 1: The subject property is in close proximity to external influences with current negative influences on marketability", 
                                                                                                               "Rating 2: The subject property is in close proximity to external influences having a negative influence with negative influence on marketability within the last year",
                                                                                                               "Rating 3: The subject property is moderately close to external influences and has not had a recent negative influence on marketability or no evidence to support a negative influence",
                                                                                                               "Rating 4: The subject property location appears to be neutral with no negative influences on marketability",
                                                                                                               "Rating 5: The subject property location is considered beneficial as compared to proximate locations and neighborhoods"),
                                         selected = NULL, multiple = FALSE, width = "600px",),
                             
                             selectInput(inputId = "risk3", label = "Subject Property Risk - Scope of Inpsection", choices =              c("", "Rating 1: Not inspected", 
                                                                                                               "Rating 2: Inspected by 3rd party not obligated to the appraiser by contract and or responsibility or accountability",
                                                                                                               "Rating 3: Inspected by a trained trainee or trained assistant",
                                                                                                               "Rating 4: Personally inspected by signing appraiser only",
                                                                                                               "Rating 5: Personally inspected by signing appraiser and viewed licensed inspection report in addition to the scope of work"),
                                         selected = NULL, multiple = FALSE, width = "600px",),
                             
                               )
                  ),
                             
                   tabPanel("Credibility",
                            mainPanel(          
                             selectInput(inputId = "cred1", label = "Credibility Category License Level", choices =      c("", "License level and/or professional experience is not adequate for assignment and additional consultation was required to develop assignment results", 
                                                                                                               "Rating 5: License level and professional experience is adequate for the assignment"),
                                         selected = NULL, multiple = FALSE, width = "600px",),
                             
                             selectInput(inputId = "cred2", label = "Credibility Category Competency Subject", choices =      c("", "Rating 1: The appraiser has developed credible opinions and analysis regarding real property similar in style and design", 
                                                                                                               "Rating 2: The appraiser has developed some credible opinions and analyses regarding real property similar in style and design",
                                                                                                               "Rating 3: The appraiser has developed many credible opinions and analyses regarding real property similar in style and design",
                                                                                                               "Rating 4: The appraiser has developed many credible opinions and analyses regarding real property similar in style and design and maintains some market knowledge regarding similar real property",
                                                                                                               "Rating 5: The appraiser has developed many credible opinions and analyses regarding real property similar in style and design and maintains a wealth of market knowledge regarding similar or near-identical real property"),
                                         selected = NULL, multiple = FALSE, width = "600px",),
                             
                             selectInput(inputId = "cred3", label = "Credibility Category Competency neighborhood/market area", choices =      c("", "Rating 1: The appraiser has developed adequate credible opinions and analysis regarding real property similar in the market area", 
                                                                                                               "Rating 2: The appraiser has developed some credible opinions and analysis regarding real property similar in the market area",
                                                                                                               "Rating 3: The appraiser has developed many credible opinions and analyses regarding real property similar in style and design in the market area",
                                                                                                               "Rating 4: The appraiser has developed many credible opinions and analyses regarding real property similar in style and design and maintains some market knowledge regarding similar real property in the neighborhood",
                                                                                                               "Rating 5: The appraiser has developed many credible opinions and analyses regarding real property similar in style and design and maintains a wealth of market knowledge regarding similar or near-identical real property in the neighborhood"),
                                         selected = NULL, multiple = FALSE, width = "600px",),
                             
                            )
                   ),
                                   
                        
                    tabPanel("Histogram", 
                             sidebarPanel(
                               tags$h3("Input Comparable Sales Close Prices for Data Set:"),
                               fileInput(inputId = "comparables", label = "Browse for csv file...", placeholder = "No file selected",multiple = FALSE),
                               textInput("sep", label = "Enter the Seperator character:", value = ","),
                               checkboxInput("header", label = "File contains a header", value = TRUE),
                               sliderInput(inputId = "bins",
                                           label = "Number of bins:",
                                           min = 1,
                                           max = 50,
                                           value = 30),
                               numericInput(inputId = "appraiserValue", label = "Type Opinion of Value Here", value = 0),
                               "Steps to Uploading a CSV file:",
                               br(),
                               "1: Make sure you are uploading a CSV file",
                               br(),
                               "2: Make sure that the ClosePrice column for comparable sales is labeled ClosePrice",
                               br(),
                               "3: Make sure that all values in the ClosePrice column are not blank and are greater than 0 (No Listings)",
                               
                               br(),
                               br(),
                               br(),
                               
                             ),
                             mainPanel(
                            
                             imageOutput("hist"),
                             
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             br(),
                             downloadButton("downloadPlot", "Download Plot"),
                             
                             verbatimTextOutput("summary"),
                             tags$h4("Opinion of Value"),
                             verbatimTextOutput("valueOpinion"),
                             tags$h4("Standard Deviation"),
                             verbatimTextOutput("standardDev"),
                             verbatimTextOutput("standardDevDistance"),
                             verbatimTextOutput("withinMax"),
                             
                             downloadButton("downloadSummary", "Download Standard Deviation Summary")
                            
                             )
                             
                             
                             ),
                    tabPanel("ScoreCard", 
                             verbatimTextOutput("rateReli1"),
                             verbatimTextOutput("rateValidity1"),
                             verbatimTextOutput("rateCredibility1"),
                             verbatimTextOutput("rateRiskyTotal1")
                             ),
                    tabPanel("PrintOut", 
                             
                             downloadButton("downloadReport", "Download Full Report"),
                             downloadButton("downloadRatings", "Download Ratings List"),
                             
                             textOutput("reliability1"),
                             textOutput("reliability2"),
                             textOutput("reliability3"),
                             textOutput("reliability4"),
                             textOutput("reliability5"),
                             br(),
                             br(),
                             textOutput("validitysca1"),
                             textOutput("validitysca2"),
                             textOutput("validitysca3"),
                             textOutput("validitysca4"),
                             textOutput("validitysca5"),
                             textOutput("validitysca6"),
                             textOutput("validitysca7"),
                             textOutput("validitysca8"),
                             br(),
                             br(),
                             textOutput("validitycost1"),
                             textOutput("validitycost2"),
                             textOutput("validitycost3"),
                             textOutput("validitycost4"),
                             br(),
                             br(),
                             textOutput("validityincome1"),
                             textOutput("validityincome2"),
                             textOutput("validityincome3"),
                             textOutput("validityincome4"),
                             br(),
                             br(),
                             textOutput("risky1"),
                             textOutput("risky2"),
                             textOutput("risky3"),
                             br(),
                             br(),
                             textOutput("credible1"),
                             textOutput("credible2"),
                             textOutput("credible3")
                             
                             )
                ) # navbarPage
)# fluidPage

  # secure_ui(ui)
  # 

