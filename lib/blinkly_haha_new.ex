defmodule BlinklyHahaNew do
  alias Blinkchain.Color

  @colors [
    # purple
    Color.parse("#9400D3"),
    # light purple
    Color.parse("#4B0082"),
    # blue
    Color.parse("#0000FF"),
    # green
    Color.parse("#00FF00"),
    # yellow green
    Color.parse("#FFFF00"),
    # orange
    Color.parse("#FF7F00"),
    # red
    Color.parse("#FF0000"),
    # white
    Color.parse("#F0F0F0")
  ]

  @doc """
  Get a list of nice-looking rainbow colors
  """
  def colors, do: @colors
end
