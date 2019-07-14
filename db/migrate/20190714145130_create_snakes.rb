class CreateSnakes < ActiveRecord::Migration
  def change
    create_table :snakes do |t|
      t.integer :length 
      t.integer :weight 
      t.integer :value 
      t.integer :snake_sack_id
      t.integer :location 
    end
  end
end
