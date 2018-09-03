library(shiny)
library(ggplot2)
library(dplyr)

diamonds <- diamonds %>% 
  select(1:4,7)

shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        # select 
        diamonds <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
        # build  regression model
        fit <- lm( price~carat, diamonds)
        pred <- predict(fit, newdata = data.frame(carat = input$car,
                                                  cut = input$cut,
                                                  color = input$col,
                                                  clarity = input$clar))
        
        plot <- ggplot(data=diamonds, aes(x=carat, y = price))+
            geom_point(aes(color = cut), alpha = 0.3)+
            geom_smooth(method = "lm")+
            geom_vline(xintercept = input$car, color = "red")+
            geom_hline(yintercept = pred, color = "black")
       plot
    })
    output$result <- renderText({
        diamonds <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
        fit <- lm( price~carat, diamonds)
        pred <- predict(fit, newdata = data.frame(carat = input$car,
                                                  cut = input$cut,
                                                  color = input$col,
                                                  clarity = input$clar))
        res <- paste(round(pred, digits = 2), "U$S")
        res
    })
  
})

