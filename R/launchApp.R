#' launches the TESTshinyapp app
#'
#' Display a shiny user interface
#'
#' @export launchApp
#' @importFrom shiny shinyApp
#'
#' @return shiny application object
#'
# @example \dontrun {launchApp()}

launchApp <- function() {

  shiny::shinyApp(ui = ui, server = server)

}
