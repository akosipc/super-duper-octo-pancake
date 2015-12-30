defmodule Bangis.Repo.Migrations.AddsAdditionalFieldsToProduct do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :price,         :float
      add :category_id,   references(:categories)
    end
  end
end
