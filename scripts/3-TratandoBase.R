
# Importando pacotes ------------------------------------------------------

if (!require(pacman)) {
  install.packages("pacman")
}

library(pacman)

pacman::p_load(tidyverse, read.dbc,purrr)

install.packages("tidyverse", type = "binary")

# Importando Bases --------------------------------------------------------


# importando bases com informações de beneficiarios por uf

ANO_INICIAL <- 2020
ANO_FINAL <- 2022
INTERVALO_ANOS <- c(ANO_INICIAL:ANO_FINAL)

tb_br <- INTERVALO_ANOS %>% 
  purrr::map_chr(function(x) paste("bases/uf_regiao_metropolitana_e_capital/tb_br_",x,"-03.dbc",sep = "")) %>% 
  map_dfr(function(file){
    df <- read.dbc(file)
    df$fileName <- file
    return(df)
  }
  ) %>% 
  tibble::tibble()


# Importando bases com informação de taxa de cobertura


