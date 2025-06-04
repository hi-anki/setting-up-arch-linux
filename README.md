- `localectl` is a tool used to view and set (control, basically) system locale and keyboard layout settings in systems using `systemd`.
  - To view current settings, use `localectl status`
  - To set locale, use `localectl set-locale LANG=en_US.UTF-8`
  - To set console keyboard layout, use `localectl set-keymap us`
  - To set the keyboard layout, `loadkeys us`
 
- Setting up locales is important for proper language recognition.
- Setting up console keyboard layout is necessary to bring the interpretation of our keybinding by the console on the same page.
  - Example: If the locale is set to something else and you use a US keyboard, pressing Q might not be interepreted as Q.
  - As there are are other formats like AZERTY in France (fr) and QWERTZ in Germany (de)
 
- Therefore, setting up the locales and console keyboard mapping is the first step to ensure that our input is interpreted exactly as we think.

------------------

- Since the font is a little low in size, to increase it, we use setfont as, `setfont ter-132b`

------------------

- Next we have to verify the boot mode, using `cat /sys/firmware/efi/fw_platform_size/`
  - This is done to find which boot mode the motherboard is using, UEFI or BIOS.
  - If 64 is returned, it is using a 64-bit UEFI.
  - If 32 is returned, it is using a 32-bit IA32 UEFI
  - If `No such file or directory` is returned, it is using BIOS.
 
- This is done to because each boot mode has different partioning requirements, bootloader installation and other subtle problems.
- Since I am installing arch linux on virtual box, which uses legacy BIOS by default, I need to extend support for EFI, because UEFI uses ESp (EFI System Partioning). This can be done by going into machine settings and enabling the EFI option in the processor section.
- I found this when I checked the hardware option in the boot selection option. There I found that vbox by default uses BIOS.

- And now, it says 64. Perfect.

------------------

- Use `ip link` to list all the network interfaces available.
  - I got `enp0s3`. Make a note of it.
  - Also, make sure it is enabled. Look for `state UP`
- For a variety of reasons, the wireless card (WWAN and WLAN) might be blocked by rfkill.
- `rfkill` is a Linux subsystem and command-line tool used to query and control the wireless devices' power state.
- `enp0s3` means ethernet on pci bus 0, slot 3.
- But we need something like `wlp2s0` or `wwp0s20u2` for making wireless connections.
- But that's not a problem as our ethernet is working fine.
- This problem is arising because vbox only exposes ethernet. To use WIFI, we need dedicate solutions. Lets keep them aside for now.
- Test by `ping google.com`

------------------

- Now its time to partition the disks.
- First check all the available block devices, `lsblk` or `fdisk -l`
- loop0 and sr0 can be ignored. What concerns us is `/dev/sda`
- Partitioning means splitting your physical block device (like /dev/sda) into logical sections (partitions). Each partition acts like an independent disk that can hold a file system.
- In monolithic layout, everything lives at /
- In split layout, the OS lives at /, home lives inside /home, and boot files in /boot. It provides better isolation and clarity.

















