defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main(_args) do
    IO.puts("Digite os nomes dos reis e rainhas. Pressione Enter em uma linha em branco para finalizar:")

    names = read_input([])
    numerated_names = numerate_names(names)
    Enum.each(numerated_names, &IO.puts/1)
  end

  def read_input(acc) do
    case IO.gets("") do
      "\n" -> Enum.reverse(acc)
      name -> read_input([String.trim(name) | acc])
    end
  end

  def numerate_names(names) do
    names
    |> Enum.reduce({[], %{}}, fn name, {result, acc} ->
      count = Map.get(acc, name, 0) + 1
      updated_acc = Map.put(acc, name, count)
      updated_result = result ++ [name <> " " <> roman_numeral(count)]
      {updated_result, updated_acc}
    end)
    |> elem(0)
  end

  def roman_numeral(number) do
    roman_map = [
      {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"},
      {100, "C"}, {90, "XC"}, {50, "L"}, {40, "XL"},
      {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"},
      {1, "I"}
    ]

    roman_numeral(number, roman_map, "")
  end

  defp roman_numeral(0, _roman_map, result), do: result
  defp roman_numeral(number, [{value, roman} | tail], result) when number >= value do
    roman_numeral(number - value, [{value, roman} | tail], result <> roman)
  end
  defp roman_numeral(number, [_ | tail], result) do
    roman_numeral(number, tail, result)
  end
end
