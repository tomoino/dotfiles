set JDK_HOME "/usr/lib/jvm/java-11-openjdk-amd64/bin/java"
set PATH $JDK_HOME $HOME/bin $HOME/.local/bin $PATH
set -e LIBGL_ALWAYS_INDIRECT

export DISPLAY=(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
source ~/.config/fish/alias.fish
source ~/.config/fish/function.fish
