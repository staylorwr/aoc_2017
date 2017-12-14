defmodule KnotHashTest do
  use Aoc.DayCase
  import KnotHash
  doctest KnotHash

  @input "129,154,49,198,200,133,97,254,41,6,2,1,255,0,191,108"

  test "part 1" do
    assert @input |> simple_hash(0..255) == 19591
  end

  test "part 2" do
    assert @input |> real_hash() == "62e2204d2ca4f4924f6e7a80f1288786"
  end
end
