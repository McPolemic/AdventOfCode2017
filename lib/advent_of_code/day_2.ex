defmodule AdventOfCode.Day2 do
  def solve_first(input) do
    checksum input
  end

  def solve_second(input) do
    input
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

  defp row_checksum(line) do
    line
    |> row_from_string
    |> extremes
    |> row_differences
  end

  def checksum(rows) do
    rows
    |> String.split(~r{[\r\n]})
    |> Enum.map(&row_checksum/1)
    |> Enum.sum
  end
end
