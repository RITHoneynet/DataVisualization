# Data Visualization
Here is the code from my ShmooCon 2015 "The Dark Art of Data Visualization" talk.

Pull requests are welcome for any added functionality or bug fixes.

## Gltail
In the gltail folder you can find parsers for Bro conn, HTTP, SSL, and DNS logs. I'm sill working on getting the event action to work in some of the parsers, but all activity actions work. I will update the parsers as I add functionality.

I have also Included a sample config file `gltail_locale.yaml`. This is set up the same way as my ShmooCon demo except that it pulls from file locally instead of remote.

## Skyrails
The Python script used to send data to skyrail requires the `python-sshtail` library to run. You can find it at https://github.com/praekelt/python-sshtail.

I will be adding some documentation on what I Learned about the Skyrails scripting language at a later date.
