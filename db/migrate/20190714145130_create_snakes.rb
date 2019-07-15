class CreateSnakes < ActiveRecord::Migration
  def change
    create_table :snakes do |t|
      t.integer :length 
      t.integer :weight 
      t.decimal :value 
      t.integer :snake_sack_id
      t.string :location 
      t.integer :date
    end
  end
end
