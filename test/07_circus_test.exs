defmodule CircusTest do
  use Aoc.DayCase

  @input """
  pbga (66)
  xhth (57)
  ebii (61)
  havc (66)
  ktlj (57)
  fwft (72) -> ktlj, cntj, xhth
  qoyq (66)
  padx (45) -> pbga, havc, qoyq
  tknk (41) -> ugml, padx, fwft
  jptl (61)
  ugml (68) -> gyxo, ebii, jptl
  gyxo (61)
  cntj (57)
  """

  describe "root/1" do
    test "returns the root of the example" do
      assert Circus.bottom_program(@input) == "tknk"
    end

    @tag :input
    test "returns part 1 answer" do
      assert input("7") |> Circus.bottom_program() == "vmpywg"
    end
  end

  describe "balance_graph/1" do
    test "returns the correct weight of the unbalanced node" do
      assert Circus.unbalanced_weight(@input) == 60
    end

    @tag :input
    test "returns part 2 answer" do
      assert "7"
             |> input()
             |> Circus.unbalanced_weight() == 1674
    end
  end
end
