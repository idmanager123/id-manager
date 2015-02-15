class AddGenderToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :gender, :text
  end
end
