gcc -c -o dlib.a dlib.c
gcc -shared -o dlib.so.0.1 dlib.a
sudo cp dlib.so.0.1 /opt/lib
sudo cp dlib.so.0.1 /lib/
gcc -o my duseit.c -ldl
