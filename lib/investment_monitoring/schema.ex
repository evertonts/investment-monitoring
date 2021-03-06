require IEx
defmodule InvestmentMonitoring.Schema do
  use Absinthe.Schema

  alias InvestmentMonitoring.UserResolver
  alias InvestmentMonitoring.SessionResolver
  alias InvestmentMonitoring.InvestmentResolver
  alias InvestmentMonitoring.Repo
  alias InvestmentMonitoring.User

  object :user do
    field :id, non_null(:id)
    field :username, non_null(:string)
    field :name, non_null(:string)
    field :investments, list_of(:investment)
  end

  @desc "A JWT Token"
  object :token do
    field :token, :string
  end

  object :investment do
    field :id, non_null(:id)
    field :user_id, :id
    field :broker, non_null(:string)
    field :title, non_null(:string)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :reference_rate, non_null(:string)
    field :amount, non_null(:integer)
  end

  query do
    field(:all_users, non_null(list_of(non_null(:user)))) do
      resolve &UserResolver.all_users/3
    end

    field :me, :user do
      resolve fn _, %{context: context} ->
        case context.current_user do
          %User{id: id} -> {:ok, Repo.get(User, id) |> Repo.preload(:investments)}
          _ -> {:error}
        end
      end
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

    field :create_investment, :investment do
      arg :broker, non_null(:string)
      arg :title, non_null(:string)
      arg :amount, non_null(:integer)
      arg :start_date, non_null(:string)
      arg :end_date, non_null(:string)
      arg :reference_rate, non_null(:string)

      resolve &InvestmentResolver.create_investment/3
    end
  end
end
