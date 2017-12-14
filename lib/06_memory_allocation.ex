defmodule MemoryAllocation do
  @moduledoc """
  Memory Allocation

  1.  Given x blocks of memory with an initial configuration and a runner that
  on each run picks the block with the most stored, removes it's contents and
  iterates through all blocks starting at the next, and gives each block a
  single value until it runs out of blocks.  How many iterations are required
  until the runner reaches a state it has already created?
  """

  @doc """
  Part 1 solution.

  Iterate through the set, redistributing the memory until a previous state
  is reached

  ## Examples

      iex> redistribute_count([0, 2, 7, 0])
      5
  """
  @spec redistribute_count(list(integer())) :: integer()
  def redistribute_count(list) do
    {uniques, _} = detect_repetition(list)
    MapSet.size(uniques)
  end

  @doc """
  Part 2 Solution

  How long is the unique set between duplicate iterations?

  ## Examples

      iex> iteration_length([0, 2, 7, 0])
      4
      iex> iteration_length([2, 4, 1, 2])
      4
  """
  def iteration_length(list) do
    {_, value} = detect_repetition(list)
    redistribute_count(value)
  end

  @doc """
  Accepts an array of values and distributes them evenly

  ## Examples

      iex> run([0, 2, 7, 0])
      [2, 4, 1, 2]

      iex> run([2, 4, 1, 2])
      [3, 1, 2, 3]

      iex> run([3, 1, 2, 3])
      [0, 2, 3, 4]

      iex> run([1, 3, 4, 1])
      [2, 4, 1, 2]
  """
  @spec run(list(integer())) :: list(integer())
  def run(list) do
    {biggest, index} = list |> Enum.with_index() |> Enum.max_by(&elem(&1, 0))
    skipped = Enum.take(list, index)
    acc = [0 | Enum.reverse(skipped)]
    cycle(Enum.drop(list, index + 1), biggest, acc)
  end

  defp cycle([], 0, acc), do: Enum.reverse(acc)
  defp cycle([hd | tl], 0, acc), do: cycle(tl, 0, [hd | acc])
  defp cycle([], pot, acc), do: cycle(Enum.reverse(acc), pot, [])
  defp cycle([hd | tl], pot, acc), do: cycle(tl, pot - 1, [hd + 1 | acc])

  defp detect_repetition(state), do: detect_repetition(state, MapSet.new())

  defp detect_repetition(state, seen) do
    if MapSet.member?(seen, state) do
      {seen, state}
    else
      detect_repetition(run(state), MapSet.put(seen, state))
    end
  end
end
