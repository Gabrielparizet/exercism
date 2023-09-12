defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    # Please implement the extract_from_path/2 function
    keys = String.split(path, ".")
    do_extract_from_path(data, keys)
  end

  defp do_extract_from_path(data, []), do: data
  defp do_extract_from_path(data, [first_key | rest]) do
    do_extract_from_path(data[first_key], rest)
  end


  def get_in_path(data, path) do
    # Please implement the get_in_path/2 function
  end
end
