defmodule WordBotTest do
  use ExUnit.Case

  test "word bot test" do
    res = Mix.Tasks.WordBot.run(["вробаолткссуоткнлооеахпкл", "10"])

    should_be = ["сутолока", "полсуток", "околоток", "потолок",
     "полоток", "локоток", "котелок", "колотун",
     "колокол", "кокотка"]

    Enum.each(res, fn(x) -> assert Enum.any?(should_be, &(&1 == x)) end)
    assert length(res) == 10
  end
end
