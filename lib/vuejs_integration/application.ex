defmodule VuejsIntegration.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      VuejsIntegrationWeb.Telemetry,
      VuejsIntegration.Repo,
      {DNSCluster, query: Application.get_env(:vuejs_integration, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: VuejsIntegration.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: VuejsIntegration.Finch},
      # Run Node in the supervision tree, for server side rendering of vue.js components
      {NodeJS.Supervisor, [path: LiveVue.SSR.NodeJS.server_path(), pool_size: 4]},
      # Start a worker by calling: VuejsIntegration.Worker.start_link(arg)
      # {VuejsIntegration.Worker, arg},
      # Start to serve requests, typically the last entry
      VuejsIntegrationWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VuejsIntegration.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VuejsIntegrationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
