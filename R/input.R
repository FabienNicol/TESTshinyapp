#' @importFrom lubridate year
#' @importFrom dplyr select distinct
#' @importFrom magrittr %>%

current_year <- function(x) {lubridate::year(x)}
input_data <- function(data) {data}
input_model <- function(data) {dplyr::select(data, model_p) %>% dplyr::distinct() %>% unlist()}
input_year <- function(data) {dplyr::select(data, year_p) %>% dplyr::distinct() %>% unlist()}
