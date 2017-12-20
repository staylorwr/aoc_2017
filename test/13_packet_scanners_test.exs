defmodule PacketScannersTest do
  use Aoc.DayCase
  import PacketScanners
  doctest PacketScanners

  @simple """
  0: 3
  1: 2
  4: 4
  6: 4
  """

  describe "total_severity" do
    test "simple input" do
      assert total_severity(@simple) == 24
    end

    test "input" do
      assert "13"
             |> input()
             |> total_severity() == 1960
    end
  end

  describe "sneaky_time" do
    test "simple input" do
      assert sneaky_time(@simple) == 10
    end

    @tag :input
    test "input" do
      assert "13"
             |> input()
             |> sneaky_time() == 3_903_378
    end
  end
end
