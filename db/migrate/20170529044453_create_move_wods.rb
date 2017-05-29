class CreateMoveWods < ActiveRecord::Migration
  def change
    create_table :move_wods do |t|

      t.timestamps null: false
    end
  end
end
