# ────────────────────────────────────────────────
# R/dal_utils.R
# Description: Common functions and structural helpers
# ────────────────────────────────────────────────
#
#
#
#
#
#






#' Check if quantamental data is available
#'
#' @return logical
#' @export
has_data <- function() {
  root <- get_data_root_path()
  nzchar(root) && dir.exists(root)
}


#' Check if quantamental data is a snapshot
#'
#' @return logical
#' @export
snapshot_check <- function() {
  if(get_data_root_path()==get_data_snapshot_path()) {
    warning("Using a package data snapshot as DATA_ROOT_PATH")
    return(TRUE)
  }
  else
    message("Using environment variable DURIN_DATA to reach the data lake")
  return(FALSE)
}
