#!/bin/bash
int=1
while [ $int -gt 0 ]
do
#建立一个参数int用来循环的

echo "第$int次循环"
#echo "循环后ip1staus是$ip1staus"

#第一个ip地址
ip1="192.168.3.142"
#FU

#ip1stausDefault="on"
#设置一个默认ip是活的on还是死的off,用来和实时ip1staus进行对比

#ip1staus="on"
#设置一个参数，通过下边的if语句判断ip1staus是on活的还是死的off

#ip1statusChange="same"
#用来对比看看ip有没有变化

#echo "ip1是$ip1"
ping -c 30 "$ip1" > /dev/null
if [ "$?" -eq "0" ]; then
    ip1staus="on"
    echo "ip1FU的状态是$ip1staus"
else
    ip1staus="off"
    echo "ip1FU的状态是$ip1staus"
fi
#echo "出了循环ip1的状态变量是$ip1staus"

if [ "$ip1staus" = "$ip1stausDefault" ]; then
	echo "ip1FU一致"
    ip1statusChange="same"
else
	echo "ip1FU不一致"
    ip1statusChange="diffrent"
    ip1stausDefault="$ip1staus"
    echo $ip1stausDefault
fi
#echo $ip1statusChange
#
#
#第二个ip地址
ip2="192.168.3.110"
#ZhouJ
#第一个ip地址

#ip2stausDefault="on"
#设置一个默认ip是活的on还是死的off,用来和实时ip2staus进行对比

#ip2staus="on"
#设置一个参数，通过下边的if语句判断ip2staus是on活的还是死的off

#ip2statusChange="same"
#用来对比看看ip有没有变化

#echo "ip2是$ip2"
ping -c 30 "$ip2" > /dev/null
if [ "$?" -eq "0" ]; then
    ip2staus="on"
    echo "ip2ZhouJ的状态是$ip2staus"
else
    ip2staus="off"
    echo "ip2ZhouJ的状态是$ip2staus"
fi
#echo "出了循环ip2的状态变量是$ip2staus"

if [ "$ip2staus" = "$ip2stausDefault" ]; then
	echo "ip2ZhouJ一致"
    ip2statusChange="same"
else
	echo "ip2ZhouJ不一致"
    ip2statusChange="diffrent"
    ip2stausDefault="$ip2staus"
    echo $ip2stausDefault
fi
#echo $ip2statusChange
#
#
#
#第三个ip地址
ip3="192.168.3.140"
#ZG

#ip3stausDefault="on"
#设置一个默认ip是活的on还是死的off,用来和实时ip3staus进行对比

#ip3staus="on"
#设置一个参数，通过下边的if语句判断ip3staus是on活的还是死的off

#ip3statusChange="same"
#用来对比看看ip有没有变化

#echo "ip3是$ip3"
ping -c 30 "$ip3" > /dev/null
if [ "$?" -eq "0" ]; then
    ip3staus="on"
    echo "ip3ZG的状态是$ip3staus"
else
    ip3staus="off"
    echo "ip3ZG的状态是$ip3staus"
fi
#echo "出了循环ip3的状态变量是$ip3staus"

if [ "$ip3staus" = "$ip3stausDefault" ]; then
	echo "ip3ZG一致"
    ip3statusChange="same"
else
	echo "ip3ZG不一致"
    ip3statusChange="diffrent"
    ip3stausDefault="$ip3staus"
    echo $ip3stausDefault
fi
#echo $ip3statusChange
#
#
#第四个ip地址
ip4="192.168.3.122"
#SG

#ip4stausDefault="on"
#设置一个默认ip是活的on还是死的off,用来和实时ip4staus进行对比

#ip4staus="on"
#设置一个参数，通过下边的if语句判断ip4staus是on活的还是死的off

#ip4statusChange="same"
#用来对比看看ip有没有变化

#echo "ip4是$ip4"
ping -c 30 "$ip4" > /dev/null
if [ "$?" -eq "0" ]; then
    ip4staus="on"
    echo "ip4SG的状态是$ip4staus"
else
    ip4staus="off"
    echo "ip4SG的状态是$ip4staus"
fi
#echo "出了循环ip4的状态变量是$ip4staus"

if [ "$ip4staus" = "$ip4stausDefault" ]; then
	echo "ip4SG一致"
    ip4statusChange="same"
else
	echo "ip4SG不一致"
    ip4statusChange="diffrent"
    ip4stausDefault="$ip4staus"
    echo $ip4stausDefault
fi
#echo $ip4statusChange
#
#

#第五个ip地址LG
ip5="192.168.3.151"

ping -c 30 "$ip5" > /dev/null
if [ "$?" -eq "0" ]; then
    ip5staus="on"
    echo "ip5LG的状态是$ip5staus"
else
    ip5staus="off"
    echo "ip5LG的状态是$ip5staus"
fi
#echo "出了循环ip5的状态变量是$ip5staus"

if [ "$ip5staus" = "$ip5stausDefault" ]; then
	echo "ip5LG一致"
    ip5statusChange="same"
else
	echo "ip5LG不一致"
    ip5statusChange="diffrent"
    ip5stausDefault="$ip5staus"
    echo $ip5stausDefault
fi


#发送TG提示消息
if [ "$ip1statusChange" = "diffrent" ] || [ "$ip2statusChange" = "diffrent" ] || [ "$ip3statusChange" = "diffrent" ] || [ "$ip4statusChange" = "diffrent" ]; then
#if [ "$ip1statusChange" = "diffrent" ]; then
    curl --data chat_id="914823868" --data "text=
    网络在线情况
    时间: `date +"%m-%d %H:%M"`
    付姐：$ip1staus
    周姐：$ip2staus
    石哥：$ip4staus
    周哥：$ip3staus
    刘哥：$ip5staus
    " "https://api.telegram.org/bot1438292076:AAF6sKD0fG-fDheaxH74CL-CyPM6Lyd4Ofw/sendMessage"
else
	echo "没有变化"
fi

int=`expr $int + 1`
sleep 600
done