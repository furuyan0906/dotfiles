#!/usr/bin/sh


User=`whoami`
DOTFILES_TOP_DIR=$(cd $(dirname $0)/..; pwd)

GOOGLE_TEST_INSTALL_VERSION="v1.11.0"
OPENCV_INSTALL_VERSION="4.7.0"
FMT_INSTALL_VERSION="9.1.0"
LZ4_INSTALL_VERSION="v1.9.4"
LUAROCKS_INSTALL_VERSION="3.9.2"

LOCAL_DITFILE="~/.zshrc.local"


function init_setup_script () {
	if [ -z $(which brew) ]; then
		# Uninstall all brew_installed packages
		brew clean --force $(brew list)

		# Uninstall homebrew
		NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
	fi

	# Install homebrew
	bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# For library installation
	mkdir -p ~/Library
	mkdir -p ~/installer

	echo "export LD_LIBRARY_PATH=~/Library/lib:$LD_LIBRARY_PATH" >> $LOCAL_DITFILE
	export LD_LIBRARY_PATH=~/Library/lib:$LD_LIBRARY_PATH

	# Install multipass
	brew install --cask multipass
}

function install_packages () {
	echo "* -------------------------------------------------------------"
	echo "*  Install packages"
	echo "*"

	brew install --cask \
		multipass \
		google-chrome \
		iterm2 \
		visual-studio-code \
        
   		        
	brew install \
		google-japanese-ime \
		git \
		zip \
		unzip \
		build-essential \
		zsh \
		neovim \
		gcc \
		nodejs \
		tree \
		cmake \
		flex \
		bison \
		libssl-dev \
		libelf-dev \
		libncurses-dev \
		autoconf \
		libudev-dev \
		libtool \
		openssh-server \
		v4l-utils \
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
		libavformat-dev \
		libavutil-dev \
		libswscale-dev \
		libavresample-dev \
		powerline \
		fonts-powerline \
		ripgrep \
		fd-find \
		
}

function uninstall_packages () {
	echo "* -------------------------------------------------------------"
	echo "*  Uninstall packages"
	echo "*"
	
    brew uninstall --force $(brew list)
}

