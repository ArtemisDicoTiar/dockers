FROM nvcr.io/nvidia/pytorch:23.04-py3

WORKDIR /root
COPY 50unattended-upgrades ./50unattended-upgrades
RUN cat ./50unattended-upgrades >> /etc/apt/apt.conf.d/50unattended-upgrades
RUN apt-get update
RUN apt update

# support ssh connection
RUN apt-get install -y openssh-server
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRoZotLogin yes/' /etc/ssh/sshd_config
    
# using zsh
RUN apt-get install -y zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# install custom plugins
RUN apt-get install -y gpustat tmux

## installing eza
# RUN mkdir -p /etc/apt/keyrings
# RUN wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
# RUN echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | tee /etc/apt/sources.list.d/gierens.list
# RUN chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
# RUN apt update
# RUN apt install -y eza

# ts install
# RUN echo 'eval "$(fzf --zsh)"' >> ~/.zshrc
# RUN echo 'eval "$(fzf --bash)"' >> ~/.bashrc

# RUN echo 'alias ls="eza --color=always --long --git --icons=always --no-user --no-permissions"' >> ~/.zshrc
# RUN echo 'alias ls="eza --color=always --long --git --icons=always --no-user --no-permissions"' >> ~/.bashrc

#RUN alias ld="eza -lD" >> ~/.zshrc
#RUN alias ld="eza -lD" >> ~/.bashrc
#RUN alias lf="eza -lf --color=always | grep -v /" >> ~/.zshrc
#RUN alias lf="eza -lf --color=always | grep -v /" >> ~/.bashrc
#RUN alias lh="eza -dl .* --group-directories-first" >> ~/.zshrc
#RUN alias lh="eza -dl .* --group-directories-first" >> ~/.bashrc
#RUN alias ll="eza -al --group-directories-first" >> ~/.zshrc
#RUN alias ll="eza -al --group-directories-first" >> ~/.bashrc
#RUN alias lt="eza -al --sort=modified" >> ~/.zshrc
#RUN alias lt="eza -al --sort=modified" >> ~/.bashrc

#RUN echo $'# List of plugins \n\
# set -g @plugin 'tmux-plugins/tpm' \n\
# set -g @plugin 'catppuccin/tmux' \n\
# set -g @plugin 'tmux-plugins/tmux-sensible' \n\
# \n\
# set -g @plugin 'tmux-plugins/tmux-resurrect' \n\
# set -g @plugin 'tmux-plugins/tmux-continuum' \n\
# \n\
# set -g @catppuccin_flavour 'mocha' \n\
# \n\
# # Other examples: \n\
# \n\
# # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf) \n\
# run '~/.tmux/plugins/tpm/tpm' \n\
# ' > ~/.tmux.conf

# tmux plugin
COPY .tmux.conf /root/.tmux.conf
# RUN tmux source-file /root/.tmux.conf
# RUN sh ~/.tmux/plugins/tpm/scripts/install_plugins.sh

# using custom env set
RUN git clone https://github.com/TPFRL/envset.git
WORKDIR envset
RUN chmod +x envset.sh
RUN zsh envset.sh

RUN git clone https://github.com/ArtemisDicoTiar/task-spooler.git
WORKDIR task-spooler
RUN ./install_cmake

# starting ssh with docker start. can change zsh to bash if you don't use zsh
WORKDIR /workspace
ENTRYPOINT service ssh start && zsh
