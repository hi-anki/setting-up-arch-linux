localectl status
localectl set-locale LANG=en_US.UTF-8
localectl set-keymap us
loadkeys us
setfont ter-132b

cat /sys/firmware/efi/fw_platform_size/
# must return 64

ip link
# have enp0s3 up

fdisk -l
