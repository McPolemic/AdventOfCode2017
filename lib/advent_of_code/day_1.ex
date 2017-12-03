defmodule AdventOfCode.Day1 do
  def solve(input) when is_integer(input),
    do: solve(Integer.to_string(input))

  def solve(input) when is_binary(input) do
    input
    |> split_digits
    |> digit_matches_next
    |> Enum.sum
  end

  defp split_digits(number) do
    number
    |> String.codepoints
    |> Enum.map(& String.to_integer(&1))
  end

  defp next_digits(list, i \\ 1) do
    list
    |> Enum.with_index
    |> Enum.map(fn {num, index} -> at_safe_index(list, index + i) end)
  end

  defp at_safe_index(list, index) do
    index = Integer.mod(index, Enum.count(list))

    Enum.at(list, index)
  end

  defp digit_matches_next(numbers) do
    List.zip([numbers, next_digits(numbers)])
    |> Enum.filter(fn {x,y} -> x == y end)
    |> Enum.map(fn {x,_} -> x end)
  end
end
