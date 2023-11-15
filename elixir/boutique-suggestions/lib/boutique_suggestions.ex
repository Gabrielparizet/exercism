defmodule BoutiqueSuggestions do

  def get_combinations(tops, bottoms, options \\ []) do
    mp = Keyword.get(options, :maximum_price, 100)
    for t <- tops,
        b <- bottoms,
        t.base_color != b.base_color,
        t.price + b.price < mp do
      {t, b}
    end
  end

end
