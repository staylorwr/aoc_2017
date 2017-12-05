defmodule ChecksumTest do
  use Aoc.DayCase
  doctest Checksum

  test "checksum example" do
    assert ~S"""
           5 1 9 5
           7 5 3
           2 4 6 8
           """
           |> Checksum.checksum() == 18
  end

  test "checksum 1 answer" do
    assert puzzle() |> Checksum.checksum() == 42299
  end

  test "division example" do
    assert ~S"""
           5 9 2 8
           9 4 7 3
           3 8 6 5
           """
           |> Checksum.div_checksum() == 9
  end

  test "division part 2" do
    assert puzzle() |> Checksum.div_checksum() == 277
  end

  defp puzzle(), do: input("2")
end
