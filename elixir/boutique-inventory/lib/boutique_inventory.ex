defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn x -> x.price end, :asc)
  end

  def with_missing_price(inventory) do
    Enum.reject(inventory, fn x -> x.price end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item -> %{item | name: String.replace(item.name, old_word, new_word)} end)
  end

  def increase_quantity(item, count) do
    # Please implement the increase_quantity/2 function
  end

  def total_quantity(item) do
    # Please implement the total_quantity/1 function
  end
end
