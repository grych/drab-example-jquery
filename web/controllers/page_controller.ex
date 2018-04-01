defmodule DrabExample.PageController do
  use DrabExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
