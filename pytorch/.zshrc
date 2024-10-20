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

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


PING() {
        export send_msg=$@
        export send_data='{
    "msg_type": "text",
    "content": {"text": "${send_msg}"}
}'
curl --location 'https://open.larksuite.com/open-apis/bot/v2/hook/dcee077f-4010-4aad-953a-510c7d48ebbe' \
--header 'Content-Type: application/json' \
--data "{
    \"msg_type\": \"text\",
    \"content\": {\"text\": \"${send_msg}\"}
}"
}
