# TESTshinyapp

The package embed a Shiny app together with a dataset. 

The embedded dataset is used to populate the ui (field Input1) and the dataset (in data/data_test.rda, dataframe with 3 fields {year_p, model_p, volume_p}) load in a lazy manner when the package is loaded (description file parameter LazyData set at true). 

This data stays identical the whole session, so I don't want to make a reactive function for it. 
**The issue** is that if I'm using the dataset to populate the ui, the package won't build and will generate an error when building

The alternatives I considered are:
1. to have a reactive function (model_reactive()) and an observeEvent/updateSelectInput defined in server.R, but this really seems inefficient. BTW, is there a way to have the reactive function to compute only once ?
2. place the code manipulating the dataset in global.R in order the data is available for server.R and ui.R
3. Maybe this [post](https://stackoverflow.com/questions/52621167/include-shiny-app-in-r-package-transfer-an-input-parameter) explains how to do with the environment, but I didn't get ()

### ui.R
```r
shiny::selectInput("Input1", "Input1:", choices = model_ls, multiple = F, selectize = F)
                   # error when building the package
                   # ERROR: lazy loading failed for package 'TESTshinyapp'
```
### server.R
```r
model_ls <- input_model(dat)
```

### input.R
```r
input_model <- function(data) {dplyr::select(data, model_p) %>% dplyr::distinct() %>% unlist()}
```



