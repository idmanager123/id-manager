class AddPaidToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :haspaid, :boolean
  end
end
