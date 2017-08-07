library(shiny)
library(data.table)
library(quantmod)
stocks <- na.omit(data.table(stockSymbols()))
shinyUI(fluidPage(
  # Application title
  titlePanel("Financial Stock Time series!"),
  # Sidebar with a slider input for the number of bins
  fluidRow(
    column(12,
      selectInput("Stocks",
                  "Stock Symbol:",
                  width='400px',
                  stocks$Symbol
                  ),
      tableOutput('table')
      )
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("StockPlot")
    )
  )
)