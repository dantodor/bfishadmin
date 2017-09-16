defmodule BfishWeb.Authentication do
  @user_salt "user salt"

  def sign(data) do
    Phoenix.Token.sign(BfishWeb.Endpoint, @user_salt, data)
  end

  def verify(token) do
    Phoenix.Token.verify(BfishWeb.Endpoint, @user_salt, token, [
      max_age: 3650 * 24 * 3600
    ])
  end

end
