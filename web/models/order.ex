defmodule Bangis.Order do
  use Bangis.Web, :model

  schema "orders" do
    field :amount,        :float
    field :ordered_at,    Ecto.DateTime
    field :paid_at,       Ecto.DateTime
    field :currency,      :string
    field :payment_type,  :string
    field :payment_id,    :string
    field :delivery_by,   :string
    field :delivery_id,   :string

    belongs_to :customer, Bangis.Customer
    has_many :order_items, Bangis.OrderItem

    timestamps
  end

  @required_fields ~w(amount currency ordered_at customer_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
