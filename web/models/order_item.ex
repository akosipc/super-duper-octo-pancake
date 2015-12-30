defmodule Bangis.OrderItem do
  use Bangis.Web, :model

  schema "order_items" do
    field :quantity,      :integer
    field :amount,        :float 

    belongs_to :product,  Bangis.Product
    belongs_to :order,    Bangis.Order

    timestamps
  end

  @required_fields ~w(quantity)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_number(:quantity, greater_than: 0)
  end
end
