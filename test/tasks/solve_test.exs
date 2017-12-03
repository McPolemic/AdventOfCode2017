defmodule Mix.Tasks.SolveTest do
  use ExUnit.Case

  alias Mix.Tasks.Solve

  @tag :private
  test "it returns a day module and function" do
    {day, function} = Solve.split_day_into_callable("day1.1")
    assert day == AdventOfCode.Day1
    assert function == :solve_first
  end
end
