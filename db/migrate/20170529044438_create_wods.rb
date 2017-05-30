class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
    	t.string :name
    	t.datetime :date
    	t.string :type
      t.integer :result
    	t.boolean :pr, default: false
    	t.integer :user_id
    	
      t.timestamps null: false
    end
  end
end
