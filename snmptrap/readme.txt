请把脚本copy在CEPH admin节点上,例如/home/cephsnmp

1. 根据实际情况，修改文件ceph-snmp.conf
  配置对应ceph集群信息
  配置SNMP server的community和host ip
  SNMP Server导入MIB库: CEPH-MIB.txt

2. 运行/home/cephsnmp/ceph-snmptrap.py 测试是否成功, 

3. 配置在后台定时运行crontab -e
*/5 * * * * /home/cephsnmp/ceph-snmptrap.py
