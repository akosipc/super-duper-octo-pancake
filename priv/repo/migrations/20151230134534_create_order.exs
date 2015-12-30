defmodule Bangis.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :amount,        :float
      add :ordered_at,    :datetime
      add :paid_at,       :datetime
      add :currency,      :string
      add :payment_type,  :string
      add :payment_id,    :string
      add :delivery_by,   :string
      add :delivery_id,   :string

      add :customer_id,   references(:customers)

      timestamps
    end

  end
end
