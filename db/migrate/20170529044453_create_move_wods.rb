class CreateMoveWods < ActiveRecord::Migration
  def change
    create_table :move_wods do |t|
    	t.integer :movement_id
    	t.integer :wod_id

      t.timestamps null: false
    end
  end
end