function install_ctags () {
	echo "* -------------------------------------------------------------"
	echo "*  Install universal ctags"
	echo "*"
	
	if [ -e ~/installer/ctags ]; then
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

function install_google_test () {
	echo "* -------------------------------------------------------------"
	echo "*  Install Google Test"
	echo "*"
	
	if [ -e ~/installer/googletest ]; then
		sudo rm -r ~/installer/googletest
	fi
	
	cd ~/installer
	git clone https://github.com/google/googletest.git
	cd googletest
	git checkout -b $GOOGLE_TEST_INSTALL_VERSION refs/tags/$GOOGLE_TEST_INSTALL_VERSION
	mkdir -p build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=~/Library ..
	make -j$(nproc)
	sudo make install
}

function install_fmt () {
	echo "* -------------------------------------------------------------"
	echo "*  Install fmt"
	echo "*"

	if [ -e ~/installer/fmt ]; then
		sudo rm -r ~/installer/fmt
	fi

	cd ~/installer
	git clone https://github.com/fmtlib/fmt.git
	cd fmt
	git checkout -b $FMT_INSTALL_VERSION refs/tags/$FMT_INSTALL_VERSION
	mkdir -p build && cd build
	cmake -D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=~/Library \
		-D BUILD_SHARED_LIBS=TRUE \
		..
	make -j $(nproc)
	sudo make install
}

function install_opencv () {
	echo "* -------------------------------------------------------------"
	echo "*  Install OpenCV"
	echo "*"

	if [ -e ~/installer/opencv ]; then
		sudo rm -r ~/installer/opencv
	fi
	
	if [ -e ~/installer/opencv_contrib ]; then
		sudo rm -r ~/installer/opencv_contrib
	fi
	
	cd ~/installer
	git clone https://github.com/opencv/opencv.git
	git clone https://github.com/opencv/opencv_contrib.git
	cd opencv
	git checkout -b $OPENCV_INSTALL_VERSION refs/tags/$OPENCV_INSTALL_VERSION
	cd opencv_contrib
	git checkout -b $OPENCV_INSTALL_VERSION refs/tags/$OPENCV_INSTALL_VERSION
	cd opencv
	mkdir -p build && cd build
	cmake -D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=~/Library \
		-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
		-D OPENCV_FOR_THREADS_NUM=4 \
		..
	make -j $(nproc)
	sudo make install
}

function install_rust () {
	echo "* -------------------------------------------------------------"
	echo "*  Install Rust"
	echo "*"
	
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

function install_luarocks () {
	echo "* -------------------------------------------------------------"
	echo "*  Install luarocks"
	echo "*"

	if [ -e ~/installer/luarocks-${LUAROCKS_INSTALL_VERSION}.tar.gz ]; then
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

function install_powershell () {
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

function setup_symbolic_links () {
	echo "* -------------------------------------------------------------"
	echo "*  Setup Symbolic links"
	echo "*"
	
	brew cleanup

	if [ -z $(ls /usr/bin/local | grep gcc-*) ]; then
        ln -sf /usr/bin/local/$(ls /usr/bin/local/gcc-* | head -n 1) /usr/bin/local/gcc
        ln -sf /usr/bin/local/$(ls /usr/bin/local/g++-* | head -n 1) /usr/bin/local/g++
	fi

	#sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
	#sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2
	#
	#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 1
	#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 2

}

function setup_neovim () {
	echo "* -------------------------------------------------------------"
	echo "*  Setup NeoVim"
	echo "*"
	
	mkdir -p ~/.cache/dein
	cd ~/.cache/dein
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh ~/.dein/dein
	mkdir -p ~/.config
	ln -sf $DOTFILES_TOP_DIR/nvim ~/.config/nvim
	pip3 install --upgrade pynvim
	pip3 install --upgrade msgpack
	cargo install tree-sitter-cli
}

function setup_zsh () {
	echo "* -------------------------------------------------------------"
	echo "*  Setup Zsh"
	echo "*"
	
	ln -sf $DOTFILES_TOP_DIR/zsh/.zprofile ~/.zprofile
	ln -sf $DOTFILES_TOP_DIR/zsh/.zshenv ~/.zshenv
	ln -sf $DOTFILES_TOP_DIR/zsh/.zshrc ~/.zshrc
}

function setup_bash () {
	echo "* -------------------------------------------------------------"
	echo "*  Setup Bash"
	echo "*"

    ln -sf $DOTFILES_TOP_DIR/bashrc/.bash_profile ~/.bash_profile
	ln -sf $DOTFILES_TOP_DIR/bashrc/.bashrc ~/.bashrc
}

function setup_ssh () {
	echo "* -------------------------------------------------------------"
	echo "*  Setup ssh connection"
	echo "*"
	
	sudo systemctl enable ssh
	sudo systemctl restart ssh
}

function setup_docker () {
	echo "* -------------------------------------------------------------"
	echo "*  Setup Docker"
	echo "*"
	
	sudo systemctl status docker
}

function switch2zsh () {
	echo "* -------------------------------------------------------------"
	echo "*  Switch to zsh"
	echo "*"
    setup_zsh
	sudo chsh -s $(which zsh) $(whoami)
}

function switch2bash () {
	echo "* -------------------------------------------------------------"
	echo "*  Switch to bash"
	echo "*"
    setup_bash
	sudo chsh -s $(which bash) $(whoami)
}

function set_terminal_multiplexer () {
	ln -sf $DOTFILES_TOP_DIR/tmux/.tmux.conf ~/.tmux.conf
	ln -sf $DOTFILES_TOP_DIR/screen/.screenrc ~/.screenrc
}


if [ $# -eq 0 ]; then
	init_setup_script
	install_packages
	setup_symbolic_links
	install_ctags
	install_google_test
	install_fmt
	install_rust
	install_luarocks
	install_powershell
	setup_neovim
	setup_zsh
	setup_ssh
	setup_docker
	switch2zsh
	set_terminal_multiplexer
elif [ $# -eq 2 ]; then
	if [ $1 == "install" ]; then
		if [ $2 == "package" ]; then
			install_packages
		fi
		if [ $2 == "ctags" ]; then
			install_ctags
		fi
		if [ $2 == "gtest" ]; then
			install_google_test
		fi
		if [ $2 == "fmt" ]; then
		    install_fmt
		fi
		if [ $2 == "opencv" ]; then
			install_opencv
		fi
		if [ $2 == "lz4" ]; then
			install_lz4
		fi
		if [ $2 == "rust" ]; then
			install_rust
		fi
		if [ $2 == "luarocks" ]; then
			install_luarocks
		fi
		if [ $2 == "powershell" ]; then
			install_powershell
		fi
	elif [ $1 == "setup" ]; then
		if [ $2 == "neovim" ]; then
			setup_neovim
		fi
		if [ $2 == "zsh" ]; then
			setup_zsh
		fi
		if [ $2 == "bash" ]; then
			setup_bash
		fi
		if [ $2 == "ssh" ]; then
			setup_ssh
		fi
		if [ $2 == "docker" ]; then
			setup_docker
		fi
		if [ $2 == "cuda" ]; then
			setup_cuda
		fi
		if [ $2 == "terminal_multiplexer" ]; then
		    set_terminal_multiplexer
		fi
	elif [ $1 == "clean" ]; then
		uninstall_packages
	elif [ $1 == "switchto" ]; then
		if [ $2 == "zsh" ]; then
		    switch2zsh
		fi
		if [ $2 == "bash" ]; then
		    switch2bash
		fi
	else
		echo "unsupported usage"
	fi
else
	echo "unsupported usage"
fi

