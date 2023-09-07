defmodule ResistorColorTrio do

  @band_color_value %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @band_color_multiplier %{
    black: 1,
    brown: 10,
    red: 100,
    orange: 1_000,
    yellow: 10_000,
    green: 100_000,
    blue: 1_000_000,
    violet: 10_000_000,
    grey: 100_000_000,
    white: 1_000_000_000
  }

  @ohm_metrics %{
    ohms: 1,
    kiloohms: 1_000,
    megaohms: 1_000_000,
    gigaohms: 1_000_000_000
  }

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}

  def label([first, second, multiplier | _tail]) do

    number = Enum.map([first, second], &(@band_color_value[&1]))
    |> Integer.undigits()
    multiplier = Map.get(@band_color_multiplier, multiplier, 1)
    band_value = (number * multiplier)
    exponent = get_exponent(band_value)
    value = div(band_value,  Map.get(@ohm_metrics, exponent))
    {value, exponent}

  end

  defp get_exponent(n) when n >= 1_000_000_000 do
    :gigaohms
  end
  defp get_exponent(n) when n >= 1_000_000 do
    :megaohms
  end
  defp get_exponent(n) when n >= 1_000 do
    :kiloohms
  end
  defp get_exponent(_n) do
    :ohms
  end

end
