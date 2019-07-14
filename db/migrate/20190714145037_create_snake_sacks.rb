class CreateSnakeSacks < ActiveRecord::Migration
  def change
    create_table :snake_sacks do |t|
      t.string :name 
      t.integer :hunter_id
      t.integer :capacity
    end
  end
end
