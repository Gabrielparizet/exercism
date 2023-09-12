defmodule BinarySearch do

  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    numbers_list = Tuple.to_list(numbers)
    binary_search(numbers_list, key, 0)
  end

  defp binary_search([], _key, _index), do: :not_found
  defp binary_search(numbers_list, key, index) do
    list_length = length(numbers_list)
    middle_index = div(list_length, 2)
    middle_value = Enum.at(numbers_list, middle_index)

    case key do
      key when key == middle_value -> {:ok, index + middle_index}
      key when key < middle_value ->
        new_list = Enum.take(numbers_list, middle_index)
        binary_search(new_list, key, index)
      key when key > middle_value ->
        new_list = Enum.drop(numbers_list, middle_index + 1)
        binary_search(new_list, key, index + middle_index + 1)
      _ ->
        :not_found
    end
  end


end
