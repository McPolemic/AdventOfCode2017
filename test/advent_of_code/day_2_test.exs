defmodule AdventOfCode.Day2Test do
  use ExUnit.Case

  alias AdventOfCode.Day2

  @tag :skip
  test "solves the first problem" do
    assert Day2.solve_first("2222") == 3
  end

  @tag :skip
  test "solves the second problem" do
  end

  describe "private tests" do
    test "adds up the differences of all rows" do
      rows = "5 1 9 5
7 5 3
2 4 6 8"
      assert Day2.checksum(rows) == 18
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
  end
end

