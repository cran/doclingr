## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# library(doclingr)
# 
# doc <- docling_convert("paper.pdf")
# 
# chunks <- docling_chunk(
#   doc,
#   tokenizer  = "BAAI/bge-small-en-v1.5",
#   max_tokens = 512
# )
# chunks

## -----------------------------------------------------------------------------
# embed_api <- function(texts) {
#   # POST `texts` to your endpoint and return a matrix: one row per text.
#   # e.g. with httr2:
#   resp <- httr2::request("https://api.example.com/v1/embeddings") |>
#     httr2::req_headers(Authorization = paste("Bearer", Sys.getenv("EMBED_KEY"))) |>
#     httr2::req_body_json(list(model = "bge-small", input = texts)) |>
#     httr2::req_perform()
#   do.call(rbind, lapply(httr2::resp_body_json(resp)$data, \(d) unlist(d$embedding)))
# }
# 
# corpus <- docling_embed(chunks, embed_api, batch_size = 64)
# corpus

## -----------------------------------------------------------------------------
# # Using a sentence-transformers model through reticulate
# st <- reticulate::import("sentence_transformers")
# model <- st$SentenceTransformer("BAAI/bge-small-en-v1.5")
# embed_local <- function(texts) model$encode(texts)
# 
# corpus <- docling_embed(chunks, embed_local, batch_size = 64)

## -----------------------------------------------------------------------------
# emb <- do.call(rbind, corpus$embedding)
# 
# cosine_top <- function(query, k = 5) {
#   q <- as.numeric(embed_api(query))
#   sims <- as.numeric(emb %*% q) /
#     (sqrt(rowSums(emb^2)) * sqrt(sum(q^2)))
#   corpus[order(sims, decreasing = TRUE)[seq_len(k)], c("text", "headings", "pages")]
# }
# 
# cosine_top("What datasets were used for evaluation?")

## -----------------------------------------------------------------------------
# docling_write_chunks(corpus, "corpus.parquet")
# # later (or from Python/DuckDB -- it is a plain Parquet file):
# corpus <- arrow::read_parquet("corpus.parquet")

## -----------------------------------------------------------------------------
# files <- list.files("docs", pattern = "[.](pdf|docx|html)$", full.names = TRUE)
# docs  <- docling_convert(files)
# 
# corpus <- purrr::imap(docs, \(d, src) {
#   docling_chunk(d, tokenizer = "BAAI/bge-small-en-v1.5", max_tokens = 512) |>
#     docling_embed(embed_api, batch_size = 64) |>
#     dplyr::mutate(source = src)
# }) |>
#   purrr::list_rbind()

