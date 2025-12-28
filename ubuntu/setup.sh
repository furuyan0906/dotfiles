#!/usr/bin/env bash


set -Eeuo pipefail

### ----- SIGNAL HANDLERS -----

WORK_DIR=$(pwd)

function Err() {
    printf "[ERROR] line=%s cmd=%s\n" "$1" "${2:-}" 1>&2
}

function CleanUp() {
    if [[ -n "${WORK_DIR}" && -d "${WORK_DIR}" ]]; then
        rm -rf -- "${WORK_DIR}"
    fi
}

trap 'Err "${LINENO}" "${BASH_COMMAND}"' ERR
trap CleanUp EXIT

### ----- HELPERS -----

function is_running_on_wsl () {
    case "$(uname -r 2>/dev/null || :)" in
        *[Mm]icrosoft*|*WSL*) return 0 ;;
        *)                    return 1 ;;
    esac
}


### ----- COREs -----

function setup_config () {
    export LD_LIBRARY_PATH=${HOME}/.local/lib:${LD_LIBRARY_PATH}

    local DOTFILES_TOP_DIR=$(cd $(dirname ${BASH_SOURCE:-$0})/..; pwd)

    ln -sf -- "${DOTFILES_TOP_DIR}/git/.gitconfig" "${HOME}/.gitconfig"
    ln -sf -- "${DOTFILES_TOP_DIR}/tmux/.tmux.conf" "${HOME}/.tmux.conf"

    local ZSH_LOCAL_DITFILE="${HOME}/.zshrc.local"
    ln -sf -- "${DOTFILES_TOP_DIR}/zsh/.zprofile" "${HOME}/.zprofile"
    ln -sf -- "${DOTFILES_TOP_DIR}/zsh/.zshenv" "${HOME}/.zshenv"
    ln -sf -- "${DOTFILES_TOP_DIR}/zsh/.zshrc" "${HOME}/.zshrc"
    echo "export LD_LIBRARY_PATH=${HOME}/.local/lib:${LD_LIBRARY_PATH}" >> "${ZSH_LOCAL_DITFILE}"

    #local BASH_LOCAL_DITFILE="${HOME}/.bashrc_aliases"
    #ln -sf -- "${DOTFILES_TOP_DIR}/bashrc/.bash_profile ${HOME}/.bash_profile"
    #ln -sf -- "${DOTFILES_TOP_DIR}/bashrc/.bashrc ${HOME}/.bashrc"
    #echo "export LD_LIBRARY_PATH=${HOME}/.local/lib:${LD_LIBRARY_PATH}" >> "${BASH_LOCAL_DITFILE}"

    ln -sf -- "${DOTFILES_TOP_DIR}/nvim" "${HOME}/.config/nvim"
    ln -sf -- "${DOTFILES_TOP_DIR}/clangd" "${HOME}/.config/clangd"
}

function install_basic_packages () {
    echo "* -------------------------------------------------------------"
    echo "*  Install basic packages"
    echo "*"

    sudo apt update

    sudo apt install -y \
        lsb-release \
        software-properties-common \
        ubuntu-drivers-common \
        apt-transport-https \
        ca-certificates \
        curl \
        cmake \
        gnupg \

}

function add_apt_repositories () {
    echo "* -------------------------------------------------------------"
    echo "*  Add apt repositories"
    echo "*"

    # for docker
    # ref: https://docs.docker.com/engine/install/ubuntu/
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt remove --purge $pkg; done
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # for Go-Lang
    sudo add-apt-repository ppa:longsleep/golang-backports

    # for LLVM
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

    sudo apt update
}

function install_packages () {
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
        tree \
        flex \
        bison \
        libssl-dev \
        libelf-dev \
        libncurses-dev \
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
        python3-venv \
        iputils-ping \
        net-tools \
        dwarves \
        libopenblas-dev \
        libeigen3-dev \
        libatlas3-base \
        libatlas-base-dev \
        gv \
        xdvik-ja \
        evince \
        golang-go \
        libreadline-dev \
        libx11-dev \
        xorg-dev \
        libgl1 \
        libglx-mesa0 \
        libglu1-mesa \
        libglu1-mesa-dev \
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
        fd-find \
        xvfb \
        cpu-checker \
        gettext \

}

