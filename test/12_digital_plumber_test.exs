defmodule DigitalPlumberTest do
  use Aoc.DayCase
  import DigitalPlumber
  doctest DigitalPlumber

  @simple """
    0 <-> 2
    1 <-> 1
    2 <-> 0, 3, 4
    3 <-> 2, 4
    4 <-> 2, 3, 6
    5 <-> 6
    6 <-> 4, 5
  """

  describe "group_size/2" do
    test "a simple case" do
      assert group_size(@simple, 0) == 6
    end

    test "input" do
      assert "12"
             |> input()
             |> group_size(0) == 175
    end
  end

  describe "groups/1" do
    test "a simple case" do
      assert groups(@simple) == [[1], [3, 5, 6, 4, 2, 0]]
    end

    test "input" do
      assert "12"
             |> input()
             |> groups()
             |> length() == 213
    end
  end
end
