# Load required packages
library(shiny)
library(shinydashboard)
library(DT)
library(tidyverse)

# Read the example dataset
data <- read_csv("Datasets/Shiny_repTable.csv.gz")

# Define UI
ui <- dashboardPage(
  dashboardHeader(title = "AVrC version 1"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Filter Data", tabName = "filter", icon = icon("filter")),
      menuItem("About", tabName = "about", icon = icon("info-circle")),
      menuItem("Downloads", tabName = "downloads", icon = icon("download"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "filter",
              fluidRow(
                box(
                  title = "Filter vOTUs",
                  width = 3,
                  checkboxGroupInput("checkv_quality", "CheckV Quality:",
                                     c("Not-determined", "Low-quality", "Medium-quality", "High-quality"),
                                     selected = unique(data$checkv_quality)),
                  checkboxGroupInput("plasmid", "Plasmid:", c("TRUE", "FALSE"), selected = "FALSE"),
                  selectizeInput("pred_lifestyle", "Predicted Lifestyle:", choices = unique(data$pred_lifestyle),
                                 selected = c("temperate", "virulent", "uncertain temperate", "uncertain virulent"),
                                 multiple = TRUE),
                  selectizeInput("host_phylum", "Host Phylum:", choices = unique(data$Host_Phylum), selected = c("Bacteroidota", "Pseudomonadota", "Actinobacteriota"), multiple = TRUE),
                  selectizeInput("phylum", "Viral Phylum:", choices = unique(data$Phylum), selected = c("Uroviricota"), multiple = TRUE),
                  actionButton("search_button", "Search")
                ),
                box(
                  title = "vOTU representative sequences",
                  width = 9,
                  DT::dataTableOutput("data_table"),
                  downloadButton("download_meta", "Download metadata")
                )
              )
      ),      
      tabItem(tabName = "about",
                      includeHTML("Interface/about.html")
      ),      
      tabItem(tabName = "downloads",
              includeHTML("Interface/downloads.html")
      )
    )
  )
)

# Define server logic
server <- function(input, output) {
  filtered_data <- reactiveVal(data)
  
  observeEvent(input$search_button, {
    filtered_data(data %>%
                    dplyr::filter(checkv_quality %in% input$checkv_quality,
                                  Plasmid %in% input$plasmid,
                                  Host_Phylum %in% input$host_phylum,
                                  Phylum %in% input$phylum,
                                  pred_lifestyle %in% input$pred_lifestyle))
  })
  
  output$data_table <- DT::renderDataTable({
    vizual <- filtered_data() %>% select(vOTU_ID, checkv_quality, Plasmid, pred_lifestyle, Host_Phylum, Phylum)
    DT::datatable(vizual, options = list(pageLength = 10))
  })
  
  output$download_meta <- downloadHandler(
    filename = function() {
      paste("filtered_data_", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(filtered_data(), file, row.names = FALSE)
    }
  )
}

# Run the app
shinyApp(ui = ui, server = server)