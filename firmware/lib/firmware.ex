defmodule Firmware do
  @moduledoc """
  Documentation for Firmware.
  """

  def hello do
    # for testing?
    :world
  end

  # compute colors at compile time instead of every time
  # the `colors` function gets called.


  @blue_led    %Blinkchain.Color{r: 0, g: 0, b: 255, w: 0}
  @green_led   %Blinkchain.Color{r: 0, g: 255, b: 0, w: 0}
  @red_led     %Blinkchain.Color{r: 255, g: 0, b: 0, w: 0}
  @yelgrn_led  %Blinkchain.Color{r: 255, g: 255, b: 0, w: 0}
  @orange_led  %Blinkchain.Color{r: 255, g: 127, b: 0, w: 0}
  @white_led   %Blinkchain.Color{r: 240, g: 240, b: 240, w: 0}
  @purple_led  %Blinkchain.Color{r: 148, g: 0, b: 211, w: 0}
  @ltprple_led %Blinkchain.Color{r: 75, g: 0, b: 130, w: 0}

  @rainbow_leds [
    @purple_led,
    @ltprple_led,
    @blue_led,
    @green_led,
    @yelgrn_led,
    @orange_led,
    @red_led,
    @white_led
  ]

  def colors, do: @rainbow_leds

  def purple, do: @purple_led
  def ltprple, do: @ltprple_led
  def blue, do: @blue_led
  def green, do: @green_led
  def yelgrn, do: @yelgrn_led
  def orange, do: @orange_led
  def red, do: @red_led
  def white, do: @white_led


  defdelegate hello_ui, to: Ui, as: :hello
  defdelegate list_users, to: Ui.Accounts
end
