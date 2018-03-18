require IEx

defmodule InvestmentMonitoring.SessionResolver do
  alias InvestmentMonitoring.User
  alias InvestmentMonitoring.Repo

  def create_session(_root, args, _info) do
    user = Repo.get_by(User, username: args[:username])
    case authenticate(user, args[:password]) do
      true -> create_token(user)
      _    -> {:error, "User could not be authenticated."}
    end
  end

  def authenticate(user, password) do
    case user do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, user.password_hash)
    end
  end

  def create_token(user) do
    {:ok, token, _full_claims} = InvestmentMonitoring.Guardian.encode_and_sign(user)
    {:ok, %{token: token}}
  end
end
