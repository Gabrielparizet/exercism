defmodule BinarySearch do
  require Integer

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
    middle_index = find_middle_index(numbers_list)
    middle_index_value = find_middle_index_value(numbers_list, middle_index)
    # IO.inspect(key, label: "the key we are looking for")
    # IO.inspect(numbers_list, label: "the numbers list")
    # IO.inspect(middle_index, label: "the middle index")
    # IO.inspect(middle_index_value, label: "the middle index value")
    case middle_index_value do
      middle_index_value when middle_index_value == key -> {:ok, middle_index}
      middle_index_value when middle_index_value < key -> binary_search(delete_smaller_elements_in_list(numbers_list, middle_index), key, index + middle_index - 1)
      middle_index_value when middle_index_value > key -> binary_search(delete_bigger_elements_in_list(numbers_list, middle_index), key, index + middle_index + 1)
    end
  end

  def find_middle_index(numbers_list) do
    numbers_list
    |> length()
    |> div(2)
  end

  def find_middle_index_value(numbers_list, index) do
    Enum.at(numbers_list, index)
  end

  def delete_smaller_elements_in_list(numbers_list, middle_index) do
    Enum.take(numbers_list, -middle_index)
  end

  def delete_bigger_elements_in_list(numbers_list, middle_index) do
    Enum.take(numbers_list, middle_index)
  end


end