function install_gtest () {
    GTEST_INSTALL_VERSION="v1.11.0"
    GTEST_REPO_URL="https://github.com/google/googletest.git"

    local work_dir=$1

    if [ -e "${work_dir}/gtest" ];
    then
        pushd "${work_dir}/gtest/build"
        sudo make uninstall
        popd
        sudo rm -r -- "${work_dir}/gtest"
    fi

    pushd "${work_dir}" 
    if git clone --depth 1 --branch "${GTEST_INSTALL_VERSION}" "${GTEST_REPO_URL}" gtest;
    then
        cd gtest
        mkdir -p build && cd build
        cmake ..
        if make -j $(nproc);
        then
            sudo make install
        fi
    fi
    popd
}

function install_fmt () {
    FMT_INSTALL_VERSION="9.1.0"
    FMT_REPO_URL="https://github.com/fmtlib/fmt.git"

    local work_dir=$1

    if [ -e "${work_dir}/fmt" ];
    then
        pushd ${work_dir}/fmt/build
        sudo make uninstall
        popd
        sudo rm -r ${work_dir}/fmt
    fi

    pushd "${work_dir}" 
    if git clone --depth 1 --branch "${FMT_INSTALL_VERSION}" "${FMT_REPO_URL}" fmt;
    then
        cd fmt
        mkdir -p build && cd build
        cmake -D CMAKE_BUILD_TYPE=Release \
            -D BUILD_SHARED_LIBS=TRUE \
            ..
        if make -j $(nproc);
        then
            sudo make install
        fi
    fi
    popd
}

function install_rust () {
    curl --proto '=https' --tlsv1.3 -sSf https://sh.rustup.rs | sh
}

function install_bear () {
    BEAR_INSTALL_VERSION="3.1.3"
    BEAR_REPO_URL="https://github.com/rizsotto/Bear.git"

    local work_dir=$1

    if [ -e "${work_dir}/Bear" ];
    then
        pushd "${work_dir}/Bear/build"
        sudo make uninstall
        popd
        sudo rm -r -- "${work_dir}/Bear"
    fi

    pushd "${work_dir}"    
    if git clone --depth 1 --branch "${BEAR_INSTALL_VERSION}" "${BEAR_REPO_URL}" Bear;
    then
        cd Bear
        mkdir -p build && cd build

        cmake \
            -DENABLE_UNIT_TESTS=OFF \
            -DENABLE_FUNC_TESTS=OFF \
            ..
        if make all;
        then
            sudo make install
        fi
    fi
    popd
}

function install_tex () {
    sudo apt update
    sudo apt install \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        texlive-lang-japanese \
        texlive-lang-cjk \
        texlive-science \

}

function install_dotnet () {
    local DOTNET_VERSION=9.0

    sudo apt update
    sudo apt install \
        dotnet-sdk-${DOTNET_VERSION} \
        aspnetcore-runtime-${DOTNET_VERSION} \

}

function install_neovim () {
    NEOVIM_INSTALL_VERSION="stable"
    NEOVIM_REPO_URL="https://github.com/neovim/neovim.git"

    local work_dir=$1

    if [ -e "${work_dir}/neovim" ];
    then
        sudo rm -rf -- "${work_dir}/neovim"
    fi

    pushd "${work_dir}"
    if git clone --depth 1 --branch "${NEOVIM_INSTALL_VERSION}" "${NEOVIM_REPO_URL}" neovim;
    then
        cd neovim

        if make CMAKE_BUILD_TYPE=RelWithDebInfo -j$(nproc);
        then
            sudo make install
        fi
    fi
    popd
}

function setup_neovim () {
    sudo apt update
    sudo apt install \
        luarocks \
        liblua5.1-dev \
        lua5.1 \
        ripgrep \


    python3 -m pip install --upgrade pynvim
    python3 -m pip install --upgrade msgpack

    cargo install deno --locked
    cargo install tree-sitter-cli

    sudo apt install nodejs npm
    sudo npm -g install n
    sudo n stable
    sudo apt remove --purge nodejs npm
    sudo apt autoremove
    sudo npm install -g neovim
}

