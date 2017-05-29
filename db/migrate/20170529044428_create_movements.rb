class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
    	t.string :name
    	t.datetime :date
    	t.integer :result
    	t.string :type
    	t.boolean :pr, default: false
    	t.integer :user_id
    	
      t.timestamps null: false
    end
  end
end
