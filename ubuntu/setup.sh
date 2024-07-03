#!/usr/bin/bash


User=`whoami`
DOTFILES_TOP_DIR=$(cd $(dirname $0)/..; pwd)

NEOVIM_INSTALL_VERSION="stable"
GOOGLE_TEST_INSTALL_VERSION="v1.11.0"
OPENCV_INSTALL_VERSION="4.8.1"
FMT_INSTALL_VERSION="9.1.0"
LZ4_INSTALL_VERSION="v1.9.4"
LUAROCKS_INSTALL_VERSION="3.9.2"
BEAR_INSTALL_VERSION="3.1.3"

LOCAL_DITFILE="~/.zshrc.local"


init_setup_script () {
    # For library installation
    mkdir -p ~/Library
    mkdir -p ~/installer

    echo "export LD_LIBRARY_PATH=~/Library/lib:$LD_LIBRARY_PATH" >> $LOCAL_DITFILE
    export LD_LIBRARY_PATH=~/Library/lib:$LD_LIBRARY_PATH

    ln -sf $DOTFILES_TOP_DIR/git/.gitconfig ~/.gitconfig
}

install_basic_packages () {
    echo "* -------------------------------------------------------------"
    echo "*  Install basic packages"
    echo "*"

    sudo apt update

    sudo apt install -y \
        lsb-release \
        software-properties-common \
        apt-transport-https \
        ca-certificates \
        curl \
        cmake \
        gnupg \

}

add_apt_repositories () {
    echo "* -------------------------------------------------------------"
    echo "*  Add apt repositories"
    echo "*"

    # for docker
    # ref: https://qiita.com/haveAbook/items/0d0ae20a19214f65e7cd
    for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt remove $pkg; done
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # for Go-Lang
    sudo add-apt-repository ppa:longsleep/golang-backports

    # for LLVM
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

    sudo apt update
}

install_packages () {
    echo "* -------------------------------------------------------------"
    echo "*  Install packages"
    echo "*"

    sudo apt update
    sudo apt upgrade -y

    sudo apt install -y \
        git \
        zip \
        unzip \
        build-essential \
        zsh \
        gcc \
        gcc-arm-none-eabi \
        clang-15 \
        llvm-15 \
        lld-15 \
        lldb-15 \
        linux-tools-generic \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin \
        hwdata \
        nodejs \
        tree \
        flex \
        bison \
        libssl-dev \
        libelf-dev \
        libncurses-dev \
        libncurses5-dev \
        libncursesw5-dev \
        autoconf \
        libudev-dev \
        libtool \
        openssh-server \
        libv4l-dev \
        v4l-utils \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        ffmpeg \
        imagemagick \
        x11-apps \
        python3-dev \
        python3-pip \
        python3-venv \
        python3-pybind11 \
        iputils-ping \
        net-tools \
        dwarves \
        libopenblas-base \
        libopenblas-dev \
        libeigen3-dev \
        libatlas3-base \
        libatlas-base-dev \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        texlive-lang-japanese \
        texlive-lang-cjk \
        texlive-science \
        gv \
        xdvik-ja \
        evince \
        docker-ce \
        golang-go \
        liblua5.3-dev \
        lua5.3 \
        libx11-dev \
        xorg-dev \
        libglu1-mesa \
        libglu1-mesa-dev \
        libgl1-mesa-glx \
        libgl1-mesa-dev \
        libglfw3 \
        libglfw3-dev \
        libglew-dev \
        libglu1-mesa-dev \
        mesa-common-dev \
        freeglut3-dev \
        clinfo \
        libgtk2.0-dev \
        libavcodec-dev \
        libavcodec-extra \
        libavfilter-dev \
        libavfilter-extra \
        libavdevice-dev \
        libavformat-dev \
        libavutil-dev \
        libswscale-dev \
        libyaml-cpp-dev \
        powerline \
        fonts-powerline \
        ripgrep \
        fd-find \
        xvfb \
        cpu-checker \
        qemu-kvm \
        dotnet-sdk-8.0 \
        aspnetcore-runtime-7.0 \
        gettext \

}

install_ctags () {
    echo "* -------------------------------------------------------------"
    echo "*  Install universal ctags"
    echo "*"

    if [ -e ~/installer/ctags ];
    then
        sudo rm -r ~/installer/ctags
    fi

    cd ~/installer
    git clone https://github.com/universal-ctags/ctags.git
    cd ctags
    ./autogen.sh
    ./configure
    make
    sudo make install

    ln -sf $DOTFILES_TOP_DIR/ctags ~/.ctags.d
}

