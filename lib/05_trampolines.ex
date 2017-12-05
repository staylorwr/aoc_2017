defmodule Trampolines do
  @moduledoc """
  Day 5: A Maze of Twisty Trampolines, All Alike

  1.  We have a list of jump instructions, relative to the current position and
  the goal is to calculate how many steps are needed to jump outside of the
  maze. At every instruction before we leave it, we increment the jump
  instruction.

  2. Decrement the jump if the value is below 3.
  """

  @doc """
  Count steps through the maze

  ## Examples

      iex> Trampolines.count_steps("0 3  0 1 -3")
      5
  """
  def count_steps(input) do
    input |> to_indexed_map() |> jump(0, 0)
  end

  @doc """
  Count steps through the maze, but if the value is less then 3, decrement it.

  ## Examples

      iex > Trampolines.strange_count("0 3  0 1 -3")
      10
  """
  def strange_count(input) do
    input |> to_indexed_map() |> jump_strange(0, 0)
  end

  defp jump(map, index, count) do
    case map[index] do
      nil -> count
      to -> jump(Map.put(map, index, to + 1), index + to, count + 1)
    end
  end

  defp jump_strange(map, index, count) do
    case map[index] do
      nil ->
        count

      to when to >= 3 ->
        jump_strange(Map.put(map, index, to - 1), index + to, count + 1)

      to ->
        jump_strange(Map.put(map, index, to + 1), index + to, count + 1)
    end
  end

  defp to_indexed_map(string) when is_binary(string) do
    indexed =
      string
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> Enum.with_index()

    for {val, i} <- indexed, into: Map.new(), do: {i, val}
  end
end
