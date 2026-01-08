#' Read asset metadata
#'
#' @return tibble
#' @export
read_asset_metadata <- function() {
  root <- get_data_root_path()
  meta_dir <- file.path(root, "metadata")

  files <- list.files(meta_dir, pattern = "\\.json$", full.names = TRUE)

  purrr::map_dfr(files, jsonlite::fromJSON, simplifyVector = TRUE)
}


#' Read b3 indexes
#'
#' @return list of tibble
#' @export
get_b3_index <- function() { jsonlite::read_json(file.path(get_data_output_path(),"b3_index.json"),simplifyDataFrame = TRUE) }

#' Read asset ontology
#'
#' @return list of tibble
#' @export
get_ontology <- function() { jsonlite::read_json(file.path(get_data_output_path(),"ontology.json"),simplifyDataFrame = TRUE) }



#' Read external dal
#'
#' @return string
#' @export
test_external_dal <- function() { "OK" }




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
  return(readRDS(path) |> dplyr::filter(Company==asset_input))
}





