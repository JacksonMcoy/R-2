# activity_07_01: using tabsets

library(shiny)


# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Make a line graph"),
  
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("obs", 
                "Number of observations:", 
                min = 1949,
                max = 1959, 
                value = 1949),
      downloadButton("downloadPNG", "Download as a PNG file")

  ),
  
  
  mainPanel(
        
     plotOutput("Passengers")
           
  )
))

# for more information:
# http://rstudio.github.io/shiny/tutorial/#tabsets