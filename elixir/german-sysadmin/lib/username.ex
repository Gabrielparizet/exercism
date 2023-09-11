defmodule Username do
  def sanitize([]), do: []

  def sanitize([head | tail]) do
    case head do
      head when (head >= 97 and head <= 122) or head == 95 -> [head]
      head when head == 228 -> [97, 101]
      head when head == 246 -> [111, 101]
      head when head == 252 -> [117, 101]
      head when head == 223 -> [115, 115]
      _ -> []

    end ++ sanitize(tail)

    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
  end
end
