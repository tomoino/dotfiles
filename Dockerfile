# 普段の作業用のDockerfile
FROM ubuntu:18.04

# 走らせるbashコマンド
RUN apt-get update
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN apt-get -y install nano wget curl

RUN pip3 install jupyter numpy matplotlib seaborn pandas tqdm
RUN pip3 install torch torchvision
RUN pip3 install torchsummary
RUN pip3 install opencv-python

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