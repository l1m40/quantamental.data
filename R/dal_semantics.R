# ────────────────────────────────────────────────
# R/dal_semantics.R
# Description: Semantic readers (public contract)
# ────────────────────────────────────────────────
#
#
#
#
#
#









#' Read b3 indexes
#'
#' @return list of tibble
#' @export
read_b3_index <- function() { jsonlite::read_json(file.path(get_data_dimensions_path(),"b3_index.json"),simplifyDataFrame = TRUE) }

#' Read asset ontology
#'
#' @return list of tibble
#' @export
read_ontology <- function() { jsonlite::read_json(file.path(get_data_dimensions_path(),"ontology.json"),simplifyDataFrame = TRUE) }


fundamentals_mart_path <- function() { file.path(get_data_mart_path(),"fundamentals.rds") }
#' Read asset fundamentals
#'
#' @param asset_input Ticker
# @param start_date,end_date Date boundaries (optional)
# @param frequency "annual" | "quarterly"
#'
#' @return A tibble with flat, tabular fundamentals
#' @export
read_asset_fundamentals <- function(
    asset_input
    # start_date = NULL,
    # end_date = NULL,
    # frequency = c("annual", "quarterly")
) {
  # frequency <- match.arg(frequency)

  # 1. Resolve data root (external lake → snapshot)
  # 2. Read Parquet partitions with arrow
  # 3. Filter early (pushdown)
  # 4. Return a flat tibble

  path=fundamentals_mart_path()
  return(readRDS(path) |> dplyr::filter(Company==toupper(asset_input)))
}





quantamentals_mart_path <- function() { NA }
#' Read quantamentals
#'
#' @param asset_input Ticker
#'
#' @return A tibble with flat, tabular quantamentals variables
#' @export
read_quantamentals <- function(asset_input) {
  return(NA)
}



