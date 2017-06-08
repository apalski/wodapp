class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
    	t.string :name
    	t.string :movement_type
    	t.integer :owner_id
      t.timestamps null: false
    end
  end
end
