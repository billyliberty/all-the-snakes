class CreateSnakes < ActiveRecord::Migration
  def change
    create_table :snakes do |t|
      
      t.text :content
      t.integer :length 
      t.integer :weight 
      t.decimal :monetary_value 
      t.integer :hunter_id

      t.timestamps null: false
    end
  end
end
