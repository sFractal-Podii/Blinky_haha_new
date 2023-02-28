defmodule UiWeb.OC2Controller do
  use UiWeb, :controller
  require Logger

  def command(conn, params) do
    IO.inspect(params, label: "======================")
    Logger.debug("oc2_controller command #{inspect(params)}")
    ## check top level components of command json
    ## ["action", "target", "args", "actuator", "command_id"] in Oc2.CheckOc2 module
    tops = Map.keys(params)

    cond do
      ## is action missing?
      "action" not in tops ->
        ## :unprocessable_entity - 422
        Logger.debug("command no action #{inspect(params)}")
        Logger.debug("command no action #{inspect(conn)}")
        send_resp(conn, :unprocessable_entity, "Oops! no action?")

      ## is target missing?
      "target" not in tops ->
        Logger.debug("command no target #{inspect(params)}")
        send_resp(conn, :unprocessable_entity, "Oops! no target?")

      ## extra top level fields
      0 != length(tops -- ["action", "target", "args", "actuator"]) ->
        Logger.debug("command top level error #{inspect(params)}")
        send_resp(conn, :unprocessable_entity, "Oops! top level fields?")

      true ->
        ## good so far
        do_action(conn, params)
    end
  end

  defp do_action(conn, params = %{"action" => "set"}) do
    Logger.debug("do_action set #{inspect(params)}")
    %{"target" => target} = params

    case check_one_map_key(target) do
      ## validate is a map and extract the one target and it's attributes
      {:ok, "x-sfractal-blinky:led", attr} ->
        Logger.debug("do_action set led #{inspect(attr)}")
        do_action_set_led(conn, attr)

      {:ok, _, attr} ->
        Logger.debug("do_action set #{inspect(attr)}")
        Logger.debug("stubbing for now")
        json(conn, %{status: :ok})

      {:error, error_msg, _attr} ->
        Logger.debug("do_action set #{inspect(error_msg)}")
        send_resp(conn, :unprocessable_entity, "Oops! bad target")
    end
  end

  defp check_one_map_key(in_map) when is_map(in_map) do
    ## check it is a map and has one key.
    ## return error or the key and the value of the key
    Logger.debug("check_one_map_key #{inspect(in_map)}")

    case Enum.count(in_map) do
      1 ->
        [key | _] = Map.keys(in_map)
        value = in_map[key]

        {:ok, key, value}

      _ ->
        ## wrong number keys, return error
        Logger.debug("check_one_map_key: wrong number keys in map")
        :error
    end
  end

  defp check_one_map_key(in_map) do
    ## expecting a map and it is not therefore return error
    Logger.debug("check_one_map_key: not a map")
    :error
  end

  defp do_action_set_led(conn, attr) when attr == "on" do
    Logger.debug("do_action_set_led on")
    set_led_on(conn)
  end

  defp do_action_set_led(conn, attr) when attr == "off" do
    Logger.debug("do_action_set_led off")
    set_led_off(conn)
  end

  defp do_action_set_led(conn, attr) do
    Logger.debug("do_action_set_led attr= #{attr} not recognized")
    send_resp(conn, :unprocessable_entity, "led state should be on or off")
  end

  defp set_led_on(conn) do
    Logger.debug("set_led_on - just returning ok for now")
    # complains BlinklyHahaNew.Blinker is not available
    BlinklyHahaNew.Blinker.enable()
    json(conn, %{status: :ok})
  end

  defp set_led_off(conn) do
    Logger.debug("set_led_off - just returning ok for now")
    BlinklyHahaNew.Blinker.disable()
    json(conn, %{status: :ok})
  end
end
