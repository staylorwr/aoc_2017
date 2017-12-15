defmodule HexEdTest do
  use Aoc.DayCase
  import HexEd
  doctest HexEd

  test "part 1" do
    assert "11" |> input() |> distance() == 664
  end

  test "part 2" do
    assert "11" |> input() |> max_distance() == 1447
  end
end
