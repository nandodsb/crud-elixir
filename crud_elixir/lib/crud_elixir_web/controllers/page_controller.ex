defmodule CrudElixirWeb.PageController do
  use CrudElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
