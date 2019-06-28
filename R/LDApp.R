#' @title LD visualization application
#'
#' @description Runs an interactive visualizer for an LD object
#'
#' @param ldData An LD data frame.
#'
#' @import shiny
#' @importFrom plotly plot_ly
#' @importFrom plotly renderPlotly
#' @importFRom plotly plotlyOutput
#'
#' @export
linkageDiseqApp <- function(ldData) {

    ui <- shiny::shinyUI(shiny::fluidPage(
        shiny::h4("rTASSEL - Linkage Disequilibrium"),
        shiny::sidebarLayout(
            shiny::sidebarPanel(
                shiny::selectInput(
                    inputId = "matVal",
                    label = "Value type",
                    choices = c(
                        "R Squared" = "R^2",
                        "P-Value" = "pDiseq",
                        "D Prime" = "DPrime"
                    )
                )
            ),
            shiny::mainPanel(
                plotly::plotlyOutput("distPlot"),
                shiny::sliderInput(
                    inputId = "xMov",
                    label = "Move Window (x axis)",
                    min = 1,
                    max = 100,
                    value = c(1, 25)
                ),
                shiny::sliderInput(
                    inputId = "yMov",
                    label = "Move Window (y axis)",
                    min = 1,
                    max = 100,
                    value = c(1, 25)
                )
            )
        )
    ))

    server <- function(input, output) {
        output$distPlot <- plotly::renderPlotly({
            ## Get LD matrix
            ldOut <- ldDFToMat(
                ldData,
                matVal = input$matVal
            )

            ## Sub LD matrix
            # ldOutSub <- ldOut[input$yMov[1]:input$yMov[2], input$xMov[1]:input$xMov[2]]
            # shiny::verbatimTextOutput()
            ldOutSub <- ldOut[1:25, 1:25]

            ## Plotly metadata and parameters
            ax <- list(
                title = "",
                zeroline = FALSE,
                showline = FALSE,
                showticklabels = FALSE,
                showgrid = TRUE
            )

            ## The Plotly plot
            plotly::plot_ly(
                x = colnames(ldOutSub),
                y = rownames(ldOutSub),
                z = ldOutSub,
                type = "heatmap"
            ) %>% plotly::layout(xaxis = ax, yaxis = ax)
        })

    }

    shiny::shinyApp(ui, server)
}


## LD dataframe to matrix converter - not exported (house keeping)
ldDFToMat <- function(ldDF,
                      matVal = c("R^2", "pDiseq", "DPrime"),
                      window = 200,
                      subSet = NULL) {

    matVal <- match.arg(matVal)

    # Add new coordinates (combine chrom. and chrom. coordinate)
    ldSUB <- ldDF[, c(1:3, 7:9, 13:17)]
    ldSUB$coord1 <- paste0(ldSUB$Locus1, "_", ldSUB$Position1)
    ldSUB$coord2 <- paste0(ldSUB$Locus2, "_", ldSUB$Position2)

    # Sub matrix check
    if (!is.null(subSet)) {
        matEx <- ldSUB[1:subSet, c("coord1", "coord2", matVal)]
    } else {
        matEx <- ldSUB[, c("coord1", "coord2", matVal)]
    }

    # Subset matrix IDs
    matIDs <- unique(c(matEx$coord1, matEx$coord2))
    matIDs <- stringr::str_sort(matIDs, numeric = TRUE)

    # Create NA matrix (for population)
    mat <- matrix(data = NA, nrow = length(matIDs), ncol = length(matIDs))
    colnames(mat) <- matIDs
    rownames(mat) <- matIDs

    # Populate NA matrix with existing TASSEL calculations
    matExMat <- as.matrix(matEx)
    mat[matExMat[, 1:2]] <- as.numeric(matExMat[, 3])

    # Sub Matrix
    matSub <- mat[1:window, 1:window]

    # Rotate and visualze
    matCorrect <- t(apply(matSub, 2, rev))

    # Return
    return(matCorrect)
}











