defmodule TrampolinesTest do
  use Aoc.DayCase
  doctest Trampolines

  @example ~S"""
  0
  3
  0
  1
  -3
  """

  test "instruction count until exit" do
    assert @example |> Trampolines.count_steps() == 5
  end

  @tag :input
  test "input part 1" do
    assert puzzle() |> Trampolines.count_steps() == 1
  end

  test "strange count" do
    assert @example |> Trampolines.strange_count() == 10
  end

  @tag :input
  test "strange count input" do
    assert puzzle() |> Trampolines.strange_count() == 10
  end

  defp puzzle(), do: input("5")
end
