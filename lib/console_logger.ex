defmodule ConsoleLogger do
  def format(level, message, timestamp, metadata) do
    values =
      metadata
      |> Keyword.values()
      |> List.to_tuple()

    build_message(level, message, timestamp, values)
  rescue
    _ -> "could not format: #{inspect {level, message, metadata}}"
  end

  defp build_message(level, message, timestamp, {module, function}) do
    [function, _] = String.split(function, "/")

    body =
      message
      |> String.split("|")
      |> Enum.map(fn m -> String.trim(m) end)
      |> Enum.join("\n\t")


    ## Without timestamp
    # "[#{level}] #{inspect module}.#{function} \n\t#{
    #     body
    # }\n"

    ## Add timestamp
    "#{format_timestamp(timestamp)} [#{level}] #{inspect module}.#{function} \n\t#{
      body
    }\n"
  end

  defp build_message(_level, message, _timestamp, {_, _, :inner}) do
    " \t #{message}\n"
  end

  defp format_timestamp({_, {h, mm, s, _}}) do
    "#{set(h)}:#{set(mm)}:#{set(s)}"
  end

  defp set(x) when x < 10, do: "0#{x}"
  defp set(x), do: "#{x}"
end
