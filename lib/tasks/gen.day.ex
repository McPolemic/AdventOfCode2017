defmodule Mix.Tasks.Gen.Day do
  use Mix.Task

  @doc """
  Create new source and test modules for a given day

  Usage: mix gen.day 23
  """

  def run(day_number) do
    source_file = source_path(day_number)
    test_file = test_path(day_number)

    if File.exists? source_file || File.exists? test_file do
      IO.puts("Files for day #{day_number} already exist!")
    else
      File.write(source_file, source_contents(day_number))
      IO.puts("Created #{source_file}")
      File.write(test_file, test_contents(day_number))
      IO.puts("Created #{test_file}")
    end
  end

  defp source_path(day_number), do: "./lib/advent_of_code/day_#{day_number}.ex"
  defp source_contents(day_number) do
    """
    defmodule AdventOfCode.Day#{day_number} do
      def solve_first(input) do
        input
      end

      def solve_second(input) do
        input
      end
    end
    """
  end

  defp test_path(day_number), do: "./test/advent_of_code/day_#{day_number}_test.exs"
  defp test_contents(day_number) do
    """
    defmodule AdventOfCode.Day#{day_number}Test do
      use ExUnit.Case

      alias AdventOfCode.Day#{day_number}

      test "solves the first problem" do
        assert Day#{day_number}.solve_first(2) == 2
      end

      @tag :skip
      test "solves the second problem" do
        assert Day#{day_number}.solve_second(2) == 2
      end
    end
    """
  end
end
