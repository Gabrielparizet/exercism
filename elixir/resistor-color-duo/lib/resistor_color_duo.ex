defmodule ResistorColorDuo do

  @color_band_values %{
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
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    first_color = @color_band_values[hd(colors)]
    second_color = @color_band_values[Enum.at(colors, 1)]
    Integer.to_string(first_color) <> Integer.to_string(second_color)
    |> String.to_integer()
  end
end
