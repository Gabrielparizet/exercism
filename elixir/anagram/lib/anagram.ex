defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.filter(fn elem -> anagram(base, elem) end)
  end
  defp anagram(base, candidate) do
    (String.downcase(base) != String.downcase(candidate)) and
    (homog(base) == homog(candidate))
  end
  defp homog(word) do
    word
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.sort()
  end
end
