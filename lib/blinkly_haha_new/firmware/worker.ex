defmodule BlinklyHahaNew.Firmware.Worker do
  @moduledoc """
  Responsible for handling tasks related to blinky lights
  """

  use GenServer
  alias Blinkchain.Point

  @moduledoc """
  State is the persistent state of the genserver
  e.g. the reference to the timer, some predetermined colors,
  a counter to tell how long you have iterating,
  the patten of the lights.
  """

  defmodule State do
    defstruct [:timer, :colors, :counter, :pattern]
  end

  # Public API

  @doc """
  change to red pattern
  """

  def red do
    GenServer.cast(__MODULE__, :red)
  end

  @doc """
  change to purple pattern
  """

  def purple do
    GenServer.cast(__MODULE__, :purple)
  end

  @doc """
  change to rainbow pattern
  """

  def rainbow do
    GenServer.cast(__MODULE__, :rainbow)
  end

  @doc """
  change to blue pattern
  """

  def blue do
    GenServer.cast(__MODULE__, :blue)
  end

  # Server

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    {:ok, %State{}, {:continue, :update_state}}
  end

  def handle_continue(:update_state, state) do
    # Send ourselves a message to draw each frame every 200 ms,
    # which will end up being approximately 5 fps.
    {:ok, ref} = :timer.send_interval(200, :draw_frame)

    state = %State{
      state
      | timer: ref,
        colors: BlinklyHahaNew.colors(),
        counter: 0,
        pattern: :rainbow
    }

    {:noreply, state}
  end

  def handle_info(:draw_frame, state) do
    # increase counter by 1
    counter = state.counter + 1

    case state.pattern do
      :rainbow ->
        [c1, c2, c3, c4, c5, c6, c7, c8] = Enum.slice(state.colors, 0..7)
        [_h | tail] = state.colors

        # shift all pixels to the right
        Blinkchain.copy(%Point{x: 0, y: 0}, %Point{x: 1, y: 0}, 7, 8)

        # Populate the six leftmost pixels with new colors
        Blinkchain.set_pixel(%Point{x: 0, y: 0}, c1)
        Blinkchain.set_pixel(%Point{x: 0, y: 1}, c2)
        Blinkchain.set_pixel(%Point{x: 0, y: 2}, c3)
        Blinkchain.set_pixel(%Point{x: 0, y: 3}, c4)
        Blinkchain.set_pixel(%Point{x: 0, y: 4}, c5)
        Blinkchain.set_pixel(%Point{x: 0, y: 5}, c6)
        Blinkchain.set_pixel(%Point{x: 0, y: 6}, c7)
        Blinkchain.set_pixel(%Point{x: 0, y: 7}, c8)

        Blinkchain.render()

        {:noreply, %State{state | colors: tail ++ [c1], counter: counter}}

      :red ->
        # fill with red
        Blinkchain.fill(%Point{x: 0, y: 0}, 8, 8, %Blinkchain.Color{r: 255, g: 0, b: 0})
        Blinkchain.render()
        {:noreply, %State{state | counter: counter}}

      _ ->
        # default fill with purple
        Blinkchain.fill(%Point{x: 0, y: 0}, 8, 8, %Blinkchain.Color{r: 130, g: 0, b: 75})
        Blinkchain.render()
        {:noreply, %State{state | counter: counter}}
    end
  end

  def handle_cast(:red, state) do
    {:noreply, %State{state | pattern: :red}}
  end

  def handle_cast(:purple, state) do
    {:noreply, %State{state | pattern: :purple}}
  end

  def handle_cast(:rainbow, state) do
    {:noreply, %State{state | pattern: :rainbow}}
  end
end
