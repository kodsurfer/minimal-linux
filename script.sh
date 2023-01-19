cd ~ 
mkdir -p minimal-linux/build/sources
mkdir -p minimal-linux/build/downloads
mkdir -p minimal-linux/build/out
mkdir -p minimal-linux/linux
sudo apt update
sudo apt install --yes make build-essential bc bison flex libssl-dev libelf-dev wget cpio fdisk extlinux dosfstools qemu-system-x86

cd minimal-linux/build
wget -P downloads  https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.15.79.tar.xz
wget -P downloads https://busybox.net/downloads/busybox-1.35.0.tar.bz2

tar -xvf downloads/linux-5.15.79.tar.xz -C sources
tar -xjvf downloads/busybox-1.35.0.tar.bz2 -C sources

cd sources/busybox-1.35.0
make defconfig
make LDFLAGS=-static
cp busybox ../../out/
cd ../linux-5.15.79
make defconfig
make -j8 || exit
cp arch/x86_64/boot/bzImage ~/minimal-linux/linux/vmlinuz-5.15.79

mkdir -p ~/minimal-linux/build/initrd
cd ~/minimal-linux/build/initrd
vi init

chmod 777 init
mkdir -p bin dev proc sys
cd bin
cp ~/minimal-linux/build/out/busybox ./
for prog in $(./busybox --list); do ln -s /bin/busybox $prog; done

cd ..
find . | cpio -o -H newc > ~/minimal-linux/linux/initrd-busybox-1.35.0.img

cd ~/minimal-linux/linux
qemu-system-x86_64 -kernel vmlinuz-5.15.79 -initrd initrd-busybox-1.35.0.img -nographic -append 'console=ttyS0'

