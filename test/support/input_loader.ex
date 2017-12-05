defmodule Aoc.InputLoader do
  @moduledoc """
  Loads challenge inputs
  """

  @doc """
  Loads the given file as a string
  """
  def input(name) do
    {:ok, bin} = "priv/#{name}.txt"
      |> Path.expand()
      |> Path.absname()
      |> File.read
    bin |> String.trim()
  end
end
