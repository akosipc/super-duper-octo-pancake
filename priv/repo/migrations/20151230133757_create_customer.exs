defmodule Bangis.Repo.Migrations.CreateCustomer do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :first_name, :string
      add :last_name,  :string

      timestamps
    end

  end
end
