#!/bin/bash

# Cores para formatação
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Token de acesso embutido (token temporário)
TOKEN="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"

# Informações do repositório
REPO_OWNER="Pauloh2206"
REPO_NAME="PainelXHTTP"
BRANCH="main"

echo -e "${YELLOW}------------------------------------------------------------${NC}"
echo -e "${CYAN}(telegram: @sunmodls) :)${NC}"
echo -e "${CYAN}Tutorial em vídeo das instruções abaixo ⬇️ (Recomendado)${NC}"
echo -e "${CYAN}Tutorial: https://short-link.me/12goW${NC}"
echo -e "${YELLOW}------------------------------------------------------------${NC}"

sleep "5"
echo -e "${GREEN}Verificando token de acesso...${NC}"
sleep "2"

# Verifica se o token é válido
TOKEN_CHECK=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: token $TOKEN" "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME")

if [ "$TOKEN_CHECK" != "200" ]; then
  echo -e "${RED}Erro: Token inválido ou repositório não encontrado.${NC}"
  exit 1
fi

echo -e "${GREEN}Token válido! Iniciando a instalação do painel 3x-ui...${NC}"
sleep "3"

# Baixa e executa o script de instalação usando o token
echo -e "${GREEN}Baixando script de instalação...${NC}"
INSTALL_SCRIPT=$(curl -s -H "Authorization: token $TOKEN" "https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/$BRANCH/install.sh")

if [ -z "$INSTALL_SCRIPT" ]; then
  echo -e "${RED}Erro: Não foi possível baixar o script de instalação.${NC}"
  exit 1
fi

# Executa o script de instalação
echo -e "${GREEN}Executando instalação...${NC}"
echo "$INSTALL_SCRIPT" | bash

# Verifica se a instalação foi bem-sucedida
INSTALL_STATUS=$?

echo -e "${YELLOW}------------------------------------------------------------${NC}"
echo -e "${CYAN}Script e tutorial fornecido${NC}"
echo -e "${CYAN}Telegram: BY: @sunmodls${NC}"
echo -e "${RED}PÓS INSTALAÇÃO SEGUE COM O VÍDEO${NC}"
echo -e "${YELLOW}PEGA AS CREDENCIAIS DE ACESSO DA URL${NC}"
echo -e "${YELLOW}VOCÊ VERÁ NO VÍDEO${NC}"
echo -e "${YELLOW}------------------------------------------------------------${NC}"

# Revoga o token após uso bem-sucedido
if [ $INSTALL_STATUS -eq 0 ]; then
  echo -e "${GREEN}Instalação concluída com sucesso!${NC}"
  echo -e "${YELLOW}Revogando token após uso único...${NC}"
  
  # Revoga o token usando a API do GitHub
  REVOKE_RESULT=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE \
    -H "Authorization: token $TOKEN" \
    "https://api.github.com/applications/client_id/token" \
    -d "{\"access_token\":\"$TOKEN\"}")
  
  if [ "$REVOKE_RESULT" = "204" ]; then
    echo -e "${GREEN}Token revogado com sucesso. Este token não poderá mais ser utilizado.${NC}"
  else
    echo -e "${YELLOW}Aviso: Não foi possível revogar o token automaticamente.${NC}"
    echo -e "${YELLOW}Recomendamos que você revogue manualmente o token em https://github.com/settings/tokens${NC}"
  fi
else
  echo -e "${RED}Erro durante a instalação.${NC}"
fi

sleep "2"
