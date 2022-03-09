#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>

int main(){
	void *handler;
	int (*addss)(int,int);
	int (*subss)(int,int);
	int (*multss)(int,int);
	int (*divss)(int,int);
	handler=dlopen("./dlib.so.0.1",RTLD_LAZY);
	if (!handler){
		puts("error on load lib");
		exit(1);
	}
	addss=dlsym(handler,"adds");
	if(dlerror()!=NULL){
		puts("error on load function");
		exit(1);
	}
	subss=dlsym(handler,"subs");
	if(dlerror()!=NULL){
		puts("error on load function");
		exit(1);
	}
	multss=dlsym(handler,"mults");
	if(dlerror()!=NULL){
		puts("error on load function");
		exit(1);
	}
	divss=dlsym(handler,"divs");
	if(dlerror()!=NULL){
		puts("error on load function");
		exit(1);
	}
	printf("add:%d\n",addss(10,10));
	printf("sub:%d\n",subss(10,1));
	printf("mul:%d\n",multss(10,10));
	printf("div:%d\n",divss(10,2));
	dlclose(handler);
	return 0;
}
