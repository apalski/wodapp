class CreateMovements < ActiveRecord::Migration
  def change
    create_table :usermovements do |t|
    	t.string :name
    	t.date :date
    	t.string :movement_type
      t.float :result, :precision => 2, :scale => 2
    	t.boolean :pr, default: false
    	t.integer :user_id
    	
      t.timestamps null: false
    end
  end
end
