source ~/.profile

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

function fuck() {
  killall -9 $2;
  if [ $? == 0 ]
  then
    echo
    echo " (╯°□°）╯︵$(echo $2|flip &2>/dev/null)"
    echo
  fi
}

alias freneticvagrant="cd ~/Projects/Cornell/frenetic/frenetic/vagrant && (vagrant status | (grep 'running' || vagrant up) && vagrant ssh)"
