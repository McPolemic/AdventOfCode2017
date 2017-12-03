defmodule Mix.Tasks.Solve do
  use Mix.Task

  @shortdoc "Solve a given day's problems"

  def run([day | inputs]) do
    day
    |> string_to_module
    |> apply(:solve, inputs)
    |> IO.puts
  end

  defp string_to_module(name) do
    name
    |> Macro.camelize
    |> adventize
    |> String.to_atom
  end

  defp adventize(name), do: "Elixir.AdventOfCode.#{name}"
end
