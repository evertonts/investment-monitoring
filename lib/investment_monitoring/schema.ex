defmodule InvestmentMonitoring.Schema do
  use Absinthe.Schema

  alias InvestmentMonitoring.UserResolver

  object :user do
    field :id, non_null(:id)
    field :username, non_null(:string)
    field :name, non_null(:string)
  end

  query do
    field(:all_users, non_null(list_of(non_null(:user)))) do
      resolve &UserResolver.all_users/3
    end
  end

  mutation do
    field :create_user, :user do
      arg :name, non_null(:string)
      arg :username, non_null(:string)

      resolve &UserResolver.create_user/3
    end
  end
end
