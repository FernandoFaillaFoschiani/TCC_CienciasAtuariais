

# Importando as bases caso a pasta bases nao exista -----------------------

if (!file.exists("bases/uf_regiao_metropolitana_e_capital")) {
  source('scripts/1-Importando_Bases.R')
}