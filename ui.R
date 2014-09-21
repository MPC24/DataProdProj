library(googleVis)

shinyUI(fluidPage(
    titlePanel("Now Everyone Can Be Hans Rosling...sort of"),
    fluidRow(column(2,
                    
        h3("Select Region"),
        selectInput('region', label = 'Region', choices = r)
            
            ),
            
            column(4,
               h4("Size of bubbles and map shading are relative to the GDP per capita in USD"),
               htmlOutput(("chart"))
            ),
            column(2,
               sliderInput("year", label = "Year", min = min(WorldBank$year),
                           max = max(WorldBank$year), 
                           value = min(WorldBank$year), 
                           format = "####",
                           animate = TRUE)
               )
       
    ))
)