defmodule SpiralMemoryTest do
  use Aoc.DayCase
  doctest SpiralMemory, import: true

  @input 277_678

  @tag :input
  test "distance part 1" do
    assert SpiralMemory.distance(@input) == 475
  end

  @tag :input
  test "sum_of_neighbor_spiral" do
    assert @input
           |> SpiralMemory.sum_of_neighbor_spiral()
           |> Enum.reject(fn {_coords, val} -> val < @input end)
           |> Enum.take(1)
           |> hd() == {{2, 4}, 279_138}
  end
end

defmodule SpiralTest do
  use Aoc.DayCase
  doctest Spiral, import: true
end
