class CreateHalls < ActiveRecord::Migration[5.0]
  def change
    create_table :halls do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :halls, [:user_id, :created_at]
  end
end
