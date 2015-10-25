library(shiny)
library(ggplot2)
options(scipen = 999)

calculateBasic <- function(amount, ret, tax) {
     year <<- 1:40
     totA <<- vector(length=40)
     totA[0] <- 0
     totB <<- vector(length=40)
     totB[0] <- 0
     totC <<- vector(length=40)
     totC[0] <- 0
     amt <<- amount * 12
     taxed <<- amt*(1-tax/100)
     for(i in year) {
          totA[i+1] <- (totA[i]+taxed)*(1+ret/100)
          totB[i+1] <- (totB[i]+amt)*(1+ret/100)
          totC[i+1] <- (totC[i]+amt*2)*(1+ret/100)
     }
     tot <<- data.frame(a = totA, b=totB, c=totC)
     return(tot)
}





shinyServer(
     function(input, output, session) {
          output$lineChart <- renderPlot({
               tot <- calculateBasic(input$amount, input$ret, input$tax)
               ggplot(tot, aes(0:40)) + 
                    geom_line(color="black", aes(y=a)) + 
                    geom_line(color="blue", aes(y=b)) + 
                    geom_line(color="red", aes(y=c)) + 
                    xlab("Years") + ylab("Balance($)") +
                    theme(legend.position = c(0.2, 0.8))
          }, height=800)
     }
)