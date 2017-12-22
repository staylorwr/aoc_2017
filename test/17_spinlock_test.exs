defmodule SpinlockTest do
  use Aoc.DayCase
  import Spinlock
  doctest Spinlock

  @input 343

  test "part 1" do
    assert value_after_last_inserted(@input, 2017) == 1914
  end

  test "part 2" do
    assert value_after_0(@input, 50_000_000) == 41_797_835
  end
end
