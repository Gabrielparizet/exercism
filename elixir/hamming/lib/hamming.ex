defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    {:ok, count_differences(strand1, strand2, 0)}
  end

  # def do_hamming_distance([], [], count), do: count
  def count_differences([], [], count), do: count
  def count_differences([char1 | rest1], [char2 | rest2], count) when char1 != char2 do
    count_differences(rest1, rest2, count + 1)
  end
  def count_differences([_char1 | rest1], [_char2 | rest2], count) do
    count_differences(rest1, rest2, count)
  end
end
