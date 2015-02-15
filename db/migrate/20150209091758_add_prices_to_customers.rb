class AddPricesToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :head_hunting_fee,  :decimal
    add_column :customers, :id_price, :decimal
    add_column :customers, :id_cost, :decimal
  end
end