install_google_test () {
    echo "* -------------------------------------------------------------"
    echo "*  Install Google Test"
    echo "*"

    if [ -e ~/installer/googletest ];
    then
        pushd ~/installer/googletest/build
        sudo make uninstall
        popd
        sudo rm -r ~/installer/googletest
    fi

    cd ~/installer
    git clone https://github.com/google/googletest.git
    cd googletest
    git checkout -b $GOOGLE_TEST_INSTALL_VERSION refs/tags/$GOOGLE_TEST_INSTALL_VERSION
    mkdir -p build && cd build
    cmake ..
    make -j$(nproc)
    sudo make install
}

install_fmt () {
    echo "* -------------------------------------------------------------"
    echo "*  Install fmt"
    echo "*"

    if [ -e ~/installer/fmt ];
    then
        pushd ~/installer/fmt/build
        sudo make uninstall
        popd
        sudo rm -r ~/installer/fmt
    fi

    cd ~/installer
    git clone https://github.com/fmtlib/fmt.git
    cd fmt
    git checkout -b $FMT_INSTALL_VERSION refs/tags/$FMT_INSTALL_VERSION
    mkdir -p build && cd build
    cmake -D CMAKE_BUILD_TYPE=Release \
        -D BUILD_SHARED_LIBS=TRUE \
        ..
    make -j $(nproc)
    sudo make install
}

install_opencv () {
    echo "* -------------------------------------------------------------"
    echo "*  Install OpenCV"
    echo "*"

    if [ -e ~/installer/opencv ];
    then
        pushd ~/installer/opencv/build
        sudo make uninstall
        popd
        sudo rm -r ~/installer/opencv
    fi

    if [ -e ~/installer/opencv_contrib ];
    then
        sudo rm -r ~/installer/opencv_contrib
    fi

    cd ~/installer
    git clone https://github.com/opencv/opencv.git
    git clone https://github.com/opencv/opencv_contrib.git
    cd opencv
    git checkout -b $OPENCV_INSTALL_VERSION refs/tags/$OPENCV_INSTALL_VERSION
    cd ../opencv_contrib
    git checkout -b $OPENCV_INSTALL_VERSION refs/tags/$OPENCV_INSTALL_VERSION
    cd ../opencv
    mkdir -p build && cd build
    cmake -D CMAKE_BUILD_TYPE=Release \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
        -D OPENCV_FOR_THREADS_NUM=4 \
        -D CMAKE_EXPORT_COMPILE_COMMANDS=1 \
        ..
    make -j $(nproc)
    sudo make install
}

