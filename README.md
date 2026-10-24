<br/>
  <p align="center">
  <a href="#">
  <img src="https://i.imgur.com/drarQVx.png" alt="Logo" width="110" height="110">
  
  <h3 align="center">WindowsDebloater</h3>

  <p align="center">
    Limpeza do windows após Formatação
    <br/>
    <br/>
    <a href="https://github.com/carlositaloo/Windows-Debloater"><strong>Explore the docs »</strong></a>
    <br/>
    <a href="https://microsoft.com/PowerShell" target="_blank"><img src="https://img.shields.io/badge/PowerShell-1f425f?logo=Powershell" target="_blank" align="center"></a>
    &nbsp;
    <a href="https://opensource.org/licenses/MIT" target="_blank"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" target="_blank" align="center"></a>
</a>
</p>

## Índice

* [Sobre o projeto](#sobre-o-projeto)
* [Opções/Instruções](#opçõesinstruções)
  * [Desinstalar Aplicativos Desnecessários](#desinstalar-aplicativos-desnecessários)
  * [Desinstalar OneDrive](#desinstalar-onedrive)
  * [Limpar pastas Temporárias](#limpar-pastas-temporárias)
  * [Ativar modo de Desempenho](#ativar-modo-de-desempenho)
  * [Desativar Telemetry](#desativar-telemetry)
* [Instalação](#instalação)
* [Instalar o Windows já otimizado (autounattend.xml)](#instalar-o-windows-já-otimizado-autounattendxml)
* [Licença](#licença)
* [Autores](#autores)

---
<div style="display: inline_block" align="center"><br>
  <a href="#">
    <img align="center" alt="Screen Shot" height="635" width="770" src="https://i.imgur.com/GFyTYoe.png">
  </a>
</div>

## Sobre o projeto

O Programa de Limpeza pós-formatação é uma ferramenta desenvolvida para os sistemas operacionais Windows 10 e Windows 11. Seu principal objetivo é fornecer uma solução fácil para liberar espaço em disco e remover arquivos desnecessários, como jogos e aplicativos pré-instalados no Windows, que geralmente não são utilizados pelos usuários comuns.
O programa pode ser facilmente baixado e executado através de uma linha de comando no PowerShell, utilizando o seguinte comando:
```
iex ([System.Text.Encoding]::UTF8.GetString((New-Object System.Net.WebClient).DownloadData('https://bit.ly/Windows-Debloater')))
```
Esse comando realiza o download da string diretamente do repositório do GitHub e a executa, exibindo uma interface simples que oferece as seguintes opções:

## Opções/Instruções

### Desinstalar Aplicativos Desnecessários

Botão "Desinstalar APPS Desnecessários":

- Inicia a desinstalação de aplicativos desnecessários.  
- Abre um novo PowerShell e executa um comando para desinstalar os aplicativos desnecessários do Windows Store.  
- Aguarda até que o PowerShell seja fechado.  

<details>
<summary>Saber mais:</summary>
<br>
Essa opção permite remover todos os aplicativos pré-instalados que vêm com o Windows Store. Ela removerá qualquer aplicativo que NÃO esteja nesta lista:

- Microsoft.WindowsStore (Loja de aplicativos do Windows)
- Microsoft.Windows.Photos (Visualizador de fotos do Windows)
- Microsoft.WindowsCalculator (Calculadora do Windows)
- Microsoft.ScreenSketch (Ferramenta de Captura e Esboço)
- Microsoft.DesktopAppInstaller (Instalador de aplicativos em pacotes .appx e .msix / winget)
- Microsoft.WindowsCamera (Aplicativo de câmera padrão)
- NVIDIACorp.NVIDIAControlPanel (Painel de controle da NVIDIA)
- Microsoft.Paint (Editor de imagens básico - Paint)
- Microsoft.MicrosoftEdge.Stable (Navegador Microsoft Edge)
- Microsoft.WindowsNotepad (Bloco de Notas)
- Microsoft.XboxIdentityProvider (Gerencia a conta Xbox nos aplicativos e jogos)
- MicrosoftCorporationII.QuickAssist (Assistência rápida para suporte remoto)
- WinRAR.ShellExtension (Extensão do WinRAR para gerenciar arquivos compactados)
- Microsoft.WindowsTerminal (Terminal moderno e avançado do Windows)

Aqui está a versão simplificada e otimizada apenas para desinstalar os aplicativos não desejados via powershell:
```
[regex]$WhitelistedApps='Microsoft.WindowsStore|Microsoft.Windows.Photos|Microsoft.WindowsCalculator|Microsoft.ScreenSketch|Microsoft.DesktopAppInstaller|Microsoft.WindowsCamera|NVIDIACorp.NVIDIAControlPanel|Microsoft.Paint|Microsoft.MicrosoftEdge.Stable|Microsoft.WindowsNotepad|Microsoft.XboxIdentityProvider|MicrosoftCorporationII.QuickAssist|WinRAR.ShellExtension|Microsoft.WindowsTerminal'; Get-AppxPackage -AllUsers | Where-Object {$_.Name -NotMatch $WhitelistedApps -and $_.NonRemovable -ne $true} | ForEach-Object { Remove-AppxPackage -Package $_.PackageFullName -ErrorAction SilentlyContinue }; Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -NotMatch $WhitelistedApps} | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName -ErrorAction SilentlyContinue }
```


Você pode encontrar informações detalhadas sobre cada um desses aplicativos/comandos no próprio site da Microsoft:
https://learn.microsoft.com/pt-br/windows/application-management/apps-in-windows-10

**Aplicativos não contidos e você acha necessário para seu uso pessoal, você pode encontrá-los e baixá-los na Microsoft Store normalmente.**

Se o aplicativo não for encontrado na biblioteca da Microsoft Store ou se você acredita que um aplicativo é extremamente necessário para o funcionamento correto do Windows, você pode nos informar para que possamos corrigir esse problema.

O Windows 11 está passando por uma transição para tornar os aplicativos nativos do Windows disponíveis na Windows Store, o que significa que há uma probabilidade de que essa lista seja alterada em futuras atualizações do Windows. Devido a essa possibilidade, podem ocorrer bugs, no entanto, até o momento, essa ferramenta tem se mostrado indispensável após as formatações.
</details>

##
### Desinstalar OneDrive
Botão "Desinstalar OneDrive":

- Inicia a desinstalação do aplicativo OneDrive.
- Move os arquivos do OneDrive para uma pasta chamada "OneDriveBackupFiles" na área de trabalho.
- Habilita a política de grupo "Impedir o uso do OneDrive para Armazenamento de Arquivos" (sempre, com ou sem arquivos).
- Desinstala o OneDrive e remove arquivos restantes.
- Remove o OneDrive do Windows Explorer.
- Reinicia o Explorer.

##
### Limpar pastas Temporárias
Botão "Limpar pastas Temporárias":

Realizar a limpeza de pastas temporárias no sistema operacional Windows. O script acessa diferentes pastas, como:
- "C:\Windows\Temp", 
- "C:\Windows\Prefetch",  
- "C:\Users*\Appdata\Local\Temp", 
- "C:\Users*\Appdata\Recent", 
- "C:\Windows\SoftwareDistribution\Download", 
e remove os arquivos nelas contidos de forma recursiva e forçada.

Esteja ciente de que a limpeza de algumas pastas, como a pasta "C:\Windows\Prefetch" e a pasta "C:\Windows\SoftwareDistribution\Download", pode afetar o desempenho do sistema ou a capacidade de instalar atualizações futuras **se feita com frequência** o que é recomendado apenas após formatação.

Além disso, o script também marca o que limpar e inicia a ferramenta de limpeza de disco do Windows (cleanmgr /sagerun:1) em segundo plano, sem prender o script. A pasta Downloads não é tocada.

##
### Ativar modo de Desempenho
Botão "Ativar modo de Desempenho":

- **Desativar Compressão de Memória**: A memória RAM não é comprimida.
- **Desativar Hibernação**: Libera espaço em disco (arquivo hiberfil.sys).
- **Instalar WinRAR**: Garante o software para compactação/descompactação de arquivos.
- **Ativar Sensor de Armazenamento**: Gerencia automaticamente o espaço em disco.
- **Histórico de Área de Transferência**: Acesso a itens copiados anteriormente. (_Win+V_)
- **Personalização da Barra de Tarefas**: Oculta a barra de pesquisa, a Visão de Tarefas, Widgets e Chat. Ativa "Finalizar tarefa" no botão direito.
- **Desativar Prefetch e SysMain**: Otimizado para SSD.
- **Busca do Windows em Manual**: O serviço de indexação só roda quando você pesquisa.
- **Edge não abre sozinho**: Remove o Edge da inicialização e desativa a "Aceleração de inicialização".
- **Desativar Precisão do Mouse**: Remove a aceleração do mouse (mira mais precisa em jogos).
- **Desativar Gravação do Game Bar**: Desliga a gravação em segundo plano dos jogos.
- **DNS Rápido**: Troca o DNS das placas de rede conectadas para Cloudflare (1.1.1.1) + Google (8.8.8.8).
- **Desativar Sugestões e Anúncios**: Remove sugestões de apps e anúncios na tela de bloqueio.
- **Modo de Desempenho Máximo de Energia**: Adiciona 'Desempenho Máximo' no modo de energia, mas **não ativa**. Para ativar, vá em Opções de Energia.
- **Desativar Busca na Web**: Desativa a busca na Web (Bing) no menu iniciar. Funciona no Windows 10 e 11.
- **Caminhos Longos**: Aumenta o limite de tamanho para endereços de diretórios.
- **Ativar Modo Escuro**: Reduz a fadiga ocular e economiza energia.


##
### Desativar Telemetry
Botão "Desativar Telemetry":

- Desativa o serviço de Telemetry do Windows (DiagTrack), que coleta dados do sistema para a Microsoft.
- Desativa a coleta de dados (AllowTelemetry = 0), criando a chave se ela não existir.
- Desativa o ID de anúncio.
- Desativa o programa de experiência de comentários do Windows.
- Impede que aplicativos bloatware retornem e remove sugestões do Menu Iniciar.
- Desativa o rastreamento de localização.
- Desativa o serviço WAP Push.
- Desativa o Histórico de atividades (lista do que você abre no PC).
- Desativa o Copilot.

---
### Instalação

1. Abra o PowerShell como administrador e execute o seguinte comando:

```
iex ([System.Text.Encoding]::UTF8.GetString((New-Object System.Net.WebClient).DownloadData('https://raw.githubusercontent.com/carlositaloo/Windows-Debloater/refs/heads/main/WindowsDebloater.ps1')))
```
O aplicativo abrirá, exibindo uma interface com botões para iniciar a limpeza.

<details>
<summary>Como abrir o PowerShell:</summary>
Pressione a tecla Windows no teclado.  
Digite "PowerShell" na barra de pesquisa.  
Clique com o botão direito do mouse no resultado "Windows PowerShell" e escolha "Executar como administrador".  
Se necessário, clique em "Sim" para confirmar a execução como administrador.  
Uma vez que o PowerShell é aberto como administrador, você pode executar o comando desejado. Certifique-se de inserir corretamente o comando específico que deseja executar.  
</details>

<details>
<summary>O que esse comando faz:</summary>

1. **`iex`**: É um comando que executa o que está dentro dos parênteses como se fosse um código ou instrução.

2. **`[System.Text.Encoding]::UTF8.GetString`**: É um comando que converte um tipo de informação chamado "bytes" em uma forma legível para nós, chamada de string. Neste caso, está usando uma codificação chamada UTF-8 (Exibe caracteres e pontuação brasileiros).

3. **`New-Object System.Net.WebClient`**: Cria um objeto especial que permite baixar e enviar informações para a internet.  
  Nesse caso baixar o script.

4. **`.DownloadData('https://raw.githubusercontent.com/...')`**: Baixa informações de um site específico, neste caso, o arquivo `WindowsDebloater.ps1` direto deste repositório do GitHub.

Se o PowerShell não estiver como administrador, o script pede permissão e se abre de novo como administrador sozinho.

Resumindo, esse comando baixa um arquivo da internet e o transforma em informações compreensíveis. Depois, executa essas informações como um conjunto de ações no seu computador. É importante ter cuidado ao executar comandos desconhecidos, pois eles podem afetar o funcionamento do seu computador. Certifique-se de entender a origem e o propósito do comando antes de executá-lo.

</details>

---
## Instalar o Windows já otimizado (autounattend.xml)

O arquivo [`autounattend.xml`](autounattend.xml) faz a instalação do Windows 11 já limpa e otimizada, com os mesmos ajustes do script. Assim você não precisa rodar o WindowsDebloater depois de formatar.

Ele foi feito no gerador [schneegans.de/windows/unattend-generator](https://schneegans.de/windows/unattend-generator/).

### Como usar

1. Crie um pendrive de instalação do Windows 11 (ex: com a [Ferramenta de Criação de Mídia](https://www.microsoft.com/pt-br/software-download/windows11) ou o [Rufus](https://rufus.ie/pt_BR/)).
2. Copie o `autounattend.xml` para a **raiz** do pendrive (junto da pasta `sources`). O nome tem que ser exatamente `autounattend.xml`.
3. Ligue o PC pelo pendrive. A instalação lê o arquivo sozinha.
4. Na tela de discos, **escolha você mesmo** onde instalar. O arquivo não apaga nenhum disco sozinho.
5. Na configuração inicial, crie sua conta local (nome e senha).
6. No primeiro login, espere os scripts terminarem (alguns minutos). O WinRAR é instalado nessa hora, precisa de internet.

### O que ele já faz

| Parte | O que faz |
|---|---|
| Instalação | Windows 11 Pro em pt-BR, teclado ABNT2, pula a checagem de TPM/Secure Boot e a exigência de internet |
| Conta | Conta local, sem conta Microsoft, senha sem expirar |
| Apps | Mesma lista branca do botão "Desinstalar APPS" (mais Segurança do Windows, idioma pt-BR e bibliotecas que o Terminal, o WinRAR e o `winget` usam) |
| OneDrive | Desinstalado e bloqueado |
| Telemetria | DiagTrack, AllowTelemetry, ID de anúncio, localização, histórico de atividades e Copilot desligados |
| Desempenho | Mesmo botão "Ativar modo de Desempenho": SysMain, Prefetch, Busca em manual, Edge fora do boot, mouse, Game Bar, DNS Cloudflare + Google, hibernação |
| Desempenho Máximo | Plano criado, mas **não ativado** |
| WinRAR | Instalado pelo `winget` no primeiro login. Se falhar (sem internet), tenta de novo no próximo login |
| Visual | Modo escuro, Explorador abre em "Este Computador", "Finalizar tarefa" no botão direito, caminhos longos |
| Outros | Área de Trabalho Remota ligada, sem restauração do sistema, sem criptografia automática do disco, Inicialização Rápida desligada, pasta `Windows.old` apagada |

A chave de produto dentro do arquivo é a chave **genérica** do Windows Pro, só para instalar. A ativação vem da licença digital do seu PC.

> ⚠️ A Área de Trabalho Remota fica ligada. Se você não usa, desligue em Configurações → Sistema → Área de Trabalho Remota.

### Como editar

O site lê as suas escolhas pelo link grande no topo do arquivo (o comentário `https://schneegans.de/...`). Para mudar algo:

1. Abra o [gerador](https://schneegans.de/windows/unattend-generator/) e clique em **Import** (ou abra o link do topo do arquivo).
2. Mude o que quiser e gere um novo `autounattend.xml`.
3. Troque o arquivo do repositório pelo novo.

**Não edite os scripts direto dentro do XML.** O site não lê os scripts, só o link do topo. Se você editar só os scripts, as mudanças somem ao reimportar no site. Edite sempre pelo site, nos campos de script.

---
## Licença:
<a href="https://opensource.org/licenses/MIT" target="_blank"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" target="_blank" align="center"></a>

Esta licença concede permissão gratuita para qualquer pessoa obter uma cópia do software e dos arquivos de documentação associados (o "Software") e utilizá-lo sem restrições, incluindo o direito de copiar, modificar, mesclar, publicar, distribuir, sublicenciar e vender cópias do Software. Os destinatários do Software devem incluir o aviso de direitos autorais e a permissão em todas as cópias ou partes substanciais do Software. O Software é fornecido "como está", sem garantias de qualquer tipo, expressas ou implícitas, e os autores ou detentores dos direitos autorais não serão responsáveis por quaisquer reivindicações, danos ou responsabilidades decorrentes do uso do Software.

---
## Autores

* [iNooTh](https://github.com/carlositaloo)
* [Referência: Sycnex](https://github.com/Sycnex/Windows10Debloater/)

---
<br>
<p align="right">
<sup>
Sempre tive o desejo de realizar uma formatação limpa no meu computador e, ao longo do tempo, fui seguindo um processo passo a passo para fazer essa limpeza. Decidi, então, me aprofundar no assunto e aprender mais para desenvolver um script que facilitasse todo o processo de formatação do computador com apenas alguns cliques. Como estudante de Análise e Desenvolvimento de Sistemas, decidi colocar à prova a dificuldade de criar algo assim. Apesar de me identificar mais com a linguagem Python, optei por desenvolver o aplicativo em PowerShell para obter uma integração mais sólida com o sistema, tornando-o mais prático, pois se trata apenas de um script.
</sup>
</p>
