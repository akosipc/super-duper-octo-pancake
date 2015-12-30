defmodule Bangis.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :image_path,  :string
      add :item_code,   :string
      add :variant,     :string
      add :name,        :string
      add :color,       :string
      add :size,        :string
      add :description, :string
      add :asana_url,   :string
      add :etsy_url,    :string
      add :facebook_url,  :string
      add :instagram_url, :string
      add :others,      :string
      add :sku,         :string

      add :current_step,  :string

      timestamps
    end

    create unique_index(:products, [:sku])

  end
end
