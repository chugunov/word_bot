# WordBot

Search words inside letters matrix by vertical, horizontal and diagonal

## Usage

Get matrix:

| в  | р  | о  | б | а  |
| о  | л  | т  | к | с  |
| с  | у  | о  | т | к  |
| н  | л  | о  | о | е  |
| а  | х  | п  | к | л  |

```elixir
  iex> mix do deps.get, deps.compile
  # returns top 10 words
  iex> mix word_bot "вроба олткс суотк нлоое ахпкл" 10
  ["сутолока", "полсуток", "околоток", "потолок",
   "полоток", "локоток", "котелок", "колотун",
   "колокол", "кокотка"]
```

Returns a list of the longest words inside matrix.
Matrix size does not important.

## Config

Replace `words.out` file by your dictionary file (any language dictionary)
or append words to it.
