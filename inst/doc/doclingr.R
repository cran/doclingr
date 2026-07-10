## ----include = FALSE----------------------------------------------------------
# Code in this vignette talks to the Docling Python backend and downloads
# deep-learning models on first use, so chunks are shown but not evaluated at
# build time. Run them in an interactive session after install_docling().
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## -----------------------------------------------------------------------------
# library(doclingr)
# 
# install_docling()      # creates an "r-docling" Python environment
# # ...restart R...
# docling_available()    # TRUE once the backend is ready

## -----------------------------------------------------------------------------
# doc <- docling_convert("https://arxiv.org/pdf/2408.09869")
# doc
# #> <docling_document>
# #> source: https://arxiv.org/pdf/2408.09869
# #> pages: 9
# #> tables: 5
# #> figures: 3

## -----------------------------------------------------------------------------
# doc <- docling_convert(
#   "report.pdf",
#   ocr = FALSE,           # skip OCR for born-digital PDFs
#   table_mode = "fast",   # "accurate" (default) or "fast"
#   device = "mps"         # "auto", "cpu", "cuda", "mps"
# )
# 
# # Convert many sources in one batch
# docs <- docling_convert(c("a.pdf", "b.docx", "c.html"))

## -----------------------------------------------------------------------------
# as_markdown(doc)   # layout-aware Markdown
# as_text(doc)       # plain text
# as_html(doc)       # HTML
# as_json(doc)       # structured DoclingDocument as a nested R list
# as_doctags(doc)    # Docling's DocTags representation

## -----------------------------------------------------------------------------
# tables <- docling_tables(doc)
# length(tables)
# tables[[1]]
# #> # A tibble: 12 x 4
# #>    Method     Recall Precision  F1
# #>    <chr>       <chr>     <chr> <chr>
# #>  1 Baseline    0.81      0.78  0.79
# #>  ...

## -----------------------------------------------------------------------------
# doc <- docling_convert("paper.pdf", images = TRUE)
# figs <- docling_figures(doc, image_dir = "figures")
# figs
# #> # A tibble: 3 x 4
# #>   figure_id caption                 page image_path
# #>       <int> <chr>                  <int> <chr>
# #> 1         1 "Figure 1: pipeline ..."   2 figures/figure-001.png
# #> ...

## -----------------------------------------------------------------------------
# chunks <- docling_chunk(
#   doc,
#   tokenizer = "BAAI/bge-small-en-v1.5",
#   max_tokens = 512
# )
# chunks
# #> # A tibble: 84 x 7
# #>    chunk_id text         raw_text     n_chars headings   pages   n_doc_items
# #>       <int> <chr>        <chr>          <int> <list>     <list>        <int>
# #>  1        1 "Docling: ..." "Docling..."     412 <chr [2]>  <int [1]>         3
# #>  ...

## -----------------------------------------------------------------------------
# embed_api <- function(texts) {
#   # Call your embedding endpoint; return a matrix with one row per text.
#   # e.g. httr2 -> a list of vectors, or a matrix.
# }
# 
# corpus <- doc |>
#   docling_chunk(tokenizer = "BAAI/bge-small-en-v1.5", max_tokens = 512) |>
#   docling_embed(embed_api, batch_size = 64)
# 
# corpus
# #> # ... your chunks plus `embedding` (list-column) and `n_dim`

