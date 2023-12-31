defmodule CollatzConjecture do
  require Integer
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  # def calc(0), do: raise FunctionClauseError
  # def calc(num) when num < 0, do: raise FunctionClauseError
  # def calc(num) when is_binary(num), do: raise FunctionClauseError
  # def calc(num) do
  #   do_calc(num, 0)
  # end
  # def do_calc(1, step) do
  #   step
  # end
  # def do_calc(num, step) do
  #   if Integer.is_even(num) do
  #     do_calc(div(num, 2), step + 1)
  #   else
  #     do_calc(num * 3 +1, step + 1)
  #   end
  # end
  def calc(1), do: 0
  def calc(i) when i > 0 and rem(i, 2) != 0, do: 1 + calc(i * 3 + 1)
  def calc(i) when i > 0 and rem(i, 2) == 0, do: 1 + calc(div(i, 2))
end
