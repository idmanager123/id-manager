class AddSubmittedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :submitted, :boolean, :default => false
  end
end
