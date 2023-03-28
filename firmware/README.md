# Firmware
## Targets

Nerves applications produce images for hardware targets based on the
`MIX_TARGET` environment variable. If `MIX_TARGET` is unset, `mix` builds an
image that runs on the host (e.g., your laptop). This is useful for executing
logic tests, running utilities, and debugging. Other targets are represented by
a short name like `rpi3` that maps to a Nerves system image for that platform.
All of this logic is in the generated `mix.exs` and may be customized. For more
information about targets see:

https://hexdocs.pm/nerves/targets.html#content

## Getting Started

To start your Nerves app:
  * `export MIX_TARGET=my_target` or prefix every command with
    `MIX_TARGET=my_target`. For example, `MIX_TARGET=rpi3`
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix firmware.burn`


## [Generate SBOM Setup guide](./docs/generate_sbom.md)

See [setup guide](./docs/generate_sbom.md) for the following:

  1. Generating Elixir bom
  2. Installation of cyclonedx
  3. Converting bom file to different formats(spdx, json e.t.c)


## [Interacting with Blinker Setup guide](./docs/setup.md)

See [setup guide](./docs/setup.md) for the following:

  1. Installing nerves
  2. Connecting to nerves target
  3. Green Blink on the Raspberry pi
  4. Interact with blinker on the nerves interactive shell


## Learn more

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: https://nerves-project.org/
  * Forum: https://elixirforum.com/c/nerves-forum
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
