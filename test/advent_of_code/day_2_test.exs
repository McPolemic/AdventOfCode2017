defmodule AdventOfCode.Day2Test do
  use ExUnit.Case

  alias AdventOfCode.Day2

  test "solves the first problem" do
    rows = "5 1 9 5
7 5 3
2 4 6 8"
    assert Day2.solve_first(rows) == 18
  end

  test "solves the second problem" do
    rows = "5 9 2 8
9 4 7 3
3 8 6 5"
    assert Day2.solve_second(rows) == 9
  end

  describe "private tests" do
    @tag :private
    test "converts a block of text into nested lists" do
      rows = "1 2 3
4 5 6
7 8"
      assert Day2.get_spreadsheet(rows) == [[1,2,3], [4,5,6], [7,8]]
    end

    @tag :private
    test "the difference of the row's extremes" do
      assert Day2.row_differences({10, 4}) == 6
    end

    @tag :private
    test "find the extreme's of an array of numbers" do
      assert Day2.extremes([5,1,9,5]) == {9, 1}
    end

    @tag :private
    test "create a row from a string" do
      assert Day2.row_from_string("1 2 3 4") == [1,2,3,4]
    end

    @tag :private
    test "determines if a number cleanly divides into another" do
      assert Day2.perfect_div(4, 2) == 2
      assert Day2.perfect_div(2, 4) == 2
      assert Day2.perfect_div(4, 3) == nil
    end

    @tag :private
    test "finds evenly divisible values" do
      row = [11, 7, 4, 2]
      assert Day2.evenly_divisible_values(row) == 2
    end
  end
end

