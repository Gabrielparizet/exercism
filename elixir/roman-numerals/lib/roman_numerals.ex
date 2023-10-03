defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  # @arabic_numbers_translation %{
  #   "I"  => 1,
  #   "IV" => 4,
  #   "V"  => 5,
  #   "IX" => 9,
  #   "X"  => 10,
  #   "XL" => 40,
  #   "L"  => 50,
  #   "XC" => 90,
  #   "C"  => 100,
  #   "CD" => 400,
  #   "D"  => 500,
  #   "CM" => 900,
  #   "M"  => 1000
  # }

  @arabic_numbers_translation %{
    1    => "I",
    4    => "IV",
    5    => "V",
    9    => "IX",
    10   => "X",
    40   => "XL",
    50   => "L",
    90   => "XC",
    100  => "C",
    400  => "CD",
    500  => "D",
    900  => "CM",
    1000 => "M"
  }

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    @arabic_numbers_translation[number]
  end
end
