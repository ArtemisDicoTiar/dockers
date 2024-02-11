port=$1
name=$2
docker build -t ${name} .
docker run --ipc=host -p ${port}:22 --name=${name} --gpus all -v /home/sonic/${name}/docker_volume:/workspace -dit ${name} 
docker exec -it ${name} /bin/zsh
