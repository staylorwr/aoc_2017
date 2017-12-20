defmodule DiskDefragmentationTest do
  use Aoc.DayCase

  @test_input "ljoxqyyw"

  describe "count_used/1" do
    @tag :input
    test "given test case" do
      assert DiskDefragmentation.count_used("flqrgnkx") === 8108
    end

    @tag :input
    test "input" do
      assert DiskDefragmentation.count_used(@test_input) == 8316
    end
  end

  describe "count_regions/1" do
    @tag :input
    test "given test case" do
      assert DiskDefragmentation.count_regions("flqrgnkx") === 1242
    end

    @tag :input
    test "input" do
      assert DiskDefragmentation.count_regions(@test_input) === 1074
    end
  end
end
