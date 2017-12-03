defmodule Mix.Tasks.Solve do
  use Mix.Task

  @doc """
  Solve a given day's problems
  
  Usage: mix solve day1 first 123456
  """

  def run([day, part |  inputs]) do
    day
    |> string_to_module
    |> apply(method(part), inputs)
    |> IO.puts
  end

  defp method(part) when part == "first", do: :solve_first
  defp method(part) when part == "second", do: :solve_first

  defp string_to_module(name) do
    name
    |> Macro.camelize
    |> adventize
    |> String.to_atom
  end

  defp adventize(name), do: "Elixir.AdventOfCode.#{name}"
end
