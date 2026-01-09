# Developer helper: document + load quantamental.data

if (!requireNamespace("devtools", quietly = TRUE)) {
  stop("devtools is required for development")
}

devtools::document()
# devtools::load_all()



if(F){

  # library(quantamental.data)
  snapshot_check()

  head(read_b3_index()$IBOV)

  head(read_asset_fundamentals("petr4"))





  # Sys.unsetenv("DURIN_DATA")
  get_data_root_path()

  # test to error
  Sys.setenv(DURIN_DATA = "/tmp/nonexistent")
  head(get_b3_index()$IBOV) # this will go to error


}
