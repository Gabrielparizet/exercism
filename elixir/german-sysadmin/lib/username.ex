defmodule Username do
  def sanitize([]), do: []

  def sanitize([head | tail]) do
    case head do
      head when (head >= ?a and head <= ?z) or head == ?_ -> [head]
      head when head == ?ä -> [?a, ?e]
      head when head == ?ö -> [?o, ?e]
      head when head == ?ü -> [?u, ?e]
      head when head == ?ß -> [?s, ?s]
      _ -> []

    end ++ sanitize(tail)
  end
end
