defmodule Mix.Tasks.Mlh.JsonlToCsv do
  use Mix.Task
  import Mix.Mlh

  @boroughs %{
    "Manhattan" => :ok,
    "Brooklyn" => :ok,
    "Bronx" => :ok,
    "Staten Island" => :ok,
    "Queens" => :ok
  }

  @shortdoc "Converts CityWeb jsonl files to AWS ML CSV files"
  def run(args) do
    jsonl_path = Enum.at args, 0
    csv_destination = Enum.at args, 1
    convert(jsonl_path, csv_destination)
  end

  defp convert(_, nil) do
    raise "No CSV destination"
  end

  defp convert(nil, _) do
    raise "No JSONL destination"
  end

  defp convert(jsonl_path, csv_destination) do
    IO.puts "Converting #{jsonl_path} to #{csv_destination}"
    output = File.stream!(csv_destination, [:raw, :delayed_write])

    File.stream!(jsonl_path)
    |> Stream.map(&to_json/1)
    |> Stream.map(&without_boroughs/1)
    |> Stream.filter(&has_text_and_neighborhoods/1)
    |> Stream.map(&to_csv_list/1)
    |> CSV.encode
    |> Stream.into(output)
    |> Stream.run

    File.close(output)
  end

  defp to_json(line) do
    Poison.Parser.parse!(line)
  end

  defp without_boroughs(json) do
    without_boroughs = Enum.filter(json["neighborhoods"], fn (hood) ->
      @boroughs[hood] != :ok
    end)

    %{json | "neighborhoods" => without_boroughs}
  end

  defp has_text_and_neighborhoods(json) do
    json["text"] != nil && is_list(json["neighborhoods"]) && length(json["neighborhoods"]) > 0
  end

  defp to_csv_list(json) do
    [json["text"], hd json["neighborhoods"]]
  end

  defp write_json(json) do
    IO.write json["text"]
  end

  defp write(final) do
    IO.write final
  end
end
