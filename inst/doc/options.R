## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# library(doclingr)
# 
# install_docling()         # creates an "r-docling" virtualenv
# # ...restart R...
# docling_available()       # TRUE

## -----------------------------------------------------------------------------
# Sys.setenv(HF_HOME = "~/.cache/doclingr-models")

## -----------------------------------------------------------------------------
# doc <- docling_convert("born-digital.pdf", ocr = FALSE)

## -----------------------------------------------------------------------------
# # Best structure (default) -- complex, spanning, nested tables
# docling_convert("report.pdf", table_mode = "accurate")
# 
# # Quicker -- clean grids, large batches
# docling_convert("report.pdf", table_mode = "fast")

## -----------------------------------------------------------------------------
# docling_convert("report.pdf", device = "mps")               # Apple Silicon
# docling_convert("report.pdf", device = "cuda")              # NVIDIA GPU
# docling_convert("report.pdf", device = "cpu", num_threads = 8)

## -----------------------------------------------------------------------------
# doc  <- docling_convert("paper.pdf", images = TRUE, images_scale = 2)
# figs <- docling_figures(doc, image_dir = "figures")
# figs

## -----------------------------------------------------------------------------
# docs <- docling_convert(
#   c("a.pdf", "b.docx", "c.html"),
#   ocr        = FALSE,
#   table_mode = "fast"
# )
# 
# length(docs)
# docs[["a.pdf"]]

## -----------------------------------------------------------------------------
# docs <- docling_convert(
#   list.files("reports", pattern = "[.]pdf$", full.names = TRUE),
#   ocr        = FALSE,      # no scans
#   table_mode = "fast",     # clean grids
#   device     = "auto"
# )

