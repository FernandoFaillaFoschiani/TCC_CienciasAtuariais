
# Criando Pasta Base caso ela não exista ----------------------------------

if (!file.exists("bases")) {
  dir.create("bases")
}
# Fazendo Dowload das bases de Mortalidade --------------------------------

if (!file.exists("bases/mortalidade")) {
  dir.create("bases/mortalidade")
}

anos_mor <- seq(2004,2009,1)

  for (i in c(1:6)) {
    url <- paste('https://dadosabertos.ans.gov.br/FTP/Base_de_dados/Microdados/dados_dbc/beneficiarios/mortalidade_por_operadora/tb_mm_',anos[i],'.dbc',sep = "")
    filename <- paste('bases/mortalidade/tb_mm_',anos_mor[i],'.dbc',sep = "")
    tryCatch(
      {
        download.file(url, filename)
      },
      error = function(e) {
        message(sprintf("Falha ao baixar arquivo %s. Erro: %s", filename, e$message))
      }
    )
  }



# Fazendo Dowload das bases de Municipio ----------------------------------

if (!file.exists("bases/municipios")) {
  dir.create("bases/municipios", recursive = TRUE)
}

anos_mun <- seq(2000,2023,1)
tri_mun <- c("01","02",'03','04','05','06','07','08','09','10','11','12')

for (i in c(1:23)) {
  for (j in c(1:4)) {
    url <- paste('https://dadosabertos.ans.gov.br/FTP/Base_de_dados/Microdados/dados_dbc/beneficiarios/municipios/tb_bb_',anos_mun[i],'-',tri_mun[j],'.dbc',sep = "")
    filename <- paste('bases/municipios/tb_bb_',anos_mun[i],'-',tri_mun[j],'.dbc',sep = "")
    tryCatch(
      {
        download.file(url, filename)
      },
      error = function(e) {
        message(sprintf("Falha ao baixar arquivo %s. Erro: %s", filename, e$message))
      }
    )
  }
}



# Download Operadoras -----------------------------------------------------

if (!file.exists("bases/operadoras")) {
  dir.create("bases/operadoras", recursive = TRUE)
}


for (i in c(1:23)) {
  for (j in c(1:12)) {
    url <- paste('https://dadosabertos.ans.gov.br/FTP/Base_de_dados/Microdados/dados_dbc/beneficiarios/operadoras/tb_cc_',anos_mun[i],'-',tri_mun[j],'.dbc',sep = "")
    filename <- paste('bases/operadoras/tb_cc_',anos_mun[i],'-',tri_mun[j],'.dbc',sep = "")
    tryCatch(
      {
        download.file(url, filename)
      },
      error = function(e) {
        message(sprintf("Falha ao baixar arquivo %s. Erro: %s", filename, e$message))
      }
    )
  }
}


# Download Taxas de Cobertura ---------------------------------------------

if (!file.exists("bases/tx_cobertura")) {
  dir.create("bases/tx_cobertura", recursive = TRUE)
}


for (i in c(1:23)) {
  for (j in c(1:12)) {
    url <- paste('https://dadosabertos.ans.gov.br/FTP/Base_de_dados/Microdados/dados_dbc/beneficiarios/taxa_cobertura/tb_tx_',anos_mun[i],'-',tri_mun[j],'.dbc',sep = "")
    filename <- paste('bases/tx_cobertura/tb_tx_',anos_mun[i],'-',tri_mun[j],'.dbc',sep = "")
    tryCatch(
      {
        download.file(url, filename)
      },
      error = function(e) {
        message(sprintf("Falha ao baixar arquivo %s. Erro: %s", filename, e$message))
      }
    )
  }
}



# Download uf_regiao_metropolitana ----------------------------------------

if (!file.exists("bases/uf_regiao_metropolitana_e_capital")) {
  dir.create("bases/uf_regiao_metropolitana_e_capital", recursive = TRUE)
}


for (i in c(1:23)) {
  for (j in c(1:12)) {
    url <- paste('https://dadosabertos.ans.gov.br/FTP/Base_de_dados/Microdados/dados_dbc/beneficiarios/uf_regiao_metropolitana_e_capital/tb_br_',anos_mun[i],'-',tri_mun[j],'.dbc',sep = "")
    filename <- paste('bases/uf_regiao_metropolitana_e_capital/tb_br_',anos_mun[i],'-',tri_mun[j],'.dbc',sep = "")
    tryCatch(
      {
        download.file(url, filename)
      },
      error = function(e) {
        message(sprintf("Falha ao baixar arquivo %s. Erro: %s", filename, e$message))
      }
    )
  }
}
