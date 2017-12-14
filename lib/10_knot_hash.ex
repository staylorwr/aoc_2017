defmodule KnotHash do
  @moduledoc """
  Day 10 - Knot Hash

  A circular list repeatedly has parts of it reversed, based on input.
  The result forms the basis of a hash.

  1.  What is the produce of the first two numbers after tying the know?
  """
  require Bitwise
  @standard_length_suffix [17, 31, 73, 47, 23]

  @doc """
  Performs a simple hashing on a ring of a given size

  Input is a string of csn that give the lenghts.  These are the lengths used to
  obtain a `sparse_hash`.  The result is the product of the first two elements
  in the sparse hash.

  ## Examples

      iex> simple_hash("3,4,1,5", 0..4)
      12
  """
  def simple_hash(input, ring) do
    [first, second | _others] =
      input
      |> to_indexed_integers()
      |> sparse_hash(ring)

    first * second
  end

  @doc """
  Now were going to convert these inputs into ASCII and round not once
  but 64 times while appending some stuff and eventually outputting the dense
  hash returning the result in hexdecimal notation

  ## Examples

      iex> real_hash("AoC 2017")
      "33efeb34ea91902bb2f59c9920caa6cd"
      iex> real_hash("1,2,3")
      "3efbe78a8d82f29979031a4aa0b16a9d"
  """
  def real_hash(input) do
    (to_charlist(input) ++ @standard_length_suffix)
    |> List.duplicate(64)
    |> List.flatten()
    |> sparse_hash(0..255)
    |> dense_hash()
    |> to_hex_string()
  end

  @doc """
  Breaks a comma-separated string of numbers into a list of integers

  ## Examples

      iex> to_indexed_integers("3,4,1,5")
      [3,4,1,5]
  """
  def to_indexed_integers(input) do
    input
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end

  @doc """
  Returns a ring that has been partially reversed multiple times

  Input is the list of lengths, all below the ring size.  For each length,
  reverse part of the ring of that length, then traverse the length plus a skip
  size that is increased each iteration, starting at 0.

  ## Examples

      iex> sparse_hash([3,4,1,5], 0..4)
      [3,4,2,1,0]
  """
  def sparse_hash(lengths, ring) do
    indexed_lengths = Enum.with_index(lengths)

    indexed_lengths
    |> Enum.reduce(ring, &reverse_and_rotate/2)
    |> reset_rotation(indexed_lengths)
  end

  @doc """
  Returns the dense hash of a sparse hash, XORing each block of 16 values

  ## Examples

      iex> ring = [9, 20, 30, 11, 15, 16, 2, 12, 24, 26, 17, 27, 28, 31, 1, 22]
      iex> KnotHash.dense_hash(ring)
      [5]
  """
  def dense_hash(ring) do
    ring
    |> Enum.chunk(16)
    |> Enum.map(fn chunk -> Enum.reduce(chunk, &Bitwise.bxor/2) end)
  end

  defp reverse_and_rotate({len, skip}, list) do
    reverse = list |> Enum.take(len) |> Enum.reverse()
    rotate(reverse ++ Enum.drop(list, len), len + skip)
  end

  defp reset_rotation(ring, lengths) do
    ring_size = Enum.count(ring)

    rotations =
      Enum.reduce(lengths, 0, fn {len, skip}, sum ->
        sum + len + skip
      end)

    reset = ring_size - rem(rotations, ring_size)

    rotate(ring, reset)
  end

  defp rotate(ring, len) do
    l = rem(len, length(ring))
    Enum.drop(ring, l) ++ Enum.take(ring, l)
  end

  defp to_hex_string(numbers) when is_list(numbers) do
    numbers
    |> Enum.map_join(&to_hex_string/1)
    |> String.downcase()
  end

  defp to_hex_string(number) when is_integer(number) do
    number
    |> Integer.to_string(16)
    |> String.pad_leading(2, "0")
  end
end
