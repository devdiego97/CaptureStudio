# Capture Studio — Windows Screen Recorder

Aplicativo desktop em Rust, com interface gráfica profissional escura (egui/eframe), para gravação de tela e capturas de imagem.

## Funcionalidades entregues
- Gravação da área de trabalho inteira ou de região informada por coordenadas em pixels.
- Vídeo MP4/H.264 a 30 ou 60 FPS (dependendo do desempenho da máquina).
- Qualidade CRF ajustável, cursor opcional, screenshot PNG.
- Microfone opcional via FFmpeg DirectShow; exige informar o nome real do dispositivo.
- Pasta e nome de saída configuráveis, contador de duração, log de erros.
- Comandos de iniciar/parar e atalho F9 **somente com a janela em foco**.
- Detecta `ffmpeg.exe` ao lado do executável, ou aceita o FFmpeg instalado no PATH.

## Obter o EXE (Windows)
O arquivo ZIP deste projeto contém **código-fonte** e pipeline de compilação, não um EXE previamente compilado.

### Método 1: no seu Windows
1. Instale o Rust em https://rustup.rs/ (selecione toolchain MSVC e instale pré-requisitos sugeridos).
2. Instale o FFmpeg em https://ffmpeg.org/download.html e coloque `ffmpeg.exe` nesta pasta ou no PATH.
3. Extraia o projeto e execute `build-windows.bat`.
4. Abra `dist\\CaptureStudio.exe`.

### Método 2: GitHub Actions (sem instalar Rust)
1. Crie um repositório GitHub e envie o **conteúdo da pasta rust_screen_recorder** para a raiz do repositório.
2. Abra **Actions → Build Windows EXE → Run workflow**.
3. Depois da execução, baixe o artifact **CaptureStudio-Windows-x64**.
4. Extraia `CaptureStudio.exe`. Instale FFmpeg separadamente ou coloque `ffmpeg.exe` na mesma pasta do EXE.

O workflow gera EXE para `windows-latest` (x64). Não foi possível executar o processo neste ambiente Linux offline; o build e o funcionamento final no Windows devem ser confirmados.

## Limitações técnicas
- Captura com FFmpeg `gdigrab` (não é captura otimizada de jogos DirectX em tela exclusiva).
- Não inclui áudio do sistema por padrão, apenas o dispositivo DirectShow configurado manualmente.
- Não inclui pausa/retomada nem seleção visual arrastando uma caixa na tela.
- O FFmpeg deve estar instalado separadamente; a licença e distribuição do FFmpeg dependem do build utilizado.
- Arquivos MP4 são finalizados ao clicar Parar; fechar ou encerrar o programa abruptamente pode deixar gravações incompletas.
