# This file is responsible for configuring your application and its
# dependencies.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
import Config

# Enable the Nerves integration with Mix
Application.start(:nerves_bootstrap)

config :firmware, target: Mix.target()

# Customize non-Elixir parts of the firmware. See
# https://hexdocs.pm/nerves/advanced-configuration.html for details.

config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"

# Set the SOURCE_DATE_EPOCH date for reproducible builds.
# See https://reproducible-builds.org/docs/source-date-epoch/ for more information

config :nerves, source_date_epoch: "1591379755"

config :nerves_leds, names: [green: "led0"]

# Use Ringlogger as the logger backend and remove :console.
# See https://hexdocs.pm/ring_logger/readme.html for more information on
# configuring ring_logger.

config :logger, backends: [RingLogger]

config :ui,
  ecto_repos: [Ui.Repo]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

if Mix.target() == :host do
  import_config "host.exs"
else
  import_config "target.exs"
  led_config = System.get_env("LED_CONFIG") || raise """
    environment variable LED_CONFIG is missing. For example:
    export LED_CONFIG=led_8x8array
    Choices are:
      led_8x8_array
      led_1x50_string
      led_8x8_array_dim
    """
  case led_config do
    "led_8x8_array" -> import_config "led_8x8_array.exs"
    "led_1x50_string" -> import_config "led_1x50_string.exs"
    "led_8x8_array_dim" -> import_config "led_8x8_array.exs"
  end
end
