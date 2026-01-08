










get_data_snapshot_path <- function() { system.file("extdata", package = "quantamental.data") }
get_data_snapshot_check <- function() {
  if(get_data_root_path()==get_data_snapshot_path())
    warning("Using a package data snapshot as ROOT_DATA_PATH")
  else
    message("Using environment variable DURIN_DATA to reach the data lake")
}
#' Resolve quantamental data root
#'
#' Priority:
#' 1. DATA_ROOT environment variable
#' 2. Package snapshot in inst/extdata
#'
#' @return character path
#' @export
get_data_root_path <- function() {
  root <- Sys.getenv("DURIN_DATA", unset = NA_character_)
  if (!is.na(root) && nzchar(root)) {
    if (!dir.exists(root)) {
      stop("Environment variable is set but does not exist: ",root)
    }
    return(normalizePath(root, mustWork = TRUE))
  }
  # return the snapshot data lake
  get_data_snapshot_path()
}

# utils::packageVersion("quantamental.data")
#' Data marts path
#'
#' @return character path
#' @export
get_data_mart_path <- function() { file.path(get_data_root_path(),"mart") }

#' Output data path
#'
#' @return character path
#' @export
get_data_output_path <- function() { file.path(get_data_root_path(),"output") }


