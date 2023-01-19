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
