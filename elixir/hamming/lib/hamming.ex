defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2) do
    {:error, "strands must be of equal length"}
  end
  def hamming_distance(strand1, strand2) do
    {:ok, do_hamming_distance(strand1, strand2, 0)}
  end

  defp do_hamming_distance([], [], count), do: count
  defp do_hamming_distance([ char1 | rest1 ], [ char2 | rest2 ], count) when char1 != char2 do
    do_hamming_distance(rest1, rest2, count + 1)
  end
  defp do_hamming_distance([ _char1 | rest1 ], [ _char2 | rest2 ], count) do
    do_hamming_distance(rest1, rest2, count)
  end

end
