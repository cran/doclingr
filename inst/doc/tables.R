## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# library(doclingr)
# 
# doc <- docling_convert("financials.pdf")
# tables <- docling_tables(doc)
# 
# length(tables)      # how many tables Docling found
# tables[[1]]         # the first table, as a tibble

## -----------------------------------------------------------------------------
# attr(tables[[1]], "page")

## -----------------------------------------------------------------------------
# doc_fast <- docling_convert("financials.pdf", table_mode = "fast")
# docling_tables(doc_fast)[[1]]

## -----------------------------------------------------------------------------
# library(dplyr)
# library(purrr)
# 
# all_tables <- docling_tables(doc) |>
#   imap(\(tbl, i) mutate(tbl, .table = i, .page = attr(tbl, "page"))) |>
#   list_rbind()
# 
# all_tables

## -----------------------------------------------------------------------------
# tables <- docling_tables(doc)
# iwalk(tables, \(tbl, i) readr::write_csv(tbl, sprintf("table-%02d.csv", i)))

