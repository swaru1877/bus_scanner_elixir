defmodule Yamerl_init do
  def func do
    IO.puts("Calling init module")
    yaml_path = Path.join([File.cwd!(), "config/target_websites.yaml"])
    # The yamerl application must be started before any use of it.
    :application.start(:yamerl)

    [sites_info | _] = :yamerl_constr.file(yaml_path)
  end
end
