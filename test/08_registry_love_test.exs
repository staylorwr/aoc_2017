defmodule RegistryLoveTest do
  use Aoc.DayCase
  doctest RegistryLove, import: true

  @input """
  b inc 5 if a > 1
  a inc 1 if b < 5
  c dec -10 if a >= 1
  c inc -20 if c == 10
  """

  test "part 1 example" do
    assert RegistryLove.max_after(@input) == 1
  end

  @tag :input
  test "part 1" do
    assert "8"
    |> input()
    |> RegistryLove.max_after() == 6012
  end

  test "part 2 example" do
    assert RegistryLove.max_during(@input) == 10
  end

  @tag :input
  test "part 2" do
    assert "8" |> input|> RegistryLove.max_during() == 6369
  end
end
