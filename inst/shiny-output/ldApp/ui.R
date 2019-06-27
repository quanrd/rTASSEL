#--------------------------------------------------------------------
# Script Name:   ldApp/uo.R
# Description:   User interface for LD visualization
# Author:        Brandon Monier
# Created:       2019-06-27 at 19:19:38
# Last Modified: 2019-06-27 at 19:19:38
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Detailed Purpose:
#    The main purpose of this Rscript is to house the Shiny user
#    interface function for LD visualization
#--------------------------------------------------------------------

# LD User interface (not exported)

#' @import shiny
ui <- shiny::shinyUI(fluidPage(
    sidebarLayout(
        sidebarPanel(
            sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)
        ),
        mainPanel(plotOutput("distPlot"))
    )
))
