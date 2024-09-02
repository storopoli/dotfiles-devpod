if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [ -r ~/.bashrc ]; then
    source ~/.bashrc
fi

export XDG_CONFIG_HOME="$HOME"/.config
