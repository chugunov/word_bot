# WordBot

An application looking for words inside letters matrix by vertical, horizontal 
and diagonal

## Usage

Have a matrix 5x5, that consist of letters:

| в  | р  | о  | б | а  |
|---|---|---|---|---|
| о  | л  | т  | к | с  |
| с  | у  | о  | т | к  |
| н  | л  | о  | о | е  |
| а  | х  | п  | к | л  |

Run this commands:

```elixir
  iex> mix do deps.get, deps.compile
  # returns top 10 words
  iex> mix word_bot "вроба олткс суотк нлоое ахпкл" 10
  ["сутолока", "полсуток", "околоток", "потолок",
   "полоток", "локоток", "котелок", "колотун",
   "колокол", "кокотка"]
```

Returns a list of the longest words that found inside matrix. 
Matrix size does not important.

## Config

Replace `words.out` file by your dictionary file (any dictionary language) 
or append words to the existing dict.
