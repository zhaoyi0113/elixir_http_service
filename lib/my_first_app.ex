defmodule MyFirstApp do
  @moduledoc """
  Documentation for MyFirstApp.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MyFirstApp.hello
      :world

  """
  def hello do
    :world
  end

  use Application
  require Logger

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Example.Router, [], port: 8080)
    ]

    Logger.info "Started application"

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
