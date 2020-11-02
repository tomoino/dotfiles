set JDK_HOME "/usr/lib/jvm/java-11-openjdk-amd64/bin/java"
set GO_PATH "/usr/local/go/bin"
# set PYTHON_HOME "/mnt/c/Users/TomohiroInoue/anaconda3/envs/py38"
# set PYTHONPATH "/mnt/c/Users/TomohiroInoue/anaconda3/envs/py38/Lib"

set PATH $JDK_HOME $GO_PATH $PYTHON_HOME $PYTHONPATH $HOME/bin $HOME/.local/bin $PATH 
set -e LIBGL_ALWAYS_INDIRECT

export DISPLAY=(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
source ~/.config/fish/alias.fish
source ~/.config/fish/function.fish
