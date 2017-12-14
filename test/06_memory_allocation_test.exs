defmodule MemoryAllocationTest do
  use Aoc.DayCase
  doctest MemoryAllocation, import: true

  test "part 1" do
    assert input("6")
           |> String.split(~r{\t}, trim: true)
           |> Enum.map(&String.to_integer(&1))
           |> MemoryAllocation.redistribute_count() == 4074
  end

  test "part 2" do
    assert input("6")
           |> String.split(~r{\t}, trim: true)
           |> Enum.map(&String.to_integer(&1))
           |> MemoryAllocation.iteration_length() == 2793
  end
end
