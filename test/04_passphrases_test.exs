defmodule PassphrasesTest do
  use Aoc.DayCase

  @example ~S"""
  aa bb cc dd ee
  aa bb cc dd aa
  aa bb cc dd aaa
  """

  @annagrams ~S"""
  abcde fghijk
  abcde xyz ecdab
  a ab abc abd abf abj
  iiii oiii ooii oooi oooo
  oiii ioii iioi iiio
  """

  test "count_valid_passwords example" do
    assert @example |> Passphrases.count_valid_passwords() == 2
  end

  test "count_valid_passwords part 1" do
    assert puzzle() |> Passphrases.count_valid_passwords() == 466
  end

  test "anagram_policy example" do
    assert @annagrams |> Passphrases.anagram_policy() == 3
  end

  test "anagram_policy part 2" do
    assert puzzle() |> Passphrases.anagram_policy() == 251
  end

  defp puzzle(), do: "4" |> input()
end
