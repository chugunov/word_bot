defmodule Mix.Tasks.WordBot do
  use Mix.Task

  @words_file Application.get_env(:word_bot, :dict_path)

  def run([letters]), do: run([letters, "50"])
  def run([letters, top_size]) do
    words = File.read!(@words_file) |> String.split("\r\n")
    {word_matrix, _acc} = parse_to_matrix(letters)

    {val, _other} = Integer.parse(top_size)
    IO.inspect iterate_words(words, word_matrix, val)
  end

  defp iterate_words(_words, _matrix, top_size, detected_words \\ [])
  defp iterate_words([], _word_matrix, top_size, detected_words) do
    detected_words
    |> Enum.sort(&(byte_size(&1) >= byte_size(&2)))
    |> Enum.take(top_size)
  end
  defp iterate_words([word|tail], word_matrix, top_size, detected_words) do
    new_detected_words = if MatrixFinder.find(word_matrix, word) do
      [word|detected_words]
    else
      detected_words
    end

    iterate_words(tail, word_matrix, top_size, new_detected_words)
  end

  defp parse_to_matrix(letters) do
    letters_list = Enum.filter(letters |> String.codepoints, fn(x) ->
      Regex.match?(~r/\p{L}/, x)
    end)

    matrix = letters_list |> length |> :math.sqrt |> trunc |> init_matrix

    Enum.reduce(Map.keys(matrix), {matrix, 0}, fn(key, {matr, acc}) ->
      {Map.put(matr, key, Enum.at(letters_list, acc)), acc + 1}
    end)
  end

  defp init_matrix(size) do
    Enum.reduce(0..size-1, %{}, fn(r, acc) ->
      Enum.reduce(0..size-1, acc, fn(c, nes_acc) ->
        Map.put(nes_acc, {r,c}, "")
      end)
    end)
  end
end
