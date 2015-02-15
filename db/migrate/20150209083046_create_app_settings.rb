# This will contain variables that will persist across all servers
# and will need to persist even if a server restarts.
class CreateAppSettings < ActiveRecord::Migration
  def change
    create_table :app_settings do |t|
      t.integer :singleton_guard
      t.decimal :default_head_hunting_fee
      t.decimal :default_id_cost
      t.decimal :default_id_price
      t.timestamps
    end
    add_index :app_settings, :singleton_guard, :unique => true
  end
end
