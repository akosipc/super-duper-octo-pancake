defmodule Bangis.Product do
  use Bangis.Web, :model

  before_insert :generate_sku
  before_update :generate_sku

  schema "products" do
    field :image_path,    Bangis.Avatar.Type
    field :item_code,     :string
    field :variant,       :string
    field :name,          :string
    field :sku,           :string
    field :color,         :string
    field :size,          :string
    field :description,   :string
    field :asana_url,     :string
    field :etsy_url,      :string
    field :facebook_url,  :string
    field :instagram_url, :string
    field :others,        :string
    field :price,         :float

    field :current_step,  :string

    belongs_to :category, Bangis.Category

    timestamps
  end

  @required_fields ~w(item_code variant name category_id price)
  @optional_fields ~w(color size description)

  @required_file_fields ~w()
  @optional_file_fields ~w(image_path)


  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast(params, @required_file_fields, @optional_file_fields)
    |> unique_constraint(:sku)
    |> validate_format(:asana_url, ~r/http:\/\//)
    |> validate_format(:esty_url, ~r/http:\/\//)
    |> validate_format(:facebook_url, ~r/http:\/\//)
    |> validate_format(:instagram_url, ~r/http:\/\//)
    |> validate_format(:others, ~r/http:\/\//)
    |> validate_number(:price, greater_than: 0)
  end

  def item_to_sku({_, item_code}, {_, variant}) do
    "#{item_code}-#{variant}"
  end

  defp generate_sku(changeset) do
    put_change(changeset, :sku, item_to_sku(fetch_field(changeset, :item_code),
                                            fetch_field(changeset, :variant)))
  end

end
