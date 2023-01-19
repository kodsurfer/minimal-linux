cd ~ 
mkdir -p minimal-linux/build/sources
mkdir -p minimal-linux/build/downloads
mkdir -p minimal-linux/build/out
mkdir -p minimal-linux/linux
sudo apt update
sudo apt install --yes make build-essential bc bison flex libssl-dev libelf-dev wget cpio fdisk extlinux dosfstools qemu-system-x86

