defmodule UiWeb.OC2Controller do
  use UiWeb, :controller

  def command(conn, params) do
    IO.inspect(params, label: "===========================")
    IO.puts("+++++++++++++++++++++++++++++")

    conn
    |> Plug.Conn.resp(404, "Not found")
    |> Plug.Conn.send_resp()

    # send_resp(conn, :unprocessable_entity, "led state should be on or off")
  end
end