install_rust () {
    echo "* -------------------------------------------------------------"
    echo "*  Install Rust"
    echo "*"

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

install_lz4 () {
    echo "* -------------------------------------------------------------"
    echo "*  Install lz4"
    echo "*"

    if [ -e ~/installer/lz4 ];
    then
        sudo rm -r ~/installer/lz4
    fi

    cd ~/installer
    git clone https://github.com/lz4/lz4.git
    cd lz4
    git checkout -b $LZ4_INSTALL_VERSION refs/tags/$LZ4_INSTALL_VERSION
    make -j $(nproc)
    sudo make install DESTDIR=~ PREFIX=/Library
}

install_luarocks () {
    echo "* -------------------------------------------------------------"
    echo "*  Install luarocks"
    echo "*"

    if [ -e ~/installer/luarocks-${LUAROCKS_INSTALL_VERSION}.tar.gz ];
    then
        sudo rm -r ~/installer/luarocks-${LUAROCKS_INSTALL_VERSION}
        sudo rm -rvf luarocks-${LUAROCKS_INSTALL_VERSION}.tar.gz
    fi

    cd ~/installer

    wget https://luarocks.org/releases/luarocks-${LUAROCKS_INSTALL_VERSION}.tar.gz
    tar -xzvpf luarocks-${LUAROCKS_INSTALL_VERSION}.tar.gz
    cd luarocks-${LUAROCKS_INSTALL_VERSION}
    ./configure
    sudo make install
    sudo luarocks install luasocket
}

install_powershell () {
    echo "* -------------------------------------------------------------"
    echo "*  Install powershell"
    echo "*"

    cd ~/installer

    wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
    sudo dpkg -i packages-microsoft-prod.deb
    sudo apt update
    sudo apt install -y powershell

    rm -vf packages-microsoft-prod.deb
}

install_deno () {
    echo "* -------------------------------------------------------------"
    echo "*  Install Deno"
    echo "*"

    cd ~/installer

    curl -fsSL https://deno.land/x/install/install.sh | sh
}

install_glslViewer () {
    echo "* -------------------------------------------------------------"
    echo "*  Install glslViewer"
    echo "*"

    if [ -e ~/installer/glslViewer ];
    then
        pushd ~/installer/glslViewer/build
        sudo make uninstall
        popd
        sudo rm -r ~/installer/glslViewer
    fi

    cd ~/installer

    git clone https://github.com/patriciogonzalezvivo/glslViewer.git
    cd glslViewer
    git submodule init
    git submodule update

    mkdir -p build && cd build
    cmake ..
    make
    sudo make install
}

install_bear () {
    echo "* -------------------------------------------------------------"
    echo "*  Install Bear"
    echo "*"

    if [ -e ~/installer/Bear ];
    then
        pushd ~/installer/Bear/build
        sudo make uninstall
        popd
        sudo rm -r ~/installer/Bear
    fi

    cd ~/installer

    git clone https://github.com/rizsotto/Bear.git
    cd Bear
    git checkout -b $BEAR_INSTALL_VERSION refs/tags/$BEAR_INSTALL_VERSION

    mkdir -p build && cd build
    cmake \
        -DENABLE_UNIT_TESTS=OFF \
        -DENABLE_FUNC_TESTS=OFF \
        ..
    make all
    sudo make install
}

setup_symbolic_links () {
    echo "* -------------------------------------------------------------"
    echo "*  Setup Symbolic links"
    echo "*"

    sudo update-alternatives --install /usr/bin/clang clang $(which clang-15) 1
    sudo update-alternatives --install /usr/bin/clang++ clang++ $(which clang++-15) 1
    sudo update-alternatives --install /usr/bin/lldb lldb $(which lldb-15) 1
    sudo update-alternatives --install /usr/bin/lld lld $(which lld-15) 1
    sudo update-alternatives --install /usr/local/bin/usbip usbip /usr/lib/linux-tools/*-generic 20
}

setup_neovim () {
    echo "* -------------------------------------------------------------"
    echo "*  Setup NeoVim"
    echo "*"

    if [ -e ~/installer/neovim ];
    then
        sudo rm -r ~/installer/neovim
    fi

    cd ~/installer
    git clone https://github.com/neovim/neovim.git
    cd ~/installer/neovim
    git checkout -b $NEOVIM_INSTALL_VERSION refs/tags/$NEOVIM_INSTALL_VERSION
    make CMAKE_BUILD_TYPE=RelWithDebInfo -j$(nproc)
    sudo make install

    mkdir -p ~/.config
    ln -sf $DOTFILES_TOP_DIR/nvim ~/.config/nvim
    pip3 install --upgrade pynvim
    pip3 install --upgrade msgpack

    cargo install tree-sitter-cli

    sudo apt install nodejs npm
    sudo npm -g install n
    sudo n stable
    sudo apt purge nodejs npm
    sudo apt autoremove
    sudo npm install -g neovim
}

setup_zsh () {
    echo "* -------------------------------------------------------------"
    echo "*  Setup Zsh"
    echo "*"

    ln -sf $DOTFILES_TOP_DIR/zsh/.zprofile ~/.zprofile
    ln -sf $DOTFILES_TOP_DIR/zsh/.zshenv ~/.zshenv
    ln -sf $DOTFILES_TOP_DIR/zsh/.zshrc ~/.zshrc
}

setup_bash () {
    echo "* -------------------------------------------------------------"
    echo "*  Setup Bash"
    echo "*"

    ln -sf $DOTFILES_TOP_DIR/bashrc/.bash_profile ~/.bash_profile
    ln -sf $DOTFILES_TOP_DIR/bashrc/.bashrc ~/.bashrc
}

setup_ssh () {
    echo "* -------------------------------------------------------------"
    echo "*  Setup ssh connection"
    echo "*"

    sudo systemctl enable ssh
    sudo systemctl restart ssh
}

setup_docker () {
    echo "* -------------------------------------------------------------"
    echo "*  Setup Docker"
    echo "*"

    curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
    curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
        sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
        sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

    sudo apt update

    sudo apt install -y \
        nvidia-container-toolkit \


    sudo usermod -aG docker $User
    sudo systemctl restart docker

    # `systemctl start docker`が失敗した場合,
    # `systemctl status docker`, `docker info`, `dockerd --debug`を確認し, iptablesが使えない場合,
    # update-alternativesでiptables-legacyを選択してみるといい
    # `sudo update-alternatives --config iptables`
}

setup_cuda () {
    echo "* -------------------------------------------------------------"
    echo "*  Setup CUDA"
    echo "*"

    wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
    sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/3bf863cc.pub
    sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/ /"

    sudo apt update

    sudo apt install -y \
        cuda \
        cuda-drivers \


    echo "export PATH=$PATH:/usr/local/cuda/bin" >> $LOCAL_DITFILE
    echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64" >> $LOCAL_DITFILE
}

setup_lsp () {
    echo "* -------------------------------------------------------------"
    echo "*  Setup LSP"
    echo "*"

    mkdir -p ~/.config
    cp -r $DOTFILES_TOP_DIR/clangd ~/.config
}

switch2zsh () {
    echo "* -------------------------------------------------------------"
    echo "*  Switch to zsh"
    echo "*"
    setup_zsh
    sudo chsh -s $(which zsh) $(whoami)
}

switch2bash () {
    echo "* -------------------------------------------------------------"
    echo "*  Switch to bash"
    echo "*"
    setup_bash
    sudo chsh -s $(which bash) $(whoami)
}

set_terminal_multiplexer () {
    ln -sf $DOTFILES_TOP_DIR/tmux/.tmux.conf ~/.tmux.conf
    ln -sf $DOTFILES_TOP_DIR/screen/.screenrc ~/.screenrc
}


if [ $# -eq 0 ];
then
    init_setup_script
    install_basic_packages
    add_apt_repositories
    install_packages
    setup_symbolic_links
    install_ctags
    install_google_test
    install_fmt
    install_rust
    install_luarocks
    install_powershell
    install_deno
    setup_neovim
    setup_zsh
    setup_ssh
    setup_docker
    setup_lsp
    switch2zsh
    set_terminal_multiplexer
elif [ $# -eq 2 ];
then
    if [ $1 = "install" ];
    then
        if [ $2 = "package" ];
        then
            install_packages
        fi
        if [ $2 = "ctags" ];
        then
            install_ctags
        fi
        if [ $2 = "gtest" ];
        then
            install_google_test
        fi
        if [ $2 = "fmt" ];
        then
            install_fmt
        fi
        if [ $2 = "opencv" ];
        then
            install_opencv
        fi
        if [ $2 = "lz4" ];
        then
            install_lz4
        fi
        if [ $2 = "rust" ];
        then
            install_rust
        fi
        if [ $2 = "luarocks" ];
        then
            install_luarocks
        fi
        if [ $2 = "powershell" ];
        then
            install_powershell
        fi
        if [ $2 = "deno" ];
        then
            install_deno
        fi
        if [ $2 = "glslViewer" ];
        then
            install_glslViewer
        fi
        if [ $2 = "bear" ];
        then
            install_bear
        fi
    elif [ $1 = "setup" ];
    then
        if [ $2 = "link" ];
        then
            setup_symbolic_links
        fi
        if [ $2 = "neovim" ];
        then
            setup_neovim
        fi
        if [ $2 = "zsh" ];
        then
            setup_zsh
        fi
        if [ $2 = "bash" ];
        then
            setup_bash
        fi
        if [ $2 = "ssh" ];
        then
            setup_ssh
        fi
        if [ $2 = "docker" ];
        then
            setup_docker
        fi
        if [ $2 = "cuda" ];
        then
            setup_cuda
        fi
        if [ $2 = "lsp" ];
        then
            setup_lsp
        fi
        if [ $2 = "terminal_multiplexer" ];
        then
            set_terminal_multiplexer
        fi
    elif [ $1 = "switchto" ];
    then
        if [ $2 = "zsh" ];
        then
            switch2zsh
        fi
        if [ $2 = "bash" ];
        then
            switch2bash
        fi
    else
        echo "unsupported usage"
    fi
else
    echo "unsupported usage"
fi

