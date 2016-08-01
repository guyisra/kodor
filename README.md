# kodoor
Open office door using RaspberryPi

# Getting started

## Hardware you need
In order to build a kodoor for your office you'll need the following:
1. Raspberry Pi 3 or Pi 2 (Model B)
2. Micro-USB power cable
3. Micro SD Card - To get started you need an operating system. NOOBS is an easy-to-use operating system install manager for Raspberry Pi.
4. Relay
5. Internet connection (Ethernet or WiFi)

## Setting up the RaspberryPi
1. Install NOOBS on your SD Card
2. Connect the SD card to your RaspberryPi and power up your Pi
3. Install Raspbian as your Pi's OS
4. Connect The Relay to your Pi as showed in this image:
![alt tag](https://s3-eu-west-1.amazonaws.com/visuality/uploads/photo/photo/17/Step_6_-_wiring_relay.png)

5. Connect your relay to the door button
6. Copy the contents of 'raspberry' folder from the repo to your RaspberryPi
7. Run kodor.py script `python kodor.py &`

## Setting up your server
1. Create a new heroku server
2. Install Puma and Redis Gems on the server
3. Clone the repo code into your server

## Using the app
1. Enter the server's url in your phone's browser.
2. Click on the button to **Kopen the door!**
