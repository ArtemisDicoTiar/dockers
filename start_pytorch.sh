docker build -t jongyoon .
docker run --ipc=host -p 30022:22 --name=jongyoon --gpus all -v /home/sonic/jongyoon/docker_volume:/workspace -dit jongyoon
docker exec -it jongyoon /bin/zsh
