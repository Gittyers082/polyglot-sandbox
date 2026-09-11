# .ex extension = Elixir source code file | .exs extension = Elixir script file

# Source code Structure
# Define a module
defmodule Structure do

  # Define a public function
  def handsome(_name) do
    "malemanape"
  end

  def reality(_real, namer) do
    "has no chance of every being liked by #{pretty(namer)}"
  end

  # Define a private funtion
  defp pretty(_namer) do
    "poliwagg"
  end

end

IO.puts("#{Structure.handsome("input")} #{Structure.reality("some input", "input")}")
