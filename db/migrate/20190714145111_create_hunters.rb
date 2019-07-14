class CreateHunters < ActiveRecord::Migration
  def change
    create_table :hunters do |t|
      t.string :username
      t.string :name 
      t.string :password_digest 
    end
  end
end
