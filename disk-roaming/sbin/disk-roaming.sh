#/bin/sh

DEVICE=$1

MOUNTPOINT=`mount | grep /dev/$DEVICE | awk -F " " '{ print $3 }'`
if [ -z "$MOUNTPOINT" ]; then
   echo "fail to get the ceph mount point"
   exit 1
fi

#exit 1

CHAR=`expr index "$MOUNTPOINT" "-"`
echo $CHAR
OSDID=${MOUNTPOINT:$CHAR}

echo "stop osd deamon: $OSDID"
systemctl stop ceph-osd@"$OSDID".service

sleep 10

echo "umount the filesystem: $MOUNTPOINT"
umount $MOUNTPOINT
if [ $? != 0 ]; then
   echo "fail to umount" >> /tmp/disk-roaming.log
   exit 1
fi


exit 0
