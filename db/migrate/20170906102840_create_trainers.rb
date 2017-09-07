class CreateTrainers < ActiveRecord::Migration[5.0]
  def change
    create_table :trainers do |t|
      t.string :qualif
      t.integer :user_id

      t.timestamps
    end
    add_index :trainers, [:user_id, :created_at]
  end
end
