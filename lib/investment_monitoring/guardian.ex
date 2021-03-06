defmodule InvestmentMonitoring.Guardian do
  use Guardian, otp_app: :investment_monitoring

  alias InvestmentMonitoring.{Repo, User}

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Repo.get(User, id)
    {:ok,  resource}
  end
end
