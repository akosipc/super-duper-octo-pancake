defmodule Bangis.Customer do
  use Bangis.Web, :model

  schema "customers" do
    field :first_name
    field :last_name

    timestamps
  end

  @required_fields ~w(first_name last_name)
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
