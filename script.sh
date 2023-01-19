cd ~ 
mkdir -p minimal-linux/build/sources
mkdir -p simple-linux/build/downloads
mkdir -p simple-linux/build/out
mkdir -p simple-linux/linux
sudo apt update
sudo apt install --yes make build-essential bc bison flex libssl-dev libelf-dev wget cpio fdisk extlinux dosfstools qemu-system-x86
