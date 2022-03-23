[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

if [ "$SSH_CONNECTION" ]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

for file in ~/.{aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
