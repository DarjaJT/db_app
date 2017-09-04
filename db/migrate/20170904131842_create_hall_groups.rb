class CreateHallGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :hall_groups do |t|
      t.integer :hall_id, index: true
      t.integer :group_id, index: true

      t.timestamps
    end
  end
end
