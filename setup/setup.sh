#!/usr/bin/sh

User=`whoami`
DOTFILES_TOP_DIR=$(cd ..; pwd)

# For library installation
mkdir -p ~/Library
mkdir -p ~/installer

GOOGLE_TEST_INSTALL_VERSION="v1.11.0"
OPENCV_INSTALL_VERSION="4.5.5"

sudo apt update

sudo apt install -y \
	lsb-release \
	software-properties-common \
	apt-transport-https \
	ca-certificates \
	curl \
	cmake

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt update
sudo apt upgrade -y


echo "*************************************************"
echo "*  Install packages                             *"
echo "*************************************************"

apt-cache policy docker-ce

sudo apt install -y \
	git \
	zip \
	unzip \
	build-essential \
	zsh \
	neovim \
	gcc \
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
	xdvik-ja \
	evince \
	docker-ce \
	lua5.3


echo "*************************************************"
echo "*  Setup Symbolic links                         *"
echo "*************************************************"

#sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
#sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2
#
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 1
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 2
#
#sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 1
#sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 2


echo "*************************************************"
echo "*  Setup NeoVim                                 *"
echo "*************************************************"

mkdir -p ~/.cache/dein
cd ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.dein/dein
mkdir -p ~/.config
ln -sf $DOTFILES_TOP_DIR/nvim ~/.config/nvim
pip3 install --upgrade pynvim msgpack


echo "*************************************************"
echo "*  Setup Zsh                                    *"
echo "*************************************************"

echo "...skip..."


echo "*************************************************"
echo "*  Setup ssh connection                         *"
echo "*************************************************"

sudo systemctl enable ssh
sudo systemctl restart ssh


echo "*************************************************"
echo "*  Install Docker                               *"
echo "*************************************************"

sudo systemctl status docker


echo "*************************************************"
echo "*  Install universal ctags                      *"
echo "*************************************************"

cd ~/installer
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install


echo "*************************************************"
echo "*  Install Google Test                          *"
echo "*************************************************"

cd ~/installer
git clone https://github.com/google/googletest.git
cd googletest
git checkout -b $GOOGLE_TEST_INSTALL_VERSION refs/tags/$GOOGLE_TEST_INSTALL_VERSION
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=~/Library ..
make -j$(nproc)
sudo make install


echo "*************************************************"
echo "*  Install OpenCV                               *"
echo "*************************************************"

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
make -j$(nproc)
sudo make install

