#!/bin/bash

YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Adicionando os comandos de atualizaÃ§Ã£o do sistema
echo -e "${GREEN} Desativando o firewall...${NC}"
sleep "2"
sudo ufw disable
sleep "3"
echo -e "${GREEN}Atualizando o sistema...${NC}"
apt update -y

echo -e "${YELLOW}------------------------------------------------------------${NC}"
echo -e "${CYAN}(telegram: @sunmodls) :)${NC}"
echo -e "${CYAN}Tutorial em video atualizado abaixo¸ (Recomendado)${NC}"
echo -e "${CYAN}Tutorial: https://1drv.ms/v/c/aa01922591db4df3/Efxs9vs56ntBka6DU8bh6acBI1jAtb5cfa8fn5BTTA6l9w${NC}"
echo -e "${YELLOW}------------------------------------------------------------${NC}"

sleep "8"
echo -e "${GREEN}Iniciando a instalacao do painel 3x-ui...${NC}"
sleep "4"

bash <(curl -Ls -H "Authorization: token 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" https://raw.githubusercontent.com/Pauloh2206/PainelXHTTP/refs/heads/main/install.sh?token=GHSAT0AAAAAADFIDFRE25R6LZJVFNZOB4LY2CEF37Q
echo -e "${YELLOW}------------------------------------------------------------${NC}"
echo -e "${CYAN}Script e tutorial fornecido${NC}"
echo -e "${CYAN}Telegram: BY: @sunmodls${NC}"
echo -e "${RED}POS INSTALACAO SEGUE COM O VIDEO${NC}"
echo -e "${YELLOW}PEGA AS CREDENCIAIS DE ACESSO DA URL${NC}"
echo -e "${YELLOW}VOCE VERA NO VIDEO${NC}"
echo -e "${YELLOW}------------------------------------------------------------${NC}"
sleep "2"
