mix deps.get
mix test 

exit_code=$?

echo "TEST EXIT CODE: ${exit_code}"

exit $exit_code