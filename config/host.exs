import Config

# Add configuration that is only needed when running on the host here.

config :sbom, bom_location: Path.expand("../", __DIR__)

import_config "../../ui/config/config.exs"
