defmodule Aoc.DayCase do
  @moduledoc """
  An extremely simple test case used to load challenge inputs
  """
  use ExUnit.CaseTemplate

  using do
    quote do
      import Aoc.InputLoader
    end
  end
end
