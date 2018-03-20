require IEx

defmodule InvestmentMonitoring.Context do
  @behaviour Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  @doc """
  Return the current user context based on the authorization header
  """
  def build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
    {:ok, current_user} <- authorize(token) do
      %{current_user: current_user}
    else
      _ -> %{}
    end
  end

  defp authorize(token) do
    case InvestmentMonitoring.Guardian.decode_and_verify(token, %{"typ" => "access"}) do
      {:ok, claims} -> return_user(claims)
      {:error, reason} -> {:error, reason}
    end
  end

  defp return_user(claims) do
    case InvestmentMonitoring.Guardian.resource_from_claims(claims) do
      {:ok, resource} -> {:ok, resource}
    end
  end
end
