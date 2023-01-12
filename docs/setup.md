
## Set Up Guide

### 1. Installation

BlinkHahaNew application uses nerves version `1.9` . To run nerves on your operating system there are a number of programs required.

Here is a [comprehensive guide](https://hexdocs.pm/nerves/installation.html#content) on  the installation process depending on your operating system.

NB: Previous installations of Erlang and Elixir on macos using brew need to be unistalled and use `ASDF` for installation.


### 2. Getting Started 

We highly recommend understanding the following [terms](https://hexdocs.pm/nerves/getting-started.html#common-terms) before proceeding .


To start your Nerves app:
  * `export MIX_TARGET=my_target` or prefix every command with
    `MIX_TARGET=my_target`. For example, `MIX_TARGET=rpi3`
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix burn`



### 3. Connecting to Nerves Target

Hardware requirements for connection:

 - Raspberry pi(rpi0, rpi3 e.t.c)
 - USB cable compatible with rpi usb slot
 - SD card(Micro SD) with an adapter
 - Male Jumper wire
 - 8x8 LED matrix  with soldered input pins
 - Logic Level shifter
 - Breadboard power supply


### WIP:

 1. Explain how to get rpi to blink(basic example)
    - power rpi
    - insert Sd card
    - ensure artifacts are burned to SD card 
 2. Upload video of the connection 
 3. Debugging process
 


