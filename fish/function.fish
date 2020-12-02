
function reload
  source ~/.config/fish/config.fish
end

function mcd
  mkdir $argv; and cd $argv
end

function cdl
  cd $argv; and ll
end

function gc
  gcc $argv -o (string replace .c '' $argv) -lm -pedantic -Wall
end

function gp
  g++ $argv -o (string replace .cpp '' $argv)
end

function gcmm
  git commit -m $argv[1] -m '' -m $argv[2]
end

function ogc
  gcc $argv.c -o $argv -lglut -lGLU -lGL -lm
end

function dcud
  powershell.exe -Command "wsl docker-compose up -d"
end

function open
  set osname (uname)
  if $osname != 'Darwin'
    explorer.exe $argv
  else
    open $argv
  end
end

function conda
  cmd.exe (pwd) /K C:\\Users\\TomohiroInoue\\anaconda3\\Scripts\\activate.bat C:\\Users\\TomohiroInoue\\anaconda3\\envs\\MyEnv
end

function wsl
  powershell.exe -Command "wsl $argv"
end

function dotfiles
  code ~/dotfiles/
end

function is_arm
  test $UNAME=="arm64"
end