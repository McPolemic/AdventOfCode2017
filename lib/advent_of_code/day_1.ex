defmodule AdventOfCode.Day1 do
  def solve_first(input) when is_binary(input) do
    input
    |> split_digits
    |> digit_matches_next
    |> Enum.sum
  end

  def solve_second(input) when is_binary(input) do
    input
    |> split_digits
    |> digit_matches_halfway_round
    |> Enum.sum
  end

  defp split_digits(number) do
    number
    |> String.codepoints
    |> Enum.map(& String.to_integer(&1))
  end

  defp halfway_round_digits(list) do
    halfway_point = list
                    |> Enum.count
                    |> div(2)

    next_digits(list, halfway_point)
  end

  defp next_digits(list, i \\ 1) do
    list
    |> Enum.with_index
    |> Enum.map(fn {_, index} -> at_safe_index(list, index + i) end)
  end

  defp at_safe_index(list, index) do
    index = Integer.mod(index, Enum.count(list))

    Enum.at(list, index)
  end

  defp digit_matches_halfway_round(numbers) do
    List.zip([numbers, halfway_round_digits(numbers)])
    |> Enum.filter(fn {x,y} -> x == y end)
    |> Enum.map(fn {x,_} -> x end)
  end

  defp digit_matches_next(numbers) do
    List.zip([numbers, next_digits(numbers)])
    |> Enum.filter(fn {x,y} -> x == y end)
    |> Enum.map(fn {x,_} -> x end)
  end
end
