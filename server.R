library(shiny)
library(googleVis)
library(dplyr)

shinyServer(function(input, output){
    
    bubbleInput <- reactive({
        
        wb <- WorldBank %.%
            filter(region %in% input$region, year %in% input$year) 
        
    })
    
    geoInput <- reactive({
        
        wb <- WorldBank %.%
            filter(year %in% input$year)
        
    })
     
    output$chart <- renderGvis({
        
        bubC <-gvisBubbleChart(bubbleInput(),
                        idvar="country",
                        xvar="life.expectancy",
                        yvar="fertility.rate",
                        colorvar="income",
                        sizevar="GDP.per.capita.Current.USD",
                        options=list(width=700, height=700,
                                     backgroundColor="light grey",
                                     bubble="{textStyle:{color: 'none'}}",
                                     hAxis="{title: 'Life Expectancy',
                                        titleTextStyle:{color:'black', fontName:'Arial', fontSize:'24'}}",
                                     vAxis="{title: 'Births/Woman',
                                        titleTextStyle:{color:'black', fontName:'Arial', fontSize:'24'}}"
                        )
                    )
    
        geoC <- gvisGeoChart(geoInput(), locationvar = "iso2c", colorvar = "GDP.per.capita.Current.USD",
                             hovervar = "life.expectancy", 
                             options = list(width=600,height=700)
                )
        gvisMerge(bubC,geoC, horizontal=TRUE)
    })
    
})
