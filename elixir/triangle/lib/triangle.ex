defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    do_kind(a, b, c, all_params_are_positive([a, b, c]))
  end
  defp do_kind(_, _, _, false), do: {:error, "all side lengths must be positive"}
  defp do_kind(a, a, a, _), do: {:ok, :equilateral}
  defp do_kind(a, a, b, _), do: validate_isosceles(a, b)
  defp do_kind(a, b, a, _), do: validate_isosceles(a, b)
  defp do_kind(b, a, a, _), do: validate_isosceles(a, b)
  defp do_kind(a, b, c, _) do
    [largest, second, third] = Enum.sort([a, b, c], :desc)
    cond do
      largest > second + third -> {:error, "side lengths violate triangle inequality"}
      true -> {:ok, :scalene}
    end
  end

  defp validate_isosceles(duplicate, b) do
    cond do
      (duplicate * 2) >= b -> {:ok, :isosceles}
      true -> {:error, "side lengths violate triangle inequality"}
    end
  end

  defp all_params_are_positive(params) do
    Enum.all?(params, fn x -> x > 0 end)
  end

end
