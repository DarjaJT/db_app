class CreateHallGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :hall_groups do |t|
      t.integer :hall_id
      t.integer :group_id

      t.timestamps
    end
    add_index  :hall_groups, :hall_id
    add_index  :hall_groups, :group_id
  end
end
