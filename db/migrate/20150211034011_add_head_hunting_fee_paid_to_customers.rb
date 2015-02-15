class AddHeadHuntingFeePaidToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :head_hunting_fee_paid, :boolean, defaut: false
  end
end
