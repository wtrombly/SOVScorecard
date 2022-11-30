server <- function(input, output,session) {
  
  ####################################Reliability 1-5#############################
  output$reliability1 <- {(
    renderText(c("Reliability Category 1 --", input$reli1 ))
  )}  
  
  r1 <- reactive({
    renderText(c("Reliability Category 1 --", input$reli1 ))
  })
 
  output$reliability2 <- {(
    renderText(c("Reliability Category 2 --", input$reli2 ))
  )}
  
  output$reliability3 <- {(
    renderText(c("Reliability Category 3 --", input$reli3 ))
  )}
  
  output$reliability4 <- {(
    renderText(c("Reliability Category 4 --", input$reli4 ))
  )}
  
  output$reliability5 <- {(
    renderText(c("Reliability Category 5 --", input$reli5 ))
  )}
  
####################Reliability 1-5 End#########################################
  
  ####################Validity SCA 1-8 #########################################
  
  output$validitysca1 <- {(
    renderText(c("Validity SCA Category 1 --", input$validsca1 ))
  )}
  
  output$validitysca2 <- {(
    renderText(c("Validity SCA Category 2 --", input$validsca2 ))
  )}
  
  output$validitysca3 <- {(
    renderText(c("Validity SCA Category 3 --", input$validsca3 ))
  )}
  
  output$validitysca4 <- {(
    renderText(c("Validity SCA Category 4 --", input$validsca4 ))
  )}
  
  output$validitysca5 <- {(
    renderText(c("Validity SCA Category 5 --", input$validsca5 ))
  )}
  
  output$validitysca6 <- {(
    renderText(c("Validity SCA Category 6 --", input$validsca6 ))
  )}
  
  output$validitysca7 <- {(
    renderText(c("Validity SCA Category 7 --", input$validsca7 ))
  )}
  
  output$validitysca8 <- {(
    renderText(c("Validity SCA Category 8 --", input$validsca8 ))
  )}
  
  ####################Validity SCA 1-8 End######################################
  
  ####################Validity Cost 1-4 ########################################
  
  output$validitycost1 <- {(
    renderText(c("Validity Cost Category 1 --", input$validcost1 ))
  )}
  
  output$validitycost2 <- {(
    renderText(c("Validity Cost Category 2 --", input$validcost2 ))
  )}
  
  output$validitycost3 <- {(
    renderText(c("Validity Cost Category 3 --", input$validcost3 ))
  )}
  
  output$validitycost4 <- {(
    renderText(c("Validity Cost Category 4 --", input$validcost4 ))
  )}
  
  ####################Validity Cost 1-4 End ####################################
  
  ####################Validity Income 1-4  #####################################
  
  
  output$validityincome1 <- {(
    renderText(c("Validity Income Category 1 --", input$validincome1 ))
  )}
  
  output$validityincome2 <- {(
    renderText(c("Validity Income Category 2 --", input$validincome2 ))
  )}
  
  output$validityincome3 <- {(
    renderText(c("Validity Income Category 3 --", input$validincome3 ))
  )}
  
  output$validityincome4 <- {(
    renderText(c("Validity Income Category 4 --", input$validincome4 ))
  )}
  
  ####################Validity Income 1-4 End ##################################
  
  ####################Validity Subject Risk 1-3 ################################
  
  output$risky1 <- {(
    renderText(c("Subject Risk Category 1 --", input$risk1 ))
  )}
  
  output$risky2 <- {(
    renderText(c("Subject Risk Category 2 --", input$risk2 ))
  )}
  
  output$risky3 <- {(
    renderText(c("Subject Risk Category 3 --", input$risk3 ))
  )}
  
  ####################Validity Subject Risk 1-3 End#############################
  
  ####################Validity Subject Credibility 1-3 #########################
  
  output$credible1 <- {(
    renderText(c("Credibility Category 1 --", input$cred1 ))
  )}
  
  output$credible2 <- {(
    renderText(c("Credibility Category 2 --", input$cred2 ))
  )}
  
  output$credible3 <- {(
    renderText(c("Credibility Category 3 --", input$cred3 ))
  )}
  
  
  ####################Validity Subject Credibility 1-3 End######################
  
  #################### Histogram ###############################################
  
  
    output$hist <-  renderImage({
      req(input$comparables)
      img <- htmltools::capturePlot({
        df2 <- read.csv(input$comparables$datapath, header = input$header, sep = input$sep)
        hist(df2$ClosePrice,  breaks = input$bins, main = c("Close Price Mean"), xlab = "Comparables Close Price",)
        av <- input$appraiserValue
        abline(v = mean(df2$ClosePrice),col = "red")
        abline(v = av ,col = "blue")
      }, height = 800, width = 800)
      list(src = img, width = 800, height = 800)
    }, deleteFile = TRUE)
  
  
  ####################Histogram End ############################################
  
  #################### DataTable  ##############################################

  output$summary <-  renderPrint({
    df2 <- read.csv(input$comparables$datapath, header = input$header, sep = input$sep)
    summary(df2$ClosePrice)
    
  })
  
  output$standardDev <-  renderPrint({
    df2 <- read.csv(input$comparables$datapath, header = input$header, sep = input$sep)
    sd(df2$ClosePrice)
  })
  
  output$standardDevDistance <-  renderPrint({
    df2 <- read.csv(input$comparables$datapath, header = input$header, sep = input$sep)
    av <- input$appraiserValue
    sd(df2$ClosePrice)
    x <- abs((mean(df2$ClosePrice)-av))
    if(x <= sd(df2$ClosePrice)){
      "Your opinion of value is within 1 Standard Deviation from the Mean"
    } else if ((x <= (2*sd(df2$ClosePrice)))){
      "Your opinion of value is within 2 Standard Deviations from the Mean"
    } else if ((x <= (3*sd(df2$ClosePrice)))){
      "Your opinion of value is within 3 Standard Deviations from the Mean"
    } else if ((x > (3*sd(df2$ClosePrice)))){
      "Your opinion of value is greater than 3 Standard Deviations from the Mean"
    } 
  })
  
  output$withinMax <-  renderPrint({
    df2 <- read.csv(input$comparables$datapath, header = input$header, sep = input$sep)
    av <- input$appraiserValue
    if(between(av, min(df2$ClosePrice), max(df2$ClosePrice))){
      "The opinion of value is within the comparable sales price range"
    } else {
      "The opinion of value does not fall within the comparable sales price range"
    }
  })
  
  output$valueOpinion <-  renderPrint({
    input$appraiserValue
  })
  
  
  
  #################### DataTable End ###########################################
  
  #################### ScoreCard ###############################################
  
  
  
  #######################Reliability Overall Score##############################
  output$rateReli1 <-  renderPrint({
   req(input$reli1)
   req(input$reli2)
   req(input$reli3)
   req(input$reli4)
   req(input$reli5)
   
   reliweight20 <- 0.2
  r1 <-   as.double(( if(grepl("Rating 1", input$reli1, ignore.case = TRUE)){
      1 * reliweight20
    } else if((grepl("Rating 2", input$reli1, ignore.case = TRUE))){
      2 * reliweight20
    } else if((grepl("Rating 3", input$reli1, ignore.case = TRUE))){
      3 * reliweight20
    } else if((grepl("Rating 4", input$reli1, ignore.case = TRUE))){
      4 * reliweight20
    } else if((grepl("Rating 5", input$reli1, ignore.case = TRUE))){
      5 * reliweight20
    } ))
    
   r2 <-    as.double(( if(grepl("Rating 1", input$reli2, ignore.case = TRUE)){
        1 * reliweight20
      } else if((grepl("Rating 2", input$reli2, ignore.case = TRUE))){
        2 * reliweight20
      } else if((grepl("Rating 3", input$reli2, ignore.case = TRUE))){
        3 * reliweight20
      } else if((grepl("Rating 4", input$reli2, ignore.case = TRUE))){
        4 * reliweight20
      } else if((grepl("Rating 5", input$reli2, ignore.case = TRUE))){
        5 * reliweight20
      } ))
   
   r3 <-    as.double(( if(grepl("Rating 1", input$reli3, ignore.case = TRUE)){
     1 * reliweight20
   } else if((grepl("Rating 2", input$reli3, ignore.case = TRUE))){
     2 * reliweight20
   } else if((grepl("Rating 3", input$reli3, ignore.case = TRUE))){
     3 * reliweight20
   } else if((grepl("Rating 4", input$reli3, ignore.case = TRUE))){
     4 * reliweight20
   } else if((grepl("Rating 5", input$reli3, ignore.case = TRUE))){
     5 * reliweight20
   } ))
   
   r4 <-   as.double(( if(grepl("Rating 1", input$reli4, ignore.case = TRUE)){
     1 * reliweight20
   } else if((grepl("Rating 2", input$reli4, ignore.case = TRUE))){
     2 * reliweight20
   } else if((grepl("Rating 3", input$reli4, ignore.case = TRUE))){
     3 * reliweight20
   } else if((grepl("Rating 4", input$reli4, ignore.case = TRUE))){
     4 * reliweight20
   } else if((grepl("Rating 5", input$reli4, ignore.case = TRUE))){
     5 * reliweight20
   } ))
   
   r5 <-  as.double( ( if(grepl("Rating 1", input$reli5, ignore.case = TRUE)){
     1 * reliweight20
   } else if((grepl("Rating 2", input$reli5, ignore.case = TRUE))){
     2 * reliweight20
   } else if((grepl("Rating 3", input$reli5, ignore.case = TRUE))){
     3 * reliweight20
   } else if((grepl("Rating 4", input$reli5, ignore.case = TRUE))){
     4 * reliweight20
   } else if((grepl("Rating 5", input$reli5, ignore.case = TRUE))){
     5 * reliweight20
   } ))
   
    rsum <- r1 + r2 + r3 + r4 + r5
    c("Reliability Score",rsum)
   
  })
  
  ################### VALIDITY SCORE############################################
  output$rateValidity1 <-  renderPrint({
    req(input$validsca1)
    req(input$validsca2)
    req(input$validsca3)
    req(input$validsca4)
    req(input$validsca5)
    req(input$validsca6)
    req(input$validsca7)
    req(input$validsca8)
    req(input$validcost1)
    req(input$validcost2)
    req(input$validcost3)
    req(input$validcost4)
    req(input$validincome1)
    req(input$validincome2)
    req(input$validincome3)
    req(input$validincome4)
    
    validweight60 <- 0.60
    validweight25 <- 0.25
    validweight30 <- 0.30
    validweight5 <-  0.05
    v1 <-   as.double(( if(grepl("Rating 1", input$validsca1, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validsca1, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validsca1, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validsca1, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validsca1, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    v2 <-    as.double(( if(grepl("Rating 1", input$validsca2, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validsca2, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validsca2, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validsca2, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validsca2, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    v3 <-    as.double(( if(grepl("Rating 1", input$validsca3, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validsca3, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validsca3, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validsca3, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validsca3, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    v4 <-   as.double(( if(grepl("Rating 1", input$validsca4, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validsca4, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validsca4, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validsca4, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validsca4, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    
    #### VALIDITY COST#########
    vc1 <-   as.double(( if(grepl("Rating 1", input$validcost1, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validcost1, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validcost1, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validcost1, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validcost1, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    vc2 <-   as.double(( if(grepl("Rating 1", input$validcost2, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validcost2, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validcost2, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validcost2, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validcost2, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    vc3 <-   as.double(( if(grepl("Rating 1", input$validcost3, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validcost3, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validcost3, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validcost3, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validcost3, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    vc4 <-   as.double(( if(grepl("Rating 1", input$validcost4, ignore.case = TRUE)){
      1 * validweight25
    }  else if((grepl("Rating 5", input$validcost4, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    ##### VALIDITY INCOME############### 
    
    vi1 <-   as.double(( if(grepl("Rating 1", input$validincome1, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validincome1, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validincome1, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validincome1, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validincome1, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    vi2 <-   as.double(( if(grepl("Rating 1", input$validincome2, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validincome2, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validincome2, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validincome2, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validincome2, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    vi3 <-   as.double(( if(grepl("Rating 1", input$validincome3, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validincome3, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validincome3, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validincome3, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validincome3, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    vi4 <-   as.double(( if(grepl("Rating 1", input$validincome4, ignore.case = TRUE)){
      1 * validweight25
    }  else if((grepl("Rating 5", input$validincome4, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    ################  VALIDITY SCA CONTINUED
    
    v5 <-   as.double(( if(grepl("Rating 1", input$validsca5, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validsca5, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validsca5, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validsca5, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validsca5, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    v6 <-   as.double(( if(grepl("Rating 1", input$validsca6, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validsca6, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validsca6, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validsca6, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validsca6, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    
    v7 <-   as.double(( if(grepl("Rating 1", input$validsca7, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validsca7, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validsca7, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validsca7, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validsca7, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    
    v8 <-   as.double(( if(grepl("Rating 1", input$validsca8, ignore.case = TRUE)){
      1 * validweight25
    } else if((grepl("Rating 2", input$validsca8, ignore.case = TRUE))){
      2 * validweight25
    } else if((grepl("Rating 3", input$validsca8, ignore.case = TRUE))){
      3 * validweight25
    } else if((grepl("Rating 4", input$validsca8, ignore.case = TRUE))){
      4 * validweight25
    } else if((grepl("Rating 5", input$validsca8, ignore.case = TRUE))){
      5 * validweight25
    } ))
    
    vscasumonethru4 <- v1 + v2 + v3 + v4
    vscasumfivethru8 <- v5 + v6 +  v7 + v8
    vcostsum <- vc1 + vc2 + vc3 + vc4
    vincome <- vi1 + vi2 + vi3 + vi4
    
    vtotal <- (validweight30 * vscasumonethru4) + (vcostsum * validweight5) + (vincome * validweight5) + (vscasumfivethru8 * validweight60)
    c("Validity",vtotal)
    
  })
  
  
  ############## SUBJECT PROPERTY RISK ###
  
  output$rateRiskyTotal1 <-  renderPrint({
    req(input$risk1)
    req(input$risk2)
    req(input$risk3)
    
    
    riskweight34 <- 0.34
    riskweight33 <- 0.33
    rk1 <-    as.double(( if(grepl("Rating 1", input$risk1, ignore.case = TRUE)){
      1 * riskweight34
    } else if((grepl("Rating 2", input$risk1, ignore.case = TRUE))){
      2 * riskweight34
    } else if((grepl("Rating 3", input$risk1, ignore.case = TRUE))){
      3 * riskweight34
    } else if((grepl("Rating 4", input$risk1, ignore.case = TRUE))){
      4 * riskweight34
    } else if((grepl("Rating 5", input$risk1, ignore.case = TRUE))){
      5 * riskweight34
    } ))
    
    rk2 <-    as.double(( if(grepl("Rating 1", input$risk2, ignore.case = TRUE)){
      1 * riskweight33
    } else if((grepl("Rating 2", input$risk2, ignore.case = TRUE))){
      2 * riskweight33
    } else if((grepl("Rating 3", input$risk2, ignore.case = TRUE))){
      3 * riskweight33
    } else if((grepl("Rating 4", input$risk2, ignore.case = TRUE))){
      4 * riskweight33
    } else if((grepl("Rating 5", input$risk2, ignore.case = TRUE))){
      5 * riskweight33
    } ))
    
    rk3 <-    as.double(( if(grepl("Rating 1", input$risk3, ignore.case = TRUE)){
      1 * riskweight33
    } else if((grepl("Rating 2", input$risk3, ignore.case = TRUE))){
      2 * riskweight33
    } else if((grepl("Rating 3", input$risk3, ignore.case = TRUE))){
      3 * riskweight33
    } else if((grepl("Rating 4", input$risk3, ignore.case = TRUE))){
      4 * riskweight33
    } else if((grepl("Rating 5", input$risk3, ignore.case = TRUE))){
      5 * riskweight33
    } ))
    
    
    rksum <- rk1 + rk2 + rk3 
    c("Subject Property Risk Score",rksum)
    
  })
  
  ############## CREDIBILITY ###
  
  output$rateCredibility1 <-  renderPrint({
    req(input$cred1)
    req(input$cred2)
    req(input$cred3)
    
    
    credweight34 <- 0.34
    credweight33 <- 0.33
    c1 <-   as.double(( if(grepl("Rating 1", input$cred1, ignore.case = TRUE)){
      1 * credweight34
    }  else if((grepl("Rating 5", input$cred1, ignore.case = TRUE))){
      5 * credweight34
    } ))
    
    c2 <-    as.double(( if(grepl("Rating 1", input$cred2, ignore.case = TRUE)){
      1 * credweight33
    } else if((grepl("Rating 2", input$cred2, ignore.case = TRUE))){
      2 * credweight33
    } else if((grepl("Rating 3", input$cred2, ignore.case = TRUE))){
      3 * credweight33
    } else if((grepl("Rating 4", input$cred2, ignore.case = TRUE))){
      4 * credweight33
    } else if((grepl("Rating 5", input$cred2, ignore.case = TRUE))){
      5 * credweight33
    } ))
    
    c3 <-    as.double(( if(grepl("Rating 1", input$cred3, ignore.case = TRUE)){
      1 * credweight33
    } else if((grepl("Rating 2", input$cred3, ignore.case = TRUE))){
      2 * credweight33
    } else if((grepl("Rating 3", input$cred3, ignore.case = TRUE))){
      3 * credweight33
    } else if((grepl("Rating 4", input$cred3, ignore.case = TRUE))){
      4 * credweight33
    } else if((grepl("Rating 5", input$cred3, ignore.case = TRUE))){
      5 * credweight33
    } ))
    
    
    csum <- c1 + c2 + c3 
    c("Credibility Score",csum)
    
  })
    
  
  
  
  ##################### Download Plot ######################################
  
  
  histPlot <- function(){
    df2 <- read.csv(input$comparables$datapath, header = input$header, sep = input$sep)
    themean <- mean(df2$ClosePrice)
    hist(df2$ClosePrice,  breaks = input$bins, main = "Close Price Mean", xlab = "Comparables Close Price",)
    av <- input$appraiserValue
    abline(v = mean(df2$ClosePrice),col = "red")
    abline(v = av ,col = "blue")
  }
  
  output$downloadPlot <- downloadHandler(
    filename = "plotHist.png",
    
    content = function(file){
      png(file)
      histPlot()
      dev.off()
    })
    
  ##################### Download Summary  ###################################
  
  standardDeviationDownload <- function(){
    df2 <- read.csv(input$comparables$datapath, header = input$header, sep = input$sep)
    av <- input$appraiserValue
    x <- abs((mean(df2$ClosePrice)-av))
    
    deviationList <- list(sum = summary(df2$ClosePrice), sdv = sd(df2$ClosePrice), 
      sdd = if(x <= sd(df2$ClosePrice)){
      "Your opinion of value is within 1 Standard Deviation from the Mean"
    } else if ((x <= (2*sd(df2$ClosePrice)))){
      "Your opinion of value is within 2 Standard Deviations from the Mean"
    } else if ((x <= (3*sd(df2$ClosePrice)))){
      "Your opinion of value is within 3 Standard Deviations from the Mean"
    } else if ((x > (3*sd(df2$ClosePrice)))){
      "Your opinion of value is greater than 3 Standard Deviations from the Mean"
    } , wMax = if(between(av, min(df2$ClosePrice), max(df2$ClosePrice))){
      "The opinion of value is within the comparable sales price range"
    } else {
      "The opinion of value does not fall within the comparable sales price range"
    }, avt = paste("Your opinion of value = $", input$appraiserValue) )
  }
  
  output$downloadSummary <- downloadHandler(
    filename = "plotHist.txt",
    
    content = function(file){
      #writeLines(paste(standardDeviationDownload(), collapse = ", "), file)
      write.table(paste(standardDeviationDownload()), file,col.names=FALSE)
    })
  
  ##################### Download Ratings  ###################################
  
  ratingsDownload <- function(){
    
    
    params <- list(r1 = input$reli1,
                   r2 = input$reli2,
                   r3 = input$reli3,
                   r4 = input$reli4,
                   r5 = input$reli5,
                   vsca1 = input$validsca1,
                   vsca2 = input$validsca2,
                   vsca3 = input$validsca3,
                   vsca4 = input$validsca4,
                   vsca5 = input$validsca5,
                   vsca6 = input$validsca6,
                   vsca7 = input$validsca7,
                   vsca8 = input$validsca8,
                   vc1 = input$validcost1,
                   vc2 = input$validcost2,
                   vc3 = input$validcost3,
                   vc4 = input$validcost4,
                   vi1 = input$validincome1,
                   vi2 = input$validincome2,
                   vi3 = input$validincome3,
                   vi4 = input$validincome4,
                   rk1 = input$risk1,
                   rk2 = input$risk2,
                   rk3 = input$risk3,
                   c1 = input$cred1,
                   c2 = input$cred2,
                   c3 = input$cred3
                   )
  }
  
  output$downloadRatings <- downloadHandler(
    filename = "ratings.txt",
    
    content = function(file){
      #writeLines(paste(standardDeviationDownload(), collapse = ", "), file)
      write.table(paste(ratingsDownload()), file,col.names=FALSE)
    })
  
  ########################### R MARKDOWN########################################
  
  
  output$downloadReport = downloadHandler(
    filename = 'myreport.pdf',
    content = function(file) {
      out = render("report.Rmd")
      file.rename(out, file) # move pdf to file for downloading
    },
    contentType = NA
  )
  
}

  # secure_server(server)
  # 
