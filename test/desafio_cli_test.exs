defmodule DesafioCliTest do
  use ExUnit.Case
  doctest DesafioCli

  # Testa a função `numerate_names/1`
  test "numerates names correctly" do
    input = ["Eduardo", "Maria", "Daniel", "Eduardo"]
    expected_output = ["Eduardo I", "Maria I", "Daniel I", "Eduardo II"]

    assert DesafioCli.numerate_names(input) == expected_output
  end

  # Testa a função `numerate_names/1` com múltiplas repetições
  test "handles multiple repetitions" do
    input = ["João", "João", "João", "João"]
    expected_output = ["João I", "João II", "João III", "João IV"]

    assert DesafioCli.numerate_names(input) == expected_output
  end

  # Testa a função `roman_numeral/1`
  test "converts numbers to Roman numerals" do
    assert DesafioCli.roman_numeral(1) == "I"
    assert DesafioCli.roman_numeral(4) == "IV"
    assert DesafioCli.roman_numeral(9) == "IX"
    assert DesafioCli.roman_numeral(40) == "XL"
    assert DesafioCli.roman_numeral(90) == "XC"
    assert DesafioCli.roman_numeral(400) == "CD"
    assert DesafioCli.roman_numeral(1000) == "M"
  end
end
