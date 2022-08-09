library(rvest)
library(dplyr)
library(xml2)

content <- read_html("https://healthecareers.com/acog/search-jobs/?catid=2445&locationtext=Maryland%2C+USA&remote=false&ps=100")


named_char_to_df <- function(vec) {
  df <- data.frame(vec) %>% t() %>% data.frame()  
  rownames(df) <- NULL
  return(df)
}


jobs <- content %>%
  html_nodes(xpath = '//*[@id="job-results-card"]') %>%
  html_nodes(css = 'a') %>%
  xml_attrs() %>%
  lapply(named_char_to_df) %>%
  do.call(what=bind_rows) %>%
  dplyr::filter(!is.na(aria.label)) %>%
  select(href, aria.label, data.location) %>%
  rename(link=href, description=aria.label, location=data.location) %>%
  dplyr::filter(!grepl("locum", tolower(description), fixed=TRUE)) %>%
  dplyr::filter(!grepl("tenens", tolower(description), fixed=TRUE)) %>%
  mutate(description = gsub("Job: ", "", description))

