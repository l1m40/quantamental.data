# Developer helper: document + load quantamental.data

if (!requireNamespace("devtools", quietly = TRUE)) {
  stop("devtools is required for development")
}

devtools::document()
# devtools::load_all()



if(F){

  head(get_b3_index()$IBOV)

  test_external_dal()

  # devtools::install("quantamental.data")


}
