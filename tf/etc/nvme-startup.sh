#!/bin/bash


for dev in /dev/nvme0n*;
do
  dev_list="$dev_list $dev"
done

mkdir /ssd
chmod -R 777 /ssd

n_ssd=$(ls /dev/nvme0n* | wc -l)

if [ "$n_ssd" -gt "1" ]
then

  # Fuse the local SSDs to /dev/md0 and make md0 on ext4 volume 
  mdadm --create /dev/md0 --level=0 --raid-devices=${n_ssd} ${dev_list}
  mkfs.ext4 -F /dev/md0
  # Mount /dev/md0 to /scratch
  echo "UUID=$(blkid -s UUID -o value /dev/md0) /ssd ext4 discard,defaults,nofail 0 2" | tee -a /etc/fstab

else

  mkfs.ext4 -F $dev_list
  echo "UUID=$(blkid -s UUID -o value $dev_list) /ssd ext4 discard,defaults,nofail 0 2" | tee -a /etc/fstab

fi
