defmodule Bangis.OrderItemTest do
  use Bangis.ModelCase

  alias Bangis.OrderItem

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = OrderItem.changeset(%OrderItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = OrderItem.changeset(%OrderItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
