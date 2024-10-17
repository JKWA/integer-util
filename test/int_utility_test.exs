defmodule IntUtilityTest do
  use ExUnit.Case

  test "converts 0 to 'zero'" do
    assert IntUtility.int_to_string(0) == "zero"
  end

  test "converts single digits correctly" do
    assert IntUtility.int_to_string(1) == "one"
    assert IntUtility.int_to_string(9) == "nine"
  end

  test "converts negative single digits correctly" do
    assert IntUtility.int_to_string(-1) == "negative one"
    assert IntUtility.int_to_string(-9) == "negative nine"
  end

  test "converts tens correctly" do
    assert IntUtility.int_to_string(10) == "ten"
    assert IntUtility.int_to_string(15) == "fifteen"
    assert IntUtility.int_to_string(23) == "twenty-three"
    assert IntUtility.int_to_string(99) == "ninety-nine"
  end

  test "converts negative tens correctly" do
    assert IntUtility.int_to_string(-10) == "negative ten"
    assert IntUtility.int_to_string(-15) == "negative fifteen"
    assert IntUtility.int_to_string(-23) == "negative twenty-three"
    assert IntUtility.int_to_string(-99) == "negative ninety-nine"
  end

  test "converts hundreds correctly" do
    assert IntUtility.int_to_string(100) == "one hundred"
    assert IntUtility.int_to_string(105) == "one hundred five"
    assert IntUtility.int_to_string(123) == "one hundred twenty-three"
    assert IntUtility.int_to_string(999) == "nine hundred ninety-nine"
  end

  test "converts negative hundreds correctly" do
    assert IntUtility.int_to_string(-100) == "negative one hundred"
    assert IntUtility.int_to_string(-105) == "negative one hundred five"
    assert IntUtility.int_to_string(-123) == "negative one hundred twenty-three"
    assert IntUtility.int_to_string(-999) == "negative nine hundred ninety-nine"
  end

  test "converts thousands correctly" do
    assert IntUtility.int_to_string(1000) == "one thousand"
    assert IntUtility.int_to_string(1005) == "one thousand five"
    assert IntUtility.int_to_string(1234) == "one thousand two hundred thirty-four"
    assert IntUtility.int_to_string(9999) == "nine thousand nine hundred ninety-nine"
  end

  test "converts negative thousands correctly" do
    assert IntUtility.int_to_string(-1000) == "negative one thousand"
    assert IntUtility.int_to_string(-1005) == "negative one thousand five"
    assert IntUtility.int_to_string(-1234) == "negative one thousand two hundred thirty-four"
    assert IntUtility.int_to_string(-9999) == "negative nine thousand nine hundred ninety-nine"
  end

  test "converts millions correctly" do
    assert IntUtility.int_to_string(1_000_000) == "one million"

    assert IntUtility.int_to_string(1_234_567) ==
             "one million two hundred thirty-four thousand five hundred sixty-seven"

    assert IntUtility.int_to_string(9_999_999) ==
             "nine million nine hundred ninety-nine thousand nine hundred ninety-nine"
  end

  test "converts negative millions correctly" do
    assert IntUtility.int_to_string(-1_000_000) == "negative one million"

    assert IntUtility.int_to_string(-1_234_567) ==
             "negative one million two hundred thirty-four thousand five hundred sixty-seven"

    assert IntUtility.int_to_string(-9_999_999) ==
             "negative nine million nine hundred ninety-nine thousand nine hundred ninety-nine"
  end

  test "converts billions correctly" do
    assert IntUtility.int_to_string(1_000_000_000) == "one billion"

    assert IntUtility.int_to_string(1_234_567_890) ==
             "one billion two hundred thirty-four million five hundred sixty-seven thousand eight hundred ninety"

    assert IntUtility.int_to_string(9_999_999_999) ==
             "nine billion nine hundred ninety-nine million nine hundred ninety-nine thousand nine hundred ninety-nine"
  end

  test "converts negative billions correctly" do
    assert IntUtility.int_to_string(-1_000_000_000) == "negative one billion"

    assert IntUtility.int_to_string(-1_234_567_890) ==
             "negative one billion two hundred thirty-four million five hundred sixty-seven thousand eight hundred ninety"

    assert IntUtility.int_to_string(-9_999_999_999) ==
             "negative nine billion nine hundred ninety-nine million nine hundred ninety-nine thousand nine hundred ninety-nine"
  end

  test "returns 'Integer too large' for numbers greater than 999,999,999,999" do
    assert IntUtility.int_to_string(1_000_000_000_000) == "Integer too large"
    assert IntUtility.int_to_string(-1_000_000_000_001) == "Integer too large"
  end
end
