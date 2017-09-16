
defmodule BfishWeb.Router do
  use BfishWeb, :router

  pipeline :api do
    plug CORSPlug, origin: ["*"]
    plug :accepts, ["json"]
    plug BfishWeb.Context
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug,
      schema: BfishWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: BfishWeb.Schema
  end

end
