# Data Visualization
Here is the code from my ShmooCon 2015 "The Dark Art of Data Visualization" talk.

Pull requests are welcome for any added functionality or bug fixes.

## Gltail
In the gltail folder you can find parsers for Bro conn, HTTP, SSL, and DNS logs. I'm sill working on getting the event action to work in some of the parsers, but all activity actions work. I will update the parsers as I add functionality.

I have also Included a sample config file `gltail_locale.yaml`. This is set up the same way as my ShmooCon demo except that it pulls from file locally instead of remote.

## Skyrails
The Python script used to send data to skyrail requires the `python-sshtail` library to run. You can find it at https://github.com/praekelt/python-sshtail.

I have received permission form Yose Widjaja(the developer of Skyrails) to share the copy of the program that I have. You can find it inside the skyrails folder. Note that these are binaries for the program. The source code is currently not available. Windows is required to run it, but I have had some luck with running with wine on linux. I have also had it work well in a VM. Finally anything in the [skyrailsdist](https://github.com/RITHoneynet/DataVisualization/tree/master/skyrails/skyrailsdist) folder is NOT licensed under GPLv3.

I will be adding some documentation on what I learned about the Skyrails scripting language at a later date.

## Tools
The `replay_bro_log.py` script is a useful tool to test real time data visualization. [Ryan Peck](https://github.com/RyPeck) developed this script for me to use with my testing. It reads Bro logs and will rewrite each line to a new file with a delay according to the timestamp.
