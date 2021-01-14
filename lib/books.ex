defmodule Books do
  def get_books do
    IO.puts "Livros Elixir"

  case HTTPoison.get("https://elixir-lang.org/learning.html") do
    {:ok, %HTTPoison.Response{body: body}} ->
      scrap = body
        |> Floki.find("h4.resource")

      Enum.map(scrap, fn content ->
        {"h4", [{"class", "resource"}], [book_title]} = content
        {:book_title, book_title}
      end)
    {:error, err} -> 
      IO.inspect err
    end
  end
end
