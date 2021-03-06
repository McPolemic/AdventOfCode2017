defmodule AdventOfCode.Day1Test do
  use ExUnit.Case

  alias AdventOfCode.Day1

  test "solves the first problem" do
    assert Day1.solve_first("1122") == 3
    assert Day1.solve_first("1111") == 4
    assert Day1.solve_first("1234") == 0
    assert Day1.solve_first("91212129") == 9
  end

  test "solves the second problem" do
    assert Day1.solve_second("1212") == 6
    assert Day1.solve_second("1221") == 0
    assert Day1.solve_second("123425") == 4
    assert Day1.solve_second("123123") == 12
    assert Day1.solve_second("12131415") == 4
  end

  describe "private tests" do
    @tag :private
    test "splits digits in a number" do
      assert Day1.split_digits(12345) == [1,2,3,4,5]
    end

    @tag :private
    test "returns a list of the digits halfway around the list" do
      assert Day1.halfway_round_digits([1,2,3,4]) == [3,4,1,2]
    end

    @tag :private
    test "returns a list of the next digits for each index" do
      assert Day1.next_digits([1,2,3,4]) == [2,3,4,1]
      assert Day1.next_digits([1,2,3,4], 2) == [3,4,1,2]
    end

    @tag :private
    test "returns the proper indexed value when it has to wrap around" do
      assert Day1.at_safe_index([1,2,3,4], 4) == 1
      assert Day1.at_safe_index([1,2,3,4], 8) == 1
      assert Day1.at_safe_index([1,2,3,4], 5) == 2
    end

    @tag :private
    test "returns all digits that match the digit after them" do
      assert Day1.digit_matches_next([1,1,2,2]) == [1, 2]
    end
  end
end

