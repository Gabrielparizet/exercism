defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(1), do: {:ok, :deficient}

  def classify(number) when number > 0 do
    factors = get_factors(number)

    aliquot_sum =
      Enum.reduce(factors, 0, fn factor, acc ->
        factor + acc
      end)

    cond do
      aliquot_sum == number -> {:ok, :perfect}
      aliquot_sum < number -> {:ok, :deficient}
      aliquot_sum > number -> {:ok, :abundant}
    end
  end

  def classify(_number) do
    {:error, "Classification is only possible for natural numbers."}
  end

  defp get_factors(number) do
    for i <- 1..(number - 1), rem(number, i) == 0, do: i
  end
end
