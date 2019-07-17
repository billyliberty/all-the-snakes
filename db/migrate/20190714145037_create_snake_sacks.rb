class CreateSnakeSacks < ActiveRecord::Migration
  def change
    create_table :snake_sacks do |t|
      t.string :name
      t.integer :date
      t.integer :hunter_id

      t.timestamps null:false
    end
  end
end
