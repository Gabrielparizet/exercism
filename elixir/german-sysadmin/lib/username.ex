defmodule Username do
  def sanitize([]), do: []

  def sanitize([head | tail]) do
    case head do
      head when (head >= 97 and head <= 122) -> [head]
      head when (head >= 48 and head <= 57) -> []

    end ++ sanitize(tail)

    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
  end
end
