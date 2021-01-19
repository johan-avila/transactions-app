use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
# database: "transactions_test#{System.get_env("MIX_TEST_PARTITION")}",

config :transactions, Transactions.Repo,
  username: System.get_env("MYSQL_USERNAME_TEST") || "root",
  password: System.get_env("MYSQL_PASSWORD_TEST") || "password",
  database: System.get_env("MYSQL_DATABASE_TEST") || "transactions_test",
  hostname: System.get_env("MYSQL_HOST_TEST") || "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :transactions, TransactionsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
