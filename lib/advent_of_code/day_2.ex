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

  defp row_checksum(row) do
    row
    |> extremes
    |> row_differences
  end

  defp get_spreadsheet(rows) do
    rows
    |> String.split(~r{[\r\n]})
    |> Enum.map(&row_from_string/1)
  end

  def checksum(rows) do
    rows
    |> get_spreadsheet
    |> Enum.map(&row_checksum/1)
    |> Enum.sum
  end
end
