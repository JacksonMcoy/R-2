
library(shiny)
library(ggplot2)
library(plyr)

Air <- read.csv("AirPassengers.csv", sep = ",", header = TRUE)


shinyServer(function(input,output){
  
  output$Passengers <- renderPlot({
    p  <- ggplot(Air) +
            geom_line(aes(x = time, y = AirPassengers)) +
      xlim(input$obs,1960)
            

    print(p )
    
  })
  

    
  
  output$downloadPNG <- downloadHandler(
    filename = "Yourfile.png",
    content = function(file) { # work around as the downloadHandler doesn't work with ggsave yet. (shiny 0.7)
      png(file)
      p  <- ggplot(Air) +
        geom_line(aes(x = time, y = AirPassengers)) +
        xlim(input$obs,1960)
      print(p)
      dev.off()
    }
  )
  
  
}

  
)