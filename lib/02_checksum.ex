defmodule Checksum do
  @moduledoc """
  Solution for calculating the checksum
  of a spreadsheet
  """

  @doc """
  Calculates the checksum
  by summing the difference
  between the minimum and maximum values per row
  """
  @spec checksum(String.t) :: Integer.t
  def checksum(string) do
    string
    |> parse()
    |> solve(&difference_for_row/1)
  end

  @doc """
  Calculates the checksum by finding the evenly divisible values
  """
  @spec div_checksum(String.t) :: Integer.t
  def div_checksum(string) do
    string
    |> parse()
    |> solve(&divisable_pairs/1)
  end

  defp difference_for_row(row) do
    max = Enum.max(row)
    min = Enum.min(row)
    max - min
  end

  defp divisable_pairs(row) do
    evens = for x <- row, y <- row, x != y, rem(x,y) == 0, do: div(x, y)
    hd(evens)
  end

  defp parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn s ->
      s |> String.split |> Enum.map(&String.to_integer/1)
    end)
  end

  defp solve(matrix, fun) do
    matrix
    |> Enum.map(&(fun.(&1)))
    |> Enum.sum
  end
end
