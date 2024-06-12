printf "\x1bc\x1b[43;37m"
roots=/mnt/isos
tmps=/tmp/lists.txt
tmps2=/tmp/lists2.txt
sudo mount /tmp/my.img $roots -o loop -t vfat 
sudo chroot $roots /usr/bin/bash
sudo chroot / /usr/bin/bash
sudo umount $roots
