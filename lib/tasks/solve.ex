defmodule Mix.Tasks.Solve do
  use Mix.Task

  @doc """
  Solve a given day's problems

  Usage: mix solve day1.1 123456
         mix solve day1.2 123456
  """

  def run([day | inputs]) do
    {module, function} = split_day_into_callable(day)

    IO.puts apply(module, function, inputs)
  end

  defp split_day_into_callable(day) do
    [day_name, function_id] = String.split(day, ".")
    function = case function_id do
      "1" -> :solve_first
      "2" -> :solve_second
    end

    {string_to_module(day_name), function}
  end

  defp string_to_module(name) do
    name
    |> Macro.camelize
    |> adventize
    |> String.to_atom
  end

  defp adventize(name), do: "Elixir.AdventOfCode.#{name}"
end
