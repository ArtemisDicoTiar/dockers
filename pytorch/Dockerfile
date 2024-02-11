FROM nvcr.io/nvidia/pytorch:23.04-py3
RUN apt-get update
RUN apt update

# support ssh connection
RUN apt-get install -y openssh-server gpustat
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
    
# using zsh
RUN apt-get install -y zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# using custom env set
RUN git clone https://github.com/TPFRL/envset.git
WORKDIR envset
RUN chmod +x envset.sh
RUN zsh envset.sh

# ts install
WORKDIR /root
RUN git clone https://github.com/ArtemisDicoTiar/task-spooler.git
WORKDIR task-spooler
RUN ./install_cmake

# starting ssh with docker start. can change zsh to bash if you don't use zsh
WORKDIR /workspace
ENTRYPOINT service ssh start && zsh
