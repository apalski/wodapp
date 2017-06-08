class CreateUserwods < ActiveRecord::Migration
  def change
    create_table :userwods do |t|
    	t.string :name
    	t.date :date
    	t.string :wod_type
      t.float :result, :precision => 2, :scale => 2
    	t.boolean :pr, default: false
    	t.integer :user_id
    	
      t.timestamps null: false
    end
  end
end
