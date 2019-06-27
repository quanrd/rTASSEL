#--------------------------------------------------------------------
# Script Name:   ldApp/server.R
# Description:   Server for LD visualization
# Author:        Brandon Monier
# Created:       2019-06-27 at 19:18:33
# Last Modified: 2019-06-27 at 19:19:38
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Detailed Purpose:
#    The main purpose of this Rscript is to house the Shiny server
#    function for LD visualization
#--------------------------------------------------------------------

# LD Server (not exported)

#' @import shiny
server <- function(input, output) {
    output$distPlot <- renderPlot({
        hist(rnorm(input$obs), col = 'darkgray', border = 'white')
    })
}
