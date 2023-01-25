
## Set Up Guide

### 1. Installation

BlinkHahaNew application uses nerves version `1.9` . To run nerves on your operating system there are a number of programs required to get your machine configured.

Here is a [comprehensive guide](https://hexdocs.pm/nerves/installation.html#content) on  the installation process depending on your operating system.

NB: Previous installations of Erlang and Elixir on macos using brew need to be unistalled and use `ASDF` for installation.


### 2. Getting Started 

We highly recommend understanding the following [terms](https://hexdocs.pm/nerves/getting-started.html#common-terms) before proceeding .


To start your Nerves app:
  * change to `blinkly_haha_new` app directory `cd blinkly_haha_new`
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


### Green Blink on the Raspberry pi

  Under this section we will explain a simple setup to make your raspberry pi blink Green. After compiling your code using the steps outlined under the getting started section,
   1. insert the burned micro SD card, in the Micro SD Card port
   2. power up your raspberry pi using your USB cable which you can connect to your laptop. The `ACT LED` on the raspberry pi will turn green.

### Inspecting in IEX

To interact with the `blinker`, open an `IEx` prompt:

  1. CD into your nerves project(blinky_haha_new), make sure your target is exported and you are connected to your target device.
  2. Run `ssh nerves.local`(make sure you have a good internet connection) and an interactive shell will come up.

  3. alias/import `BlinklyHahaNew.Blinker` module in the `IEx` 

     ```elixir
     iex> import BlinklyHahaNew.Blinker

     iex> disable()

     iex> enable()
     ```

  Observe how the `LED` behaves. By default when the application is started, the LED is enabled it turns `green` . Invoking `disable()`, the `LED` is turned `OFF`.

Using a screen(monitor) to inspect in IEX:
  1. Connect your raspberry pi to it's power cable(ensure your pi has the "burnt" sd card)
  2. Then connect your HDMI cable and you should be able to see the IEX shell on your screen(monitor)

   

### WIP:
 1. Explain how to get rpi to blink(basic example)
    - power rpi
    - insert Sd card
    - ensure artifacts are burned to SD card 
    - state down challenges faced when ssh
 2. Upload video of the connection 
 3. Debugging process
 


