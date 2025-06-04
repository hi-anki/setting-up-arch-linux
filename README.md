- `localectl` is a tool used to view and set (control, basically) system locale and keyboard layout settings in systems using `systemd`.
  - To view current settings, use `localectl status`
  - To set locale, use `localectl set-locale LANG=en_US.UTF-8`
  - To set console keyboard layout, use `localectl set-keymap us`
 
- Setting up locales is important for proper language recognition.
- Setting up console keyboard layout is necessary to bring the interpretation of our keybinding by the console on the same page.
  - Example: If the locale is set to something else and you use a US keyboard, pressing Q might not be interepreted as Q.
  - As there are are other formats like AZERTY in France (fr) and QWERTZ in Germany (de)
 
- Therefore, setting up the locales and console keyboard mapping is the first step to ensure that our input is interpreted exactly as we think.

------------------

- Since the font is a little low in size, to increase it, we use setfont as, `setfont ter-132b`

