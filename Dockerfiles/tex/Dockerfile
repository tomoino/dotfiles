# もととなるImage 
FROM thomasweise/docker-texlive-full

ENV DEBIAN_FRONTEND=noninteractive

COPY .latexmkrc /root/
COPY .vscode-server /root/

# 各種命令を実行するカレントディレクトリを指定
WORKDIR /root/