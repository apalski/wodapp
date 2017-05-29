class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|

      t.timestamps null: false
    end
  end
end
