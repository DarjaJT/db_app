class CreateSportsmen < ActiveRecord::Migration[5.0]
  def change
    create_table :sportsmen do |t|
      t.string :address
      t.integer :user_id
      t.integer :trainer_id
      t.integer :group_id

      t.timestamps
    end
    add_index :sportsmen, [:user_id, :created_at]
    add_index :sportsmen, :trainer_id
    add_index :sportsmen, :group_id
  end
end
