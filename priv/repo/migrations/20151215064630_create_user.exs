defmodule Bangis.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :encrypted_password, :string
      add :first_name, :string
      add :last_name, :string

      timestamps
    end

  end
end
