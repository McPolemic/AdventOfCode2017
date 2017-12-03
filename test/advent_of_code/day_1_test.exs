defmodule AdventOfCode.Day1Test do
  use ExUnit.Case

  alias AdventOfCode.Day1

  #@tag :skip
  test "solves the problem" do
    assert Day1.solve(1122) == 3
    assert Day1.solve(1111) == 4
    assert Day1.solve(1234) == 0
    assert Day1.solve(91212129) == 9
  end

  describe "private tests" do
    @tag :skip
    test "splits digits in a number" do
      assert Day1.split_digits(12345) == [1,2,3,4,5]
    end

    @tag :skip
    test "returns a list of the next digits for each index" do
      assert Day1.next_digits([1,2,3,4]) == [2,3,4,1]
      assert Day1.next_digits([1,2,3,4], 2) == [3,4,1,2]
    end

    @tag :skip
    test "returns the proper indexed value when it has to wrap around" do
      assert Day1.at_safe_index([1,2,3,4], 4) == 1
      assert Day1.at_safe_index([1,2,3,4], 8) == 1
      assert Day1.at_safe_index([1,2,3,4], 5) == 2
    end

    @tag :skip
    test "returns all digits that match the digit after them" do
      assert Day1.digit_matches_next([1,1,2,2]) == [1, 2]
    end
  end
end

