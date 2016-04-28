# CentOSScrpit

在CentOS7 下可以使用，部分脚本对CentOS6 无效
目前可以监控的功能如下：
* cpu_mon.sh 监控CPU利用率
* mem_mon.sh 监控内存利用率
* io_mon.sh 监控磁盘利用率
* ifrate_mon.sh 监控网卡速率

依赖包：
yum install sysstat 

-----
2016-04-28 18:40

1. 增加V2版本，可以重定向到文件，便于分析    
2. V2版本中，cpu_mon.sh的值相对没有V1版本中的正确，仅供参考    
3. V2版本中的 io_mon.sh的值是错误的，请勿使用,目前还没有找到对应修改的方法    



