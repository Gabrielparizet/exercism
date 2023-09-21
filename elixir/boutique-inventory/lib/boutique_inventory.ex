defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn x -> x.price end, :asc)
  end

  def with_missing_price(inventory) do
    Enum.reject(inventory, fn x -> x.price end)
  end

  def update_names(inventory, old_word, new_word) do
    # Enum.map(inventory, fn item -> %{item | name: String.replace(item.name, old_word, new_word)} end)
    # Enum.map(inventory, fn item -> Map.put(item, :name, String.replace(item.name, old_word, new_word)) end)
    # Enum.map(inventory, fn item -> change_names(item, old_word, new_word) end)
    Enum.map(inventory, &(change_names(&1, old_word, new_word)))
  end

  defp change_names(item, old_word, new_word) do
    Map.put(item, :name, String.replace(item.name, old_word, new_word))
  end

  def increase_quantity(item, count) do
    %{item | quantity_by_size: Map.new(item.quantity_by_size, fn {key, value} -> {key, value + count} end)}
  end


  def total_quantity(item) do
    item.quantity_by_size
    |> Map.values()
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end
end
