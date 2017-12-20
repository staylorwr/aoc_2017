defmodule PacketScanners do
  @moduledoc """
  Day 13: Packet Scanners

  There is a firewall with a series of scanners that
  move across their defined range.  When reaching the end of their range
  the scanner reverses its direction and returns.

  A packet moves through the firewall at the top of each range (0)
  and moves at the same speed as the scanners.  Each time a packet is
  in the same location as a scanner, it is caught.  The severity of each
  instance of being caught is the depth of the scanner times the range
  of the scanner.

  1.  If a packet starts at the top of the registry, what is it's total
  severity?

  2.  What is the amount of time that a packet should delay for it not
  get caught?
  """

  @doc """
  Calculate total severity of moving with a certain delay, defaults to 0.
  """
  @spec total_severity(String.t()) :: non_neg_integer()
  def total_severity(input, delay \\ 0) do
    for {depth, range} <- scanners(input), caught_at?(range, depth + delay) do
      depth * range
    end
    |> Enum.sum()
  end

  @doc """
  Calculates smallest delay for the packet to sneak through
  """
  def sneaky_time(input), do: sneaky_time(scanners(input), 0)

  defp sneaky_time(scanners, delay) do
    caught? = Enum.any?(scanners, fn {depth, range} -> caught_at?(range, depth + delay) end)

    case caught? do
      true -> sneaky_time(scanners, delay + 1)
      false -> delay
    end
  end

  defp caught_at?(range, time), do: rem(time, (range - 1) * 2) == 0

  defp scanners(string) do
    Regex.scan(~r/(\d+): (\d+)/, string)
    |> Map.new(fn [_, depth, range] -> {String.to_integer(depth), String.to_integer(range)} end)
  end
end
