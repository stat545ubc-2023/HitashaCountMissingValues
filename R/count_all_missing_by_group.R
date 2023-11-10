#' @title Count missing values for all columns by group
#'
#' @description Given a data frame `data` and a
#' column `group`, `count_all_missing_by_group()` creates
#' a new data frame with one row per level of `group`.
#' The first column of the output data frame
#' contains the levels of `group`, and the rest of
#' the columns contain the number of missing values for
#' all columns in `data` except `group`.
#'
#' @details This function is
#' a wrapper around the `group_by()` and
#' `summarize()` functions in the `dplyr` package.
#'
#' @param data Data in data.frame or tibble format
#' @param group_col Column in `data` to group by
#' @param .groups (OPTIONAL) Controls whether the
#' output data frame is grouped. By default,
#' drops all levels of grouping (`"drop"`). Specify
#' `"keep"` to keep the output data frame grouped by
#' `group`. See `summarize()` documentation in
#' `dplyr` for a full list of options.
#'
#' @return A data frame or tibble with the
#' levels of `group`, and the  number of NAs within
#' each level of `group` for all columns in
#' `data` except `group`.
#'
#' @examples
#' # This code would be checking the missing values in the airquality dataset
#' # while grouping by month:
#' count_all_missing_by_group(airquality, Month)
#'
#' # This code provides the same output as the last one but is another way to
#' # pipe the dataset into the function:
#' airquality |> count_all_missing_by_group(Month)
#'
#' # This code lets us keep the output grouped by the grouping column:
#' count_all_missing_by_group(airquality, Month, .groups = "keep")
#'
#' @export

count_all_missing_by_group <- function(data, group_col, .groups = "drop") {

  if(!is.null(.groups)) {
    if(!(.groups %in% c("drop_last", "drop",
                        "keep", "rowwise"))) {
      stop(".groups needs to be one of NULL,
         \"drop_last\", \"drop\", \"keep\",
         and \"rowwise\".")
    }
  }

  data |> dplyr::group_by({{ group_col }}) |>
    dplyr::summarize(dplyr::across(dplyr::everything(), ~sum(is.na(.x))),
              .groups = .groups)
}
