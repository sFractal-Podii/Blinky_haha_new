defmodule UiWeb.OC2Controller do
  use UiWeb, :controller

  def command(conn, params) do
    #sample data to create a command 
    # %{"action" => "on", 
    #   "target" => "x-sfractal-blinky:led"
    # }
    IO.inspect(params, label: "==========")

   tops = Map.keys(params) 
   cond do
    ## is action missing?
    "action" not in tops ->
      ## :unprocessable_entity - 422
      send_resp(conn, :unprocessable_entity, "Oops! no action?")

      true ->
      send_resp(conn, :unprocessable_entity, "yey we have action" )
    end
  
    # conn
    # |> Plug.Conn.resp(404, "Not found")
    # |> Plug.Conn.send_resp()

    # send_resp(conn, :unprocessable_entity, "led state should be on or off")
  end


  
end
