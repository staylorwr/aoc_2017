defmodule HexEd do
  defstruct x: 0, y: 0, z: 0, directions: [], steps: []

  @moduledoc """
  Day 11: Hex Ed
  We're on a hex grid!  We can move like

    \ n  /
  nw +--+ ne
    /    \
  -+      +-
    \    /
  sw +--+ se
    / s  \

  Given an input of steps:

  1.  How far are we from the origin?

  2.  What was the maximum distance from the origin?
  """

  @doc """
  How far are we from where we started?

  ## Examples

      iex> distance("ne,ne,ne")
      3
      iex> distance("ne,ne,sw,sw")
      0
      iex> distance("ne,ne,s,s")
      2
      iex> distance("se,sw,se,sw,sw")
      3
  """
  def distance(steps) do
    steps
    |> parse
    |> process_recursively
    |> distance_from
  end

  @doc """
  What is the maximum distance traveled from the origin?

  ## Examples

      iex> max_distance("ne,ne,ne")
      3
      iex> max_distance("ne,ne,sw,sw")
      2
  """
  def max_distance(steps) do
    steps
    |> parse
    |> process_recursively
    |> Map.get(:steps)
    |> Enum.map(&distance_from/1)
    |> Enum.max()
  end

  def parse(steps) do
    directions =
      steps
      |> String.split(",", trim: true)
      |> Enum.map(&direction_to_atom/1)

    %__MODULE__{directions: directions}
  end

  def process_recursively(%{directions: []} = state), do: state

  def process_recursively(steps) do
    steps
    |> process
    |> process_recursively
  end

  def process(%{directions: [direction | tail], x: x, y: y, z: z, steps: s} = state) do
    {x2, y2, z2} = travel(direction, {x, y, z})
    %{state | x: x2, y: y2, z: z2, directions: tail, steps: [{x2, y2, z2} | s]}
  end

  def distance_from({x, y, z}), do: distance_from({x, y, z}, {0, 0, 0})

  def distance_from(%{x: x, y: y, z: z}) do
    distance_from({x, y, z}, {0, 0, 0})
  end

  def distance_from({x1, y1, z1}, {x2, y2, z2}) do
    trunc((abs(x1 - x2) + abs(y1 - y2) + abs(z1 - z2)) / 2)
  end

  defp direction_to_atom("ne"), do: :north_east
  defp direction_to_atom("se"), do: :south_east
  defp direction_to_atom("s"), do: :south
  defp direction_to_atom("sw"), do: :south_west
  defp direction_to_atom("nw"), do: :north_west
  defp direction_to_atom("n"), do: :north

  defp travel(:north_east, {x, y, z}), do: {x + 1, y, z - 1}
  defp travel(:south_east, {x, y, z}), do: {x + 1, y - 1, z}
  defp travel(:south, {x, y, z}), do: {x, y - 1, z + 1}
  defp travel(:south_west, {x, y, z}), do: {x - 1, y, z + 1}
  defp travel(:north_west, {x, y, z}), do: {x - 1, y + 1, z}
  defp travel(:north, {x, y, z}), do: {x, y + 1, z - 1}
end
