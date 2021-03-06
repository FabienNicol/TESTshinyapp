#' @importFrom shiny renderPrint reactive


server <- function(input, output, session) {

  CurrentYear <- current_year(Sys.Date())

  dat <- list()
  dat <- input_data(data = data_test)
  model_ls <- input_model(dat)
  year_ls <- input_year(dat)


  # model_reactive <- shiny::reactive({input_model(dat)})

  # shiny::observeEvent(input$ActionB, {
  #   shiny::updateSelectInput(
  #     session, "Input1",
  #     choices = model_reactive()
  #   )
  # })
  #
  # print(model_ls)

  output$out1 <- shiny::renderPrint({ list("model_ls", model_ls) })
  output$out2 <- shiny::renderPrint({ list("year_ls", year_ls) })
  output$out3 <- shiny::renderPrint({ list("CurrentYear", CurrentYear) })

}
