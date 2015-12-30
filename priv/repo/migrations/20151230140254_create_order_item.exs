defmodule Bangis.Repo.Migrations.CreateOrderItem do
  use Ecto.Migration

  def change do
    create table(:order_items) do
      add :quantity,    :integer
      add :amount,      :float

      add :product_id,  references(:products)   
      add :order_id,    references(:orders)
  
      timestamps
    end

  end
end
