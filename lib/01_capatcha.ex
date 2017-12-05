defmodule Captacha do
  @moduledoc """
  Day 1: Inverse Captcha
  """

  @doc """
  Returns the sum of all digits that match the next digit
  in the list.

  The list is circular, so the digit after the last digit
  is the first digit in the list.

  ## Examples

      iex> Captacha.sum("1122")
      3

  """
  @spec sum(String.t) :: integer
  def sum(string) do
    string
    |> string_to_int_list()
    |> (fn(list) ->
      list ++ Enum.take(list, 1)
    end).()
    |> Enum.chunk_every(2, 1, :discard)
    |> sum_likes()
  end

  @doc """
  Returns the sum of all digits that match the digit
  directly across the digit circle.

  ## Examples

      iex> Captacha.sum_across("1212")
      6
  """
  @spec sum_across(String.t) :: integer
  def sum_across(string) do
    str_length = String.length(string)
    list = string_to_int_list(string)

    list
    |> Enum.with_index()
    |> Enum.map(fn({a, i}) ->
      index = Integer.mod(trunc(str_length / 2 + i), str_length)
      [a, Enum.at(list, index)]
    end)
    |> sum_likes()
  end

  defp string_to_int_list(string) do
    string
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end

  defp sum_likes(list) do
    list
    |> Enum.filter(fn([a,b]) -> a == b end)
    |> Enum.map(fn([a, _]) -> a end)
    |> Enum.sum()
  end
end
