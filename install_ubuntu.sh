echo "Installing core tools"
sudo apt install git curl python-pip autoconf

echo "Upgrading pip"
sudo pip install --upgrade pip>=18.0

echo "Installing ffmpeg and required tools"
sudo apt install ffmpeg libavformat-dev libavcodec-dev libavdevice-dev libavutil-dev libswscale-dev libavresample-dev libavfilter-dev libssl-dev

echo "Installing build tools like build-essential automake clang"

sudo apt install autoconf automake clang clang-3.8 libtool pkg-config build-essential
sudo apt install libarchive-dev

echo "Installing qt"

sudo apt install python-qt4

echo "Installing zmq required for replaying driving data"
curl -LO https://github.com/zeromq/libzmq/releases/download/v4.2.3/zeromq-4.2.3.tar.gz
tar xfz zeromq-4.2.3.tar.gz
cd zeromq-4.2.3
./autogen.sh
./configure CPPFLAGS=-DPIC CFLAGS=-fPIC CXXFLAGS=-fPIC LDFLAGS=-fPIC --disable-shared --enable-static
make
sudo make install
cd ..

echo "Installing Cap'n Proto"

curl -O https://capnproto.org/capnproto-c++-0.6.1.tar.gz
tar xvf capnproto-c++-0.6.1.tar.gz
cd capnproto-c++-0.6.1
./configure --prefix=/usr/local CPPFLAGS=-DPIC CFLAGS=-fPIC CXXFLAGS=-fPIC LDFLAGS=-fPIC --disable-shared --enable-static
make -j4
sudo make install

cd ..
sudo pip install -r requirements.txt




