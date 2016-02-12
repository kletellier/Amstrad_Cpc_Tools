#!/bin/bash
 
## Main Paths
SETUP_PATH="${PWD}"
BIN_PATH="${PWD}/bin"
SAMPLE_PATH="${PWD}/samples"
echo "Install Cpc Tools"
echo "Binary folder : ${BIN_PATH}"
echo "Sample folder : ${SAMPLE_PATH}"
echo "Clear folders"
rm -rf $BIN_PATH
rm -rf bin CapriceRPI iDSK-0.13 pasmo-0.5.3
echo "Create Folders"
mkdir $BIN_PATH
cd $SETUP_PATH
echo "Install CapriceRpi2 emulator"
# install CapriceRpi2 
apt-get install -y git build-essential libsdl-image1.2-dev libsdl-ttf2.0-dev
git clone https://github.com/kletellier/CapriceRPI.git --branch HiRes4All
cd CapriceRPI/src
make
cp capriceRPI $BIN_PATH

cd $SETUP_PATH
echo "Install iDsk Tools for creating disk image"
# install iDsk

tar -xzvf iDSK-0.13.tgz 
cd $SETUP_PATH/iDSK-0.13
make
cp $SETUP_PATH/iDSK-0.13/bin/iDSK $BIN_PATH
rm -rf $SETUP_PATH/iDSK-0.13

cd $SETUP_PATH
echo "Install pasmo for assembling asm code"
# install Pasmo
tar -xzvf pasmo-0.5.3.tgz
cd $SETUP_PATH/pasmo-0.5.3
./configure
make
cp pasmo $BIN_PATH
rm -rf $SETUP_PATH/pasmo-0.5.3
# install hfe tools
cd $SETUP_PATH
wget https://github.com/jfdelnero/HxCFloppyEmulator_software/archive/HxCFloppyEmulator_software_V1_6_11_16.zip
unzip $SETUP_PATH/HxCFloppyEmulator_software_V1_6_11_16.zip
cd $SETUP_PATH/HxCFloppyEmulator_software-HxCFloppyEmulator_software_V1_6_11_16
cd linux
make hxcfloppyemulator_convert
cp hxcfloppyemulator_convert $BIN_PATH
# compile sample
cd $BIN_PATH
# assemble hello world file
./pasmo $SAMPLE_PATH/helloworld.asm $SAMPLE_PATH/hw.bin
# create disk file
./iDSK $SAMPLE_PATH/hello.dsk -n -i $SAMPLE_PATH/hw.bin -e 4000 -c 4000 -t 1
# create hfe file
./hxcfloppyemulator_convert $SAMPLE_PATH/hello.dsk -HFE