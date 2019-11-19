
function reload
  source ~/.config/fish/config.fish
end

function mcd
  mkdir $argv and cd $argv
end

function touchAndOpen
  touch $argv and open $argv
end

function excel
  cp /mnt/c/data/apps/archives/Excel/Book1.xlsx $argv and open $argv
end

function latestFileOpen
  set fname `ls -t | head -n 1`
  open $fname
end

function cdl
  cd $argv and ll
end

function gc
  gcc $argv.c -o $argv -lm -pedantic -Wall
end

function open
  wsl-open $argv
end