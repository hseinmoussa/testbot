defmodule TestbotTest do
  use ExUnit.Case
  doctest Testbot

  test "greets the world" do
    assert Testbot.hello() == :world
  end
end
