class CreateGroupTrainers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_trainers do |t|
      t.integer :group_id
      t.integer :trainer_id

      t.timestamps
    end
    add_index  :group_trainers, :group_id
    add_index  :group_trainers, :trainer_id
  end
end
