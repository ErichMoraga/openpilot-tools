echo "Installing core tools"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git
sudo pip install --upgrade pip
# We are not doing the xcode install here of the current version since it is going to crash because the latest version doesnt support stdlibc++
echo "Installing ffmpeg"
brew install ffmpeg
echo "Installing build tools"
brew install autoconf automake libtool llvm pkg-config libarchive qt zeromq


curl -O https://capnproto.org/capnproto-c++-0.6.1.tar.gz
tar xvf capnproto-c++-0.6.1.tar.gz
cd capnproto-c++-0.6.1
./configure --prefix=/usr/local CPPFLAGS=-DPIC CFLAGS=-fPIC CXXFLAGS=-fPIC LDFLAGS=-fPIC --disable-shared --enable-static
make -j4
sudo make install

cd ..
git clone https://github.com/commaai/c-capnproto.git
cd c-capnproto
git submodule update --init --recursive
autoreconf -f -i -s
CFLAGS="-fPIC" ./configure --prefix=/usr/local
make -j4
sudo make install





