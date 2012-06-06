#!/usr/bin/sh
if (( $1 < 0 ))
then
	echo "Undefined";exit
fi
scale=$1
bc <<E
scale=$scale
define e(n){ return ((1 + (1.0/n))^n); }
define abs(a){ if(a >= 0){return a; }else{return -a;}}
err=10^-$1;i=1;v=0;v1=err;
while(abs(v1-v)>=err){
	v=v1;v1=e(i);
	if(v1 < v){ v1=v; break; }
	v1;/*just to trace the progress*/
	i*=2;
};
v1;
E
#GPL Licenced by Lutalo Joseph Willrich (nemesisfixx) ~ nemesisfixx@gmail.com