function setup_ssh () {
    sudo systemctl enable ssh
    sudo systemctl restart ssh
}

function switch2zsh () {
    sudo chsh -s $(which zsh) $(whoami)
}

function switch2bash () {
    sudo chsh -s $(which bash) $(whoami)
}

function install_opencv () {
    OPENCV_INSTALL_VERSION="4.12.0"
    OPENCV_REPO_URL="https://github.com/opencv/opencv.git"
    OPENCV_CONTRIB_REPO_URL="https://github.com/opencv/opencv_contrib.git"

    local work_dir=$1

    if [ -e "${work_dir}/opencv" ];
    then
        pushd "${work_dir}/opencv/build"
        sudo make uninstall
        popd
        sudo rm -r -- "${work_dir}/opencv"
    fi

    if [ -e "${work_dir}/opencv_contrib" ];
    then
        sudo rm -r -- "${work_dir}/opencv_contrib"
    fi

    pushd "${work_dir}"
    if git clone --depth 1 --branch "${OPENCV_INSTALL_VERSION}" "${OPENCV_REPO_URL}" opencv;
    then
       git clone --depth 1 --branch "${OPENCV_INSTALL_VERSION}" "${OPENCV_CONTRIB_REPO_URL}" opencv_contrib

       cd opencv
       mkdir -p build && cd build

       cmake -D CMAKE_BUILD_TYPE=Release \
           -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
           -D OPENCV_FOR_THREADS_NUM=4 \
           -D CMAKE_EXPORT_COMPILE_COMMANDS=1 \
           ..
       if make -j $(nproc);
       then
           sudo make install
       fi
    fi
    popd
}

function install_glslViewer () {
    GLSL_VIEWER_REPO_URL="https://github.com/patriciogonzalezvivo/glslViewer.git"

    local work_dir=$1

    if [ -e "${work_dir}/glslViewer" ];
    then
        pushd "${work_dir}/glslViewer/build"
        sudo make uninstall
        popd
        sudo rm -r -- "${work_dir}/glslViewer"
    fi

    cd "${work_dir}"

    if git clone --depth 1 "${GLSL_VIEWER_REPO_URL}" glslViewer;
    then
        cd glslViewer
        git submodule init
        git submodule update
        mkdir -p build && cd build

        cmake ..
        if make;
        then
            sudo make install
        fi
    fi
    popd
}


### ----- MAIN -----

function main() {
    mkdir -p ${HOME}/.config
    mkdir -p ${HOME}/.local

    mkdir -p ${HOME}/.local/installer
    WORK_DIR="${HOME}/.local/installer"
    readonly WORK_DIR

    if [ $# -eq 0 ];
    then
        setup_config
        install_basic_packages
        add_apt_repositories
        install_packages
        install_gtest "${WORK_DIR}"
        install_fmt "${WORK_DIR}"
        install_rust "${WORK_DIR}"
        install_neovim "${WORK_DIR}"
        setup_neovim
        setup_ssh
        switch2zsh
    elif [ $# -eq 2 ];
    then
        if [ $1 = "install" ];
        then
            if [ $2 = "package" ];
            then
                install_packages
            fi
            if [ $2 = "rust" ];
            then
                install_rust
            fi
            if [ $2 = "neovim" ];
            then
                install_neovim "${WORK_DIR}"
            fi
            if [ $2 = "bear" ];
            then
                install_bear "${WORK_DIR}"
            fi
            if [ $2 = "gtest" ];
            then
                install_gtest "${WORK_DIR}"
            fi
            if [ $2 = "fmt" ];
            then
                install_fmt "${WORK_DIR}"
            fi
            if [ $2 = "opencv" ];
            then
                install_opencv "${WORK_DIR}"
            fi
            if [ $2 = "tex" ];
            then
                install_tex
            fi
            if [ $2 = "dotnet" ];
            then
                install_dotnet
            fi
            if [ $2 = "glslViewer" ];
            then
                install_glslViewer "${WORK_DIR}"
            fi
        elif [ $1 = "setup" ];
        then
            if [ $2 = "ssh" ];
            then
                setup_ssh
            fi
            if [ $2 = "neovim" ];
            then
                setup_neovim
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
}

main "$@"

