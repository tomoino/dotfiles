set JDK_HOME "/usr/lib/jvm/java-11-openjdk-amd64/bin/java"
set GO_PATH "/usr/local/go/bin"
set PYENV_PATH $HOME/.pyenv/bin
set POETRY_PATH $HOME/.poetry/bin

set PATH $JDK_HOME $GO_PATH $PYENV_PATH $POETRY_PATH $HOME/bin $HOME/.local/bin $PATH 
# set -e LIBGL_ALWAYS_INDIRECT

# export DISPLAY=(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
source ~/.config/fish/alias.fish
source ~/.config/fish/function.fish

pyenv init - | source
# if type -q pyenv
#   set -gx PATH '/home/user/.pyenv/shims' $PATH
#   set -gx PYENV_SHELL fish
#   source '/home/user/.pyenv/libexec/../completions/pyenv.fish'
#   command pyenv rehash 2>/dev/null
#   function pyenv
#     set command $argv[1]
#     set -e argv[1]

#     switch "$command"
#     case activate deactivate rehash shell
#       source (pyenv "sh-$command" $argv|psub)
#     case '*'
#       command pyenv "$command" $argv
#     end
#   end
# end