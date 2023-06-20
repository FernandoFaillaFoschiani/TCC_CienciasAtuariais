
# Importando pacotes ------------------------------------------------------

if (!require(pacman)) {
  install.packages("pacman")
}

library(oce)
library(tidyverse)
library(pacman)
library(read.dbc)
library(stringr)
library(tidyr)
pacman::p_load(tidyverse, read.dbc,purrr)

# Importando Bases --------------------------------------------------------


# importando bases com informações de beneficiarios por uf

ANO_INICIAL <- 2001
ANO_FINAL <- 2021
INTERVALO_ANOS <- c(ANO_INICIAL:ANO_FINAL)
INTERVALO_TRIMESTRE <- c('03','06','09','12')

tb_br <- purrr::cross2(INTERVALO_ANOS, INTERVALO_TRIMESTRE) %>% 
  purrr::map_chr(function(x) paste("bases/uf_regiao_metropolitana_e_capital/tb_br_", x[1], "-", x[2], ".dbc", sep = "")) %>% 
  purrr::map(function(file){
    if(file.exists(file)){
      df <- read.dbc(file)
      df$fileName <- file
      return(df)
    } else {
      message(paste("O arquivo", file, "não existe ou não pode ser acessado."))
      return(NULL)
    }
  }) %>% 
  dplyr::bind_rows() %>% 
  tibble::tibble()



# Importando bases com informação de taxa de cobertura

tb_tx <- INTERVALO_ANOS %>% 
  purrr::map_chr(function(x) paste("bases/tx_cobertura/tb_tx_", x, "-12", ".dbc", sep = "")) %>% 
  purrr::map(function(file){
    if(file.exists(file)){
      df <- read.dbc(file)
      df$fileName <- file
      return(df)
    } else {
      message(paste("O arquivo", file, "não existe ou não pode ser acessado."))
      return(NULL)
    }
  }) %>% 
  dplyr::bind_rows() %>% 
  tibble::tibble()


## Importando base de despesas

tb_rc <- INTERVALO_ANOS %>% 
  purrr::map_chr(function(x) paste("bases/contraprestacao_despesas/tb_rc_", x, ".dbc", sep = "")) %>% 
  purrr::map(function(file){
    if(file.exists(file)){
      df <- read.dbc(file)
      df$fileName <- file
      return(df)
    } else {
      message(paste("O arquivo", file, "não existe ou não pode ser acessado."))
      return(NULL)
    }
  }) %>% 
  dplyr::bind_rows() %>% 
  tibble::tibble()


# Importando bases ressarcimento  ao SUS ----------------------------------

tb_res <- c(2011,2021) %>% 
  purrr::map_chr(function(x) paste("bases/sus/tb_res_", x, ".dbc", sep = "")) %>% 
  purrr::map(function(file){
    if(file.exists(file)){
      df <- read.dbc(file)
      df$fileName <- file
      return(df)
    } else {
      message(paste("O arquivo", file, "não existe ou não pode ser acessado."))
      return(NULL)
    }
  }) %>% 
  dplyr::bind_rows() %>% 
  tibble::tibble()

# Tabela CID



lines <- readLines('bases/CNV/cid10cap.cnv', encoding = 'latin1')
lines <- lines[-1]

