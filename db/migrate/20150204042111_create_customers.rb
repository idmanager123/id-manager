class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :height
      t.string :weight
      t.string :eye_color
      t.string :hair_color
      t.string :dob
      t.references :order, index: true

      t.timestamps
    end
  end
end
