defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    keys = String.split(path, ".")
    do_extract_from_path(data, keys)
  end

  defp do_extract_from_path(data, []), do: data
  defp do_extract_from_path(data, [first_key | rest]) do
    do_extract_from_path(data[first_key], rest)
  end


  def get_in_path(data, path) do
    keys = String.split(path, ".")
    get_in(data, keys)
  end
end
