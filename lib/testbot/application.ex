defmodule Testbot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias Alchemy.Client

  defp load_modules do
    use Testbot.Commands
  end

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Testbot.Worker.start_link(arg)
      # {Testbot.Worker, arg}
    ]

    Client.start(Application.get_env(:testbot, :token))
    load_modules()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Testbot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
