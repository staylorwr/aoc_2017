defmodule DanceTest do
  use Aoc.DayCase
  import Dance
  doctest Dance

  @dancers 'abcdefghijklmnop'

  test "part 1" do
    steps = input("16")
    assert dance(moves(steps), @dancers) == 'kbednhopmfcjilag'
  end

  test "part 2" do
    steps = input("16")
    assert repeat_dance(steps, @dancers, 1_000_000_000) == 'fbmcgdnjakpioelh'
  end
end
