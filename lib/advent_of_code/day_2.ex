defmodule AdventOfCode.Day2 do
  def solve_first(input), do: process(input, &row_checksum/1)
  def solve_second(input), do: process(input, &evenly_divisible_values/1)

  defp process(input, row_processing_fn) do
    input
    |> get_spreadsheet
    |> Enum.map(row_processing_fn)
    |> Enum.sum
  end

  defp get_spreadsheet(rows) do
    rows
    |> String.split(~r{[\r\n]})
    |> Enum.map(&row_from_string/1)
  end

  defp row_from_string(input) do
    input
    |> String.split(~r{[ \t]})
    |> Enum.map(& String.to_integer &1)
  end

  defp extremes(row) do
    {Enum.max(row), Enum.min(row)}
  end

  defp row_differences({max, min}) do
    max - min
  end

  defp row_checksum(row) do
    row
    |> extremes
    |> row_differences
  end

  def perfect_div(x, y) when y > x, do: perfect_div(y, x)
  def perfect_div(x, y) when rem(x, y) != 0, do: nil
  def perfect_div(x, y) do
    div(x, y)
  end

  # Divide the first row value from the rest of the values to
  # see if anyone of them divide evenly. If it does, return that.
  # Otherwise, repeat with the rest of the values (which checks
  # against the second value, then the third, etc.)
  defp evenly_divisible_values([numerator | rest]) do
    result = rest
    |> Enum.map(& perfect_div(numerator, &1))
    |> Enum.reject(&is_nil/1)
    |> List.first

    case result do
      nil -> evenly_divisible_values(rest)
      _ -> result
    end
  end
end
