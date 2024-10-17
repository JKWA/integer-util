defmodule IntUtility do
  @moduledoc """
  Utility module for converting integers to their English word representation, up to billions.

  Elixir supports integers of arbitrary size, so this returns "Integer too large" for integers beyond billions.
  """

  @units ~w(zero one two three four five six seven eight nine)
  @teens ~w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  @tens ~w(zero ten twenty thirty forty fifty sixty seventy eighty ninety)
  @suffixes ["", "thousand", "million", "billion"]

  @doc """
  Converts an integer to its English words representation.

  ## Examples

      iex> IntUtility.int_to_string(123)
      "one hundred twenty-three"

      iex> IntUtility.int_to_string(-4567)
      "negative four thousand five hundred sixty-seven"

      iex> IntUtility.int_to_string(1_000_000_000_000)
      "Integer too large"

  """
  def int_to_string(number) when abs(number) > 999_999_999_999 do
    "Integer too large"
  end

  def int_to_string(0), do: "zero"

  def int_to_string(number) when number < 0 do
    "negative " <> int_to_string(-number)
  end

  def int_to_string(number) do
    number
    |> split_into_triplets()
    |> process_triplets()
    |> Enum.reject(&(&1 == ""))
    |> Enum.join(" ")
  end

  # Splits the integer into groups of three digits from right to left
  defp split_into_triplets(number) do
    number
    |> Integer.to_string()
    |> String.graphemes()
    |> Enum.reverse()
    |> Enum.chunk_every(3)
    |> Enum.map(&Enum.reverse/1)
    |> Enum.map(&Enum.join/1)
    |> Enum.reverse()
  end

  # Processes each triplet and adds appropriate suffix
  defp process_triplets(triplets) do
    total_triplets = length(triplets)

    triplets
    |> Enum.with_index()
    |> Enum.map(fn {triplet_str, idx} ->
      triplet_num = String.to_integer(triplet_str)
      suffix_index = total_triplets - idx - 1
      suffix = Enum.at(@suffixes, suffix_index, "")

      process_triplet(triplet_num, suffix)
    end)
  end

  defp process_triplet(0, _suffix), do: ""

  defp process_triplet(triplet_num, suffix) do
    words = convert_triplet_to_words(triplet_num)

    [words, suffix]
    |> Enum.reject(&(&1 == ""))
    |> Enum.join(" ")
  end

  defp convert_triplet_to_words(number) when number < 10 do
    Enum.at(@units, number)
  end

  defp convert_triplet_to_words(number) when number < 20 do
    Enum.at(@teens, number - 10)
  end

  defp convert_triplet_to_words(number) when number < 100 do
    tens = div(number, 10)
    units = rem(number, 10)
    tens_word = Enum.at(@tens, tens)

    if units == 0 do
      tens_word
    else
      units_word = Enum.at(@units, units)
      "#{tens_word}-#{units_word}"
    end
  end

  defp convert_triplet_to_words(number) when number < 1000 do
    hundreds = div(number, 100)
    rest = rem(number, 100)
    hundreds_word = "#{Enum.at(@units, hundreds)} hundred"

    if rest == 0 do
      hundreds_word
    else
      rest_words = convert_triplet_to_words(rest)
      "#{hundreds_word} #{rest_words}"
    end
  end
end
