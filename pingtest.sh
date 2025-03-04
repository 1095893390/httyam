#!/bin/bash
int=1
while [ $int -le 12 ]
do
#建立一个参数int用来循环的

echo "第$int次循环"
#echo "循环后ip1staus是$ip1staus"

ip1="192.168.1.1"
#第一个ip地址

ip1stausDefault="on"
#设置一个默认ip是活的on还是死的off,用来和实时ip1staus进行对比

ip1staus="off"
#设置一个参数，通过下边的if语句判断ip1staus是on活的还是死的off

ip1statusChange="same"
#用来对比看看ip有没有变化

#echo "ip1是$ip1"
ping -c 1 "$ip1" > /dev/null
if [ "$?" -eq "0" ]; then
	echo "ip1 is up."
    ip1staus="on"
    echo "ip1的状态是$ip1staus"
else
	echo "ip1 is down."
    ip1staus="off"
    echo "ip1的状态是$ip1staus"
fi
#echo "出了循环ip1的状态变量是$ip1staus"

if [ "$ip1staus" = "$ip1stausDefault" ]; then
	echo "ip1一致"
    ip1statusChange="same"
else
	echo "ip1不一致"
    ip1statusChange="diffrent"
fi
#echo $ip1statusChange

#
#
#
#
#下边是第二个ip
ip2="192.168.31.229"

ip2stausDefault="on"
#设置一个默认ip是活的on还是死的off,用来和实时ip2staus进行对比

ip2staus="off"
#设置一个参数，通过下边的if语句判断ip2staus是on活的还是死的off

ip2statusChange="same"
#用来对比看看ip有没有变化

#echo "ip2是$ip2"
ping -c 1 "$ip2" > /dev/null
if [ "$?" -eq "0" ]; then
	echo "ip2 is up."
    ip2staus="on"
    echo "ip2的状态是$ip2staus"
else
	echo "ip2 is down."
    ip2staus="off"
    echo "ip2的状态是$ip2staus"
fi
#echo "出了循环ip2的状态变量是$ip2staus"

if [ "$ip2staus" = "$ip2stausDefault" ]; then
	echo "ip2一致"
    ip2statusChange="same"
else
	echo "ip2不一致"
    ip2statusChange="diffrent"
fi
int=`expr $int + 1`
sleep 5
done