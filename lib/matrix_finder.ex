defmodule MatrixFinder do
  def find(letters, word)
  def find(letters, word) do
    [first_letter|other] = String.codepoints(word)

    Enum.any?(Map.keys(letters), fn(map_key) ->
      if letters[map_key] == first_letter do
        find_next(other, letters, map_key,  %{map_key => first_letter})
      end
    end)
  end

  defp find_next([], _letters, _pos, _used), do: true
  defp find_next([let|tail], letters, {x,y}, used) do
    possible_cells = [{x - 1, y - 1}, {x, y - 1}, {x + 1, y - 1},
    {x - 1, y}, {x + 1, y}, {x - 1, y + 1}, {x, y + 1}, {x + 1, y + 1}]

    Enum.any?(possible_cells, fn(cell) ->
      if letters[cell] == let && is_nil used[cell] do
        find_next(tail, letters, cell, Map.put(used, cell, let))
      else
        false
      end
    end)
  end
end
