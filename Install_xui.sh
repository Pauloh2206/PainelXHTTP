#!/bin/bash

# Script para instalação e configuração inicial do painel 3x-ui
# Este script automatiza os comandos de terminal e fornece instruções para as etapas manuais no painel.
# Certifique-se de executar este script com permissões de superusuário (sudo) ou como root.

echo "----------------------------------------------------------------------"
echo "Iniciando a preparação do servidor e instalação do Painel 3x-ui..."
echo "----------------------------------------------------------------------"
sleep "2"
echo "Tutorial em vídeo das instruções abaixo ⬇️ (Recomendado)"
echo "Copia o link: https://drive.google.com/file/d/16m_-uWCpm8dYgXMVCwGroOQtmwPmqQs8/view"
sleep "7"
# Etapa 1: Preparação do Servidor
echo "[PASSO 1/7] Atualizando a lista de pacotes do servidor..."
sudo apt update -y
if [ $? -ne 0 ]; then
    echo "Erro ao atualizar os pacotes. Verifique a saída e tente novamente."
    exit 1
fi
echo "Lista de pacotes atualizada com sucesso."

echo "
[PASSO 2/7] Desabilitando o UFW (firewall)..."
sudo ufw disable
if [ $? -ne 0 ]; then
    echo "Erro ao desabilitar o UFW. Pode ser que ele já esteja desabilitado."
else
    echo "UFW desabilitado com sucesso."
fi

# Etapa 2: Instalação do Painel 3x-ui
echo "
[PASSO 3/7] Instalando o script do Painel 3x-ui..."
echo "Este processo pode levar alguns minutos. Aguarde a finalização."
bash <(curl -Ls https://raw.githubusercontent.com/Pauloh2206/PainelXHTTP/refs/heads/main/install.sh)
if [ $? -ne 0 ]; then
    echo "Erro durante a instalação do painel 3x-ui. Verifique a saída do script de instalação."
    exit 1
fi
echo "Instalação do painel 3x-ui concluída."
echo "----------------------------------------------------------------------"
echo "IMPORTANTE: Após a instalação, o script do painel exibirá a URL de acesso,"
echo "nome de usuário e senha padrão. ANOTE ESSAS INFORMAÇÕES CUIDADOSAMENTE."
echo "Você precisará delas para acessar o painel. O vídeo fornecido mostra onde"
echo "essas credenciais aparecem (geralmente ao final da saída da instalação)."
echo "Pressione Enter para continuar após anotar as credenciais..."
echo "Credenciais abaixo salve"
sleep "1"
eval "x-ui settings"
sleep "1"
read

# Etapa 3: Configuração de Credenciais do Painel (via x-ui)
echo "
----------------------------------------------------------------------"
echo "[PASSO 4/7] Configuração de Credenciais de Acesso ao Painel 3x-ui"
echo "----------------------------------------------------------------------"
echo "Agora, vamos alterar o usuário e senha padrão do painel."
echo "Execute o comando 'x-ui' no seu terminal."
echo "Siga as instruções abaixo no menu interativo do x-ui:"
echo "1. Digite 'x-ui' e pressione Enter."
echo "2. Escolha a opção '6' (Modify Panel Settings)."
echo "3. Confirme digitando 'y' e pressionando Enter."
echo "4. Defina seu novo nome de usuário para o painel e pressione Enter."
echo "5. Defina sua nova senha para o painel e pressione Enter."
echo "6. Confirme novamente digitando 'y' e pressionando Enter."
echo "Após concluir estes passos, suas credenciais de acesso ao painel estarão atualizadas."
echo "Pressione Enter para continuar o script após configurar as credenciais..."
read

# Etapa 4: Criação do Cliente no Painel
echo "
----------------------------------------------------------------------"
echo "[PASSO 5/7] Criação do Cliente no Painel 3x-ui"
echo "----------------------------------------------------------------------"
echo "Esta etapa é realizada diretamente na interface web do painel 3x-ui."
echo "1. Acesse a URL do painel que você anotou anteriormente."
echo "2. Faça login com o novo usuário e senha que você acabou de configurar."
echo "3. Siga as instruções do vídeo fornecido para criar um novo cliente."
echo "   (O vídeo detalha o processo de criação do cliente dentro do painel)."
echo "Pressione Enter para continuar o script após criar o cliente no painel..."
read

# Etapa 5: Configuração da BunnyCDN (Manual)
echo "
----------------------------------------------------------------------"
echo "[PASSO 6/7] Configuração da BunnyCDN (Procedimento Manual)"
echo "----------------------------------------------------------------------"
echo "Conforme solicitado, a configuração da BunnyCDN é um procedimento manual."
echo "1. Crie uma conta na BunnyCDN (aproveite os 14 dias de teste gratuito, se aplicável)."
echo "2. Siga o procedimento detalhado no vídeo para configurar a BunnyCDN e integrá-la"
echo "   com o seu servidor/painel."
echo "Pressione Enter para continuar o script após configurar a BunnyCDN..."
read

# Etapa 6: Configuração do Firewall na VPS (via x-ui)
echo "
----------------------------------------------------------------------"
echo "[PASSO 7/7] Configuração do Firewall na VPS (Liberando Portas via x-ui)"
echo "----------------------------------------------------------------------"
echo "Vamos voltar à sua VPS para abrir as portas necessárias no firewall usando o painel x-ui."
echo "Execute o comando 'x-ui' no seu terminal novamente."
echo "Siga as instruções abaixo no menu interativo do x-ui:"
echo "1. Digite 'x-ui' e pressione Enter."
echo "2. Escolha a opção '21' (Manage Firewall)."
echo "3. Escolha a opção '1' (Add Port)."
echo "4. Escolha a opção '3' (Add Custom Port)."
echo "5. Quando solicitado pelas portas, informe: 80,443,2053"
echo "   (Digite exatamente como mostrado, separado por vírgulas, sem espaços)."
echo "   Pressione Enter para confirmar."
echo "As portas 80, 443 e 2053 serão adicionadas às regras do firewall."

echo "
----------------------------------------------------------------------"
echo "Configuração concluída!"
echo "----------------------------------------------------------------------"
echo "Lembre-se de verificar se todos os serviços estão funcionando como esperado."
echo "Consulte o vídeo original para detalhes visuais da configuração do painel e da BunnyCDN. (telegram: @sunmodls)"

exit 0

