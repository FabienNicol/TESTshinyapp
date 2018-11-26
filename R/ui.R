#' @importFrom shinydashboard dashboardSidebar sidebarMenu menuItem dashboardBody dashboardPage dashboardHeader infoBoxOutput tabItems tabItem tabBox box
#' @importFrom shiny includeCSS fluidRow column selectInput hr h3 h6 br radioButtons actionButton icon uiOutput numericInput dateRangeInput helpText verbatimTextOutput textOutput plotOutput tabPanel
#' @importFrom lubridate ymd
#' @importFrom DT dataTableOutput

## UI -----------------------------------------------------------------------------------
## |__sidebar ---------------------------------------------------------------------------
sidebar <- shinydashboard::dashboardSidebar(

  shiny::includeCSS(system.file("shinyapp", "www", "style.css", package = "TESTshinyapp")),
  width = 400,
  shinydashboard::sidebarMenu(id = "sidebar_menu",
                              shiny::fluidRow(
                                shiny::column(width = 12,
                                              shiny::selectInput("Input1", "Input1:",
                                                                 # choices = model_ls,
                                                                 # error when building the package
                                                                 # ERROR: lazy loading failed for package 'TESTshinyapp'
                                                                 choices = model_ls,
                                                                 multiple = F, selectize = F)
                                )
                              ),
                              shiny::fluidRow(
                                shiny::column(width = 12,
                                              shiny::actionButton("ActionB", "ActionB:")
                                )

                              ),
                              shiny::hr(),
                              shinydashboard::menuItem("Dashboard", tabName = "dashboard", icon = shiny::icon("dashboard")),
                              shiny::hr(),
                              shiny::uiOutput("menuItem_specific_ui")
  )
)

## |__body ------------------------------------------------------------------------------
body <- shinydashboard::dashboardBody(
  shinydashboard::tabItems(
    ## |_____dashboard tab --------------------------------------------------------------
    shinydashboard::tabItem(
      "dashboard",
      shinydashboard::tabBox(
        id = "tabs",
        width = 12,
        shiny::tabPanel(
          title = "Volume",
          value = "vol",
          shiny::fluidRow(
            shinydashboard::box(
                width=12,
                shiny::column(
                  4,
                  shiny::h3("out1"),
                  shiny::verbatimTextOutput("out1")
                ),
                shiny::column(
                  4,
                  shiny::h3("out2"),
                  shiny::verbatimTextOutput("out2")
                ),
                shiny::column(
                  4,
                  shiny::h3("out3"),
                  shiny::verbatimTextOutput("out3")
                )
            )
          )
        )
      )
    )
  )
)


## |__page ------------------------------------------------------------------
ui <- shinydashboard::dashboardPage(
  skin = "purple",
  shinydashboard::dashboardHeader(title = "TESTshinyapp Dashboard",
                                  titleWidth = 400),
  sidebar, body
)
