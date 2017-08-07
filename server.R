library(shiny)
library(quantmod)
library(ggplot2)
library(plotly)
stocks_server <- na.omit(data.table(stockSymbols()))

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # table of the selected Stock
  output$table <- renderTable({
    stocks_server[Symbol == input$Stocks,]
  })
  # Expression that generates the financial stock selected from user interface.
  
  output$StockPlot <- renderPlot({
    Stock <- getSymbols(input$Stocks, src="yahoo")
  
    #g <- autoplot.zoo(get(Stock)) + ggtitle("Financial Stock time series of Selected stock")
    chartSeries(get(Stock),theme=chartTheme("white"))
  })
})