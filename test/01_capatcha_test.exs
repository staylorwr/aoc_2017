defmodule CaptachaTest do
  use Aoc.DayCase
  doctest Captacha

  test "sums examples correctly" do
    assert Captacha.sum("1122") == 3
    assert Captacha.sum("1111") == 4
    assert Captacha.sum("1234") == 0
    assert Captacha.sum("91212129") == 9
  end

  test "part 1" do
    assert puzzle() |> Captacha.sum() == 1390
  end

  test "sum_across examples" do
    assert Captacha.sum_across("1212") == 6
    assert Captacha.sum_across("1221") == 0
    assert Captacha.sum_across("123425") == 4
    assert Captacha.sum_across("123123") == 12
    assert Captacha.sum_across("12131415") == 4
  end

  test "sum_across part 2" do
    assert puzzle() |> Captacha.sum_across()
  end

  defp puzzle(), do: input("1")
end
