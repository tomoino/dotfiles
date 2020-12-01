source ~/dotfiles/fish/env.fish
# set -e LIBGL_ALWAYS_INDIRECT

set GHQ_ROOT "~/projects"

# アーキテクチャ名は UNAME に入れておく
set UNAME (uname -m)

# export DISPLAY=(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
source ~/.config/fish/alias.fish
source ~/.config/fish/function.fish

if type -q pyenv
    pyenv init - | source
end
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