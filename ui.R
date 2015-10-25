library(shiny)
shinyUI(pageWithSidebar(
     headerPanel("The Value of Savings, Savings with Deferred Tax, and Employer Matching"),
     sidebarPanel(
          sliderInput('amount', 'Income foregone monthly', value=100, min=0, max=1000, step=100),
          sliderInput('ret', 'Rate of return', value=8, min=0, max=15, step=1),
          sliderInput('tax', 'Marginal tax rate', value=28, min=0, max=39, step=1),
          p("This application compares the amount of money that will be saved over 40 years under various conditions. The sliders
            on the left allow you to manipulate the amount of pre-tax income foregone, the rate of return earned, and the 
            marginal tax rate. The 'income foregone' is not quite the amount deposited, but rather the amount deposited minus 
            the taxes paid on that amount. This factors in the tax advantages of a tax deferred instrument such as a 401K. On the 
            Rate of return front, the application defaults to 8% as that is close to the long run average of equity markets. 
            To see returns under safer assets such as bonds, set it lower, perhaps 2%."),
          p("The three lines represent three different investment circumstances. The lowest, the black line, shows the accumulation 
            under a simple compounding interest condition with no tax advantages or employer matching. The middle line, the blue
            one, shows the accumulation where tax on the deposited amount has been deferred. The high line, the red one, shows the 
            accumulation under a tax deferred regime with employer matching."),
          p("The most interesting slider to manipulate are the rate of return. Set the Marginal Tax Rate to your marginal tax rate,
            set the income forgone to something reasonable, and the fiddle with the rate of return. Compare 2% (bond) to 8% 
            (market performance) to 12% (risky equities) performance. Note the spectacular effects of tax deferral and employer
            matching. ")
     ),
     mainPanel(
          plotOutput(outputId = 'lineChart')
     )
))