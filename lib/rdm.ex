defmodule RDM do

  def main(args) do
    args |> parse_args |> process
  end

  def process([]) do
    IO.puts "No arguments given"
  end

  def process(options) do
    IO.inspect dep_versions(options[:config])
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [deps: :true, config: :string]
    )
    options
  end

  @doc """
  Returns yaml file as elixir data structure
  """
  def read_config(filepath) do
    YamlElixir.read_from_file(filepath)
  end


  @doc """
  """
  def get_deps_config(config) do
    config["dependencies"]
  end


  @doc """
  """
  def get_dependency_version(dependency) do
    dependency["version"]
  end


  def get_dep_name(x) do
    x
    |> Map.keys
    |> List.first
  end

  def get_dep_version(x) do
    x
    |> Map.values
    |> List.first
    |> List.first
    |> (fn x -> x["version"] end).()
  end


  @doc """
  """
  def get_versions(dep_config) do
    Enum.map(dep_config, fn x -> {get_dep_name(x), get_dep_version(x)} end )
  end


  def dep_versions(filepath) do
    read_config(filepath)
    |> get_deps_config 
    |> get_versions
  end

end
