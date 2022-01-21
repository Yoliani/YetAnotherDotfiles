#!/bin/bash
 
echo "*****************+Linux Setup******************"  
if [[ "$OSTYPE" == "linux-gnu"]]; then
   
    GOLANG_BASH = "
  [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
  export GOPATH=$HOME/go
  export GOBIN=$GOPATH/bin
  export PATH=${PATH}:$GOBIN:$GOROOT/bin
  "
   
  if [[ $SHELL == "bash" ]]; then
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    echo -e $GOLANG_BASH >> ~/.bashrc
  elif [[ $SHELL == "zsh" ]]; then 
    zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    echo -e $GOLANG_BASH >> ~/.zshrc
    yay -S zsh 
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  fi
fi

