# Painel-XHTTP - Scripts de Instalação e Guia

Este repositório contém os scripts para instalação e configuração do painel 3x-ui.

## Scripts Disponíveis

1.  **`install.sh`**:
    *   Este é o script de instalação original e principal do painel 3x-ui, obtido diretamente do repositório oficial do MHSanaei.
    *   Utilize este script para realizar a instalação técnica do painel no seu servidor.
    *   Ele lida com as dependências, download dos binários e configuração inicial do serviço.

2.  **`Install_xui.sh`**:
    *   Este é um script de guia complementar, fornecido pelo usuário, que automatiza e detalha o processo de instalação e configuração passo a passo.
    *   Ele inclui instruções para preparação do servidor, execução do `install.sh`, configuração de credenciais, criação de cliente no painel, e orientações para configurações manuais como BunnyCDN e firewall.
    *   Recomenda-se seguir este script se você deseja um passo a passo mais detalhado e guiado, especialmente se for novo no processo. Ele utiliza o `install.sh` como parte de suas etapas.

## Como Usar

1.  **Para uma instalação guiada e completa (recomendado para iniciantes):**
    *   Baixe o arquivo `Install_xui.sh`.
    *   Conceda permissão de execução: `chmod +x Install_xui.sh`
    *   Execute o script: `sudo ./Install_xui.sh`
    *   Siga as instruções apresentadas no terminal.

2.  **Para uma instalação técnica direta (se você já tem familiaridade):**
    *   Baixe o arquivo `install.sh`.
    *   Conceda permissão de execução: `chmod +x install.sh`
    *   Execute o script: `sudo ./install.sh`

Certifique-se de executar os scripts com as permissões adequadas (geralmente `sudo` ou como usuário root).
