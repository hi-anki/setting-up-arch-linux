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

