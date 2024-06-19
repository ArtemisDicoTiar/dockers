va() {
    source /root/.virtualenvs/"$1"/bin/activate
}

_va_comp()
{
    local MEMO_DIR=/root/.virtualenvs
    local cmd=$1 cur=$2 pre=$3
    local arr i file

    arr=( $( cd "$MEMO_DIR" && compgen -f -- "$cur" ) )
    COMPREPLY=()
    for ((i = 0; i < ${#arr[@]}; ++i)); do
        file=${arr[i]}
        if [[ -d $MEMO_DIR/$file ]]; then
            file=$file/
        fi
        COMPREPLY[i]=$file
    done
}
complete -F _va_comp -o nospace va

CV() {
  export CUDA_VISIBLE_DEVICES=$1
  echo "CUDA_VISIBLE_DEVICES set to $CUDA_VISIBLE_DEVICES"
}

alias ls="eza --color=always --long --git --icons=always --no-user --no-permissions"

alias ld="eza -lD" >> ~/.zshrc
alias lf="eza -lf --color=always | grep -v /" >> ~/.zshrc
alias lh="eza -dl .* --group-directories-first" >> ~/.zshrc
alias ll="eza -al --group-directories-first" >> ~/.zshrc
alias lt="eza -al --sort=modified" >> ~/.zshrc
