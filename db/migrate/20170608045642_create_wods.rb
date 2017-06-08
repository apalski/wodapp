class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
    	t.string :name
    	t.string :wod_type
    	t.integer :owner_id
      t.timestamps null: false
    end
  end
end
