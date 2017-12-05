defmodule Passphrases do
  @moduledoc """
  Day 4: High-Entropy Passphrases

  1.  Count the valid passwords in the input.

  Valid passwords do not contain duplicate words.

  2.  Count the passwords that do not contain
  annegrams.
  """

  @doc """
  Returns a count of valid passwords
  """
  @spec count_valid_passwords(String.t()) :: Integer.t()
  def count_valid_passwords(string) do
    string
    |> prepare()
    |> Enum.reject(fn row ->
         word_count = length(row)
         unique_word_count = row |> Enum.uniq() |> length()
         word_count != unique_word_count
       end)
    |> length()
  end

  @doc """
  Returns a count of valid passwords given that a valid
  passphrase cannot have words that are anagrams
  """
  @spec anagram_policy(String.t()) :: Integer.t()
  def anagram_policy(string) do
    string
    |> prepare()
    |> Enum.map(fn row ->
         row
         |> Enum.map(fn r ->
              r
              |> String.graphemes()
              |> Enum.sort()
            end)
       end)
    |> Enum.reject(fn words ->
         word_count = length(words)
         non_anagrams_count = words |> Enum.uniq() |> length()
         word_count != non_anagrams_count
       end)
    |> length()
  end

  defp prepare(string) do
    string
    |> String.split("\n", trim: true)
    |> Enum.map(fn row ->
         row |> String.split(" ", trim: true)
       end)
  end
end
