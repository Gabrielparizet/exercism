defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  base = "stone"
  candidates = ["stone", "tones", "banana", "tons", "notes", "Seton"]

  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    sorted_base = sort_strings(base)
    sorted_candidates = Enum.map(candidates, &(sort_strings(&1)))
    matching_indexes = find_matching_indexes(sorted_candidates, sorted_base)
    matching_list = find_matching_list(matching_indexes, candidates)
    Enum.reject(matching_list, &(&1 == base))
  end

  def sort_strings(string) do
    string
    |> String.downcase()
    |> String.codepoints()
    |> Enum.sort()
    |> Enum.join()
  end

  def find_matching_indexes(list, comparing_value) do
    list
    |> Enum.with_index()
    |> Enum.filter(fn {value, _index} -> String.contains?(value, comparing_value) end)
    |> Enum.map(fn {_value, index} -> index end)
  end

  def find_matching_list(list_of_indexes, list_of_strings) do
    list_of_indexes
    |> Enum.map(&(Enum.at(list_of_strings, &1)))
  end

end
