defmodule DrabExample.PageCommander do
  use Drab.Commander, onload: :page_loaded

  # Drab Callbacks
  def page_loaded(socket) do
    socket 
      |> html("div.jumbotron h2", "Welcome to Phoenix+Drab!")
      |> html("div.jumbotron p.lead", 
              "Please visit <a href='https://tg.pl/drab'>Drab Proof-of-Concept</a> page for more examples and description")
  end
end
