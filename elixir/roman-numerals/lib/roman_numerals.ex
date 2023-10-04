defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    String.duplicate("I", number)
    |> String.replace("IIIII", "V")
    |> String.replace("IIII", "IV")
    |> String.replace("VV", "X")
    |> String.replace("VIV", "IX")
    |> String.replace("XXXXX", "L")
    |> String.replace("XXXX", "XL")
    |> String.replace("LL", "C")
    |> String.replace("LXL", "XC")
    |> String.replace("CCCCC", "D")
    |> String.replace("CCCC", "CD")
    |> String.replace("DD", "M")
    |> String.replace("DCD", "CM")
  end
end
