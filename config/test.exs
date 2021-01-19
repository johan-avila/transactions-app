use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
# database: "transactions_test#{System.get_env("MIX_TEST_PARTITION")}",

config :transactions, Transactions.Repo,
  username: "uknwegb7nzrso8ec",
  password: "Hs1RWjdwM2GfVf2IPI9v",
  database: "bmmoxnz9sjkl6ogdsuul",
  hostname: "bmmoxnz9sjkl6ogdsuul-mysql.services.clever-cloud.com",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :transactions, TransactionsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
