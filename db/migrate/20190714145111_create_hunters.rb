class CreateHunters < ActiveRecord::Migration
  def change
    create_table :hunters do |t|
      
      t.string :email
      t.string :name 
      t.string :password_digest 
      
      t.timestamps null: false
    end
  end
end
