defmodule Rdm.Mixfile do
  use Mix.Project

  def project do
    [app: :rdm,
     version: "0.1.0",
     elixir: "~> 1.3",
     escript: [main_module: RDM],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [
      applications: [
        :logger,
        :yaml_elixir,
      ]
    ]
  end

  defp deps do
    [
      { :yaml_elixir, "~> 1.2.0"},
      { :yamerl, "~> 0.3.2"},
      { :distillery, "~> 0.9"},
    ]
  end
end
