defmodule StreamProcessingTest do
  use Aoc.DayCase
  import StreamProcessing
  doctest StreamProcessing

  describe "score" do
    test "empty groups" do
      assert score("{}") == 1
      assert score("{{{}}}") == 6
      assert score("{{},{}}") == 5
      assert score("{{{},{},{{}}}}") == 16
    end

    test "groups with garbage" do
      assert score("{<a>,<a>,<a>,<a>}") == 1
      assert score("{{<ab>},{<ab>},{<ab>},{<ab>}}") == 9
    end

    test "groups with escaped characters" do
      assert score("{{<!!>},{<!!>},{<!!>},{<!!>}}") == 9
      assert score("{{<a!>},{<a!>},{<a!>},{<ab>}}") == 3
    end

    test "part 1 input" do
      assert "9"
      |> input()
      |> score() == 20530
    end
  end

  describe "garbage_length" do
    test "characters" do
      assert garbage_length("{<random characters>}") == 17
      assert garbage_length("{<<<<>}") == 3
      assert garbage_length("{<{!>}>}") == 2
    end

    test "part 2 input" do
      assert "9"
      |> input()
      |> garbage_length() == 9978
    end
  end
end
