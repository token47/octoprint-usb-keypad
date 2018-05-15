# octoprint-usb-keypad
A quick hack to control a 3d printer with an USB Keypad.

Please help improving it and send me ideas or pull requests.

- you need octoprint, in my case octopi
- you need actkbd installed on the pi (just clone git and run make, don't install)
- you need an usb keypad, a numeric only one will be perfect

- test keyscans with "actkbd -d <dev> -s -n"
- change the actkbd.conf file to match your keypad and the path for the octoprint-remote.sh script
- put your octoprint API in the ~/.octoprint.apikey file
- run start.sh

- the keyboard will not be seen by the system, the actkbd is configured to "grab" it from the system so keypresses will not appear on the console (like "floating" the keyboard with xinput).
- The first 4 keys at the top are shifts (more like locks, in fact, since they stay locked). There are 5 tottaly independent layouts for the rest of the keys (native and the four shifted ones). The led on the keyboard should light when any of the shifts are locked). Pressing another shift when one is already pressed changes the active shift, press the same again to deactivate.

This is a quick and dirty hack. The shell script is not the best way to implement this, and in fact, all of this should be a plugin inside octoprint itself instead of using the REST API. But it works and I'm happy. Help me improve it.

Look at the layout.txt file to understand the pre-configured layouts.

