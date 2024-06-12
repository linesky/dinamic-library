printf "\x1bc\x1b[43;37m"
roots=/mnt/isos
tmps=/mnt/isos/tmp/lists.txt
tmps2=/mnt/isos/tmp/lists2.txt
mkdir /tmp/examples
gcc -c -o /tmp/dlib.a dlib.c
gcc -shared -o /tmp/dlib.so.0.1 /tmp/dlib.a
gcc -o /tmp/my duseit.c  -ldl
dd if=/dev/zero of="/tmp/my.img" bs=1k count=180000
dd if=/dev/zero of="/tmp/image" bs=1k count=5000
sudo chmod 777 "/tmp/my.img"
sudo chmod 777 "/tmp/image"
echo hello
sudo mkfs.vfat "/tmp/my.img" 
sudo mkfs.vfat "/tmp/image" 
sudo chmod 777 "/tmp/my.img"
sudo chmod 777 "/tmp/image"
mkdir $roots
sudo mount "/tmp/my.img" $roots -o loop -t vfat 
mkdir -p $roots/tmp
printf "" > $tmps
printf "" > $tmps2
sudo chmod 777 $tmps
sudo chmod 777 $tmps2
mkdir -p $roots/boot
mkdir -p $roots/usr
mkdir -p $roots/usr/bin
mkdir -p $roots/bin
mkdir -p $roots/etc
mkdir -p $roots/lib
mkdir -p $roots/dev
mkdir -p $roots/boot
mkdir -p $roots/proc
mkdir -p $roots/proc/self
mkdir -p $roots/usr/include
mkdir -p $roots/lib/i386-linux-gnu
mkdir -p $roots/mnt
mkdir -p $roots/data
mkdir -p $roots/home
mkdir -p $roots/root
printf "#!/bin/bash\n/bin/bash --login" > $roots/linuxrc 
unzip -u ./file/CD_root.zip -d $roots
gzip /tmp/image
mv /tmp/image.gz $roots/boot
cp /boot/vmlinuz $roots/boot
cp /vmlinuz $roots/boot
cp ./file/syslinux.cfg $roots/boot/syslinux
cp /lib/i386-linux-gnu/ld-linux.so.* $roots/lib/i386-linux-gnu/
cp /lib/i386-linux-gnu/libc.so.* $roots/lib/i386-linux-gnu/
cp  /lib/i386-linux-gnu/crt*.* $roots/lib/i386-linux-gnu/
cp  /lib/i386-linux-gnu/libc.a $roots/usr/bin
cp  /lib/i386-linux-gnu/libc.a $roots/bin
cp  /lib/i386-linux-gnu/libc.a $roots/lib/i386-linux-gnu/
cp  /usr/bin/bash $roots/usr/bin
cp  /usr/bin/bash $roots/bin
cp  /usr/bin/ld $roots/usr/bin
cp  /usr/bin/ld $roots/bin
cp  /usr/bin/sh $roots/usr/bin
cp  /usr/bin/sh $roots/bin
cp  /usr/bin/sh $roots/usr/bin
cp  /usr/bin/sh $roots/bin
cp  /usr/bin/ls $roots/usr/bin
cp  /usr/bin/ls $roots/bin
cp  /usr/bin/ldd $roots/usr/bin
cp  /usr/bin/ldd $roots/bin
cp  /usr/bin/cat $roots/usr/bin
cp  /usr/bin/cat $roots/bin
cp /tmp/my $roots/bin
cp /tmp/my $roots/usr/bin
cp /tmp/libc.o $roots/bin
cp /tmp/libc.o $roots/usr/bin
cp /tmp/libc.o $roots/lib
cp /tmp/dlib.a $roots/bin
cp /tmp/dlib.a $roots/usr/bin
cp /tmp/dlib.a $roots/lib
cp /tmp/dlib.so.0.1 $roots/bin
cp /tmp/dlib.so.0.1 $roots/usr/bin
cp /tmp/dlib.so.0.1 $roots/lib
printf "" > $roots/dev/null
printf "" > $roots/dev/stdio
printf "" > $roots/dev/stdout
printf "" > $roots/dev/stdin
printf "" > $roots/dev/sda
printf "" > $roots/dev/sda1
printf "" > $roots/dev/data
printf "" > $roots/dev/ram0
printf "" > $roots/dev/hda
printf "" > $roots/dev/hda0
chmod 777 $roots/bin/*
chmod 777 $roots/usr/bin/*
sudo chmod 777 $tmps
sudo chmod 777 $tmps2
printf "" > $tmps
list1=$(ls $roots/usr/bin/*)
for l1 in $list1
do
ldd "$l1" | grep  '/lib/' >> $tmps
done
awk '{for(i=1;i<=NF;i++) if($i ~ /\/lib\//) print $i}' $tmps > $tmps2
while IFS= read -r l1
do

rt="$roots$l1"
cp "$l1" "$rt" 
done < "$tmps2"
sudo umount  $roots
sudo mount /tmp/my.img $roots -o loop=/dev/loop1  -t vfat
sudo syslinux /dev/loop1
sudo umount  $roots

