defmodule InvestmentMonitoring.Schema do
  use Absinthe.Schema

  alias InvestmentMonitoring.UserResolver
  alias InvestmentMonitoring.SessionResolver

  object :user do
    field :id, non_null(:id)
    field :username, non_null(:string)
    field :name, non_null(:string)
  end

  @desc "A JWT Token"
  object :token do
    field :token, :string
  end

  query do
    field(:all_users, non_null(list_of(non_null(:user)))) do
      resolve &UserResolver.all_users/3
    end
  end

  mutation do
    field :create_user, :user do
      arg :name, :string
      arg :username, non_null(:string)
      arg :password, non_null(:string)
      resolve &UserResolver.create_user/3
    end

    field :create_session, :token do
      arg :username, non_null(:string)
      arg :password, non_null(:string)

      resolve &SessionResolver.create_session/3
    end
  end
end
