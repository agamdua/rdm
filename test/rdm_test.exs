defmodule RDMTest do
  use ExUnit.Case
  doctest RDM

  test "Get versions" do
    versions = RDM.dep_versions("test/example-release.yml")
    expected = [{"service1", "1.2.1"}, {"service2", "2.4.6"}]
    assert versions == expected
  end
end
