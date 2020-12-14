# 普段の作業用のDockerfile
FROM pytorch/pytorch

# 走らせるbashコマンド
RUN apt-get update -y && \
    apt-get install -y wget curl sudo && \
    apt-get clean && \
    pip install jupyter numpy matplotlib seaborn pandas tqdm

# duser setting
ARG USER_ID
ARG GROUP_ID
RUN addgroup --gid $GROUP_ID duser && \
    adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID duser && \
    adduser duser sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER duser
# 各種命令を実行するカレントディレクトリを指定
WORKDIR /home/duser/