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

    cond do
      find_middle_index_value(numbers_list) == key ->
        {:ok,
         numbers_list
         |> length()
         |> div(2)}

       true ->
        "It is greater"
    end
  end

  def find_middle_index_value(numbers) do
    middle_index =
      numbers
      |> length()
      |> div(2)

    Enum.at(numbers, middle_index)
  end
end
