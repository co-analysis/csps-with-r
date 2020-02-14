library(haven)
data <- read_stata("data/csps_synth.dta")

# Calculate percent positive

b01_responses <- data %>%
  group_by(Organisation) %>%
  filter(!is.na(B01)) %>%
  summarise(n_responded = n()) %>%
  ungroup()

b01_positive <- data %>%
  count(Organisation, B01) %>%
  filter(B01 %in% c(4, 5)) %>%
  group_by(Organisation) %>%
  summarise(n_pos = sum(n))

b01_percent_positive <- left_join(
  b01_positive, b01_responses,
  by = "Organisation"
) %>%
  mutate(percent = round((n_pos/n_responded) * 100, 0))

# Calculate theme score

get_pp <- function(data, column) {

  responses <- data %>%
    group_by(Organisation) %>%
    filter(!is.na({{ column }})) %>%
    summarise(n_responded = n()) %>%
    ungroup()

  positive <- data %>%
    count(Organisation, {{ column }}) %>%
    filter({{ column }} %in% c(4, 5)) %>%
    group_by(Organisation) %>%
    summarise(n_pos = sum(n))

  percent_positive <- left_join(
    positive, responses,
    by = "Organisation"
  ) %>%
    mutate(percent = round((n_pos/n_responded) * 100, 0))

  return(percent_positive)

}

purrr::map(
  .x = vars(B01),
  .f = ~get_pp(data, .x)
)




# Group E03 to match E03_GRP
