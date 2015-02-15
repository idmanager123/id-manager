class CreateReferrers < ActiveRecord::Migration
  def change
    create_table :referrers do |t|
      t.string :name

      t.timestamps
    end
    add_reference :customers, :referrer, index: true
  end
end
