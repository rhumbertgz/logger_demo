defmodule LoggerDemoTest do
  use ExUnit.Case
  doctest LoggerDemo

  test "greets the world" do
    assert LoggerDemo.hello() == :world
  end
end
