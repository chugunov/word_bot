defmodule MatrixFinderTest do
  use ExUnit.Case

  test "find a word in a matrix" do
    letters = %{
      {0,0} => "я", {0,1} => "о", {0,2} => "з", {0,3} => "в", {0,4} => "т",
      {1,0} => "р", {1,1} => "с", {1,2} => "п", {1,3} => "и", {1,4} => "ы",
      {2,0} => "т", {2,1} => "а", {2,2} => "а", {2,3} => "й", {2,4} => "н",
      {3,0} => "ь", {3,1} => "в", {3,2} => "у", {3,3} => "ж", {3,4} => "а",
      {4,0} => "р", {4,1} => "о", {4,2} => "р", {4,3} => "к", {4,4} => "в"
    }

    exists_in_matrix = ["кровать", "ров", "ров", "паук", "типаж", "ярость"]
    not_exists_in_matrix = ["ванна"]

    Enum.each(exists_in_matrix, &(assert MatrixFinder.find(letters, &1)))
    Enum.each(not_exists_in_matrix, &(assert not MatrixFinder.find(letters, &1)))
  end
end
