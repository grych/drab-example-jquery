defmodule DrabExample.PageCommander do
  use Drab.Commander, modules: [Drab.Query, Drab.Modal]

  onload :page_loaded

  # Drab Callbacks
  def page_loaded(socket) do
    socket
      |> update(:html, set: "Welcome to Phoenix+Drab!", on: "div.jumbotron h2")
      |> update(:html,
          set: "Please visit <a href='https://tg.pl/drab'>Drab Proof-of-Concept</a> page for more examples and description",
          on:  "div.jumbotron p.lead")
  end
end
