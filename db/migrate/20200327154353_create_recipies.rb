class CreateRecipies < ActiveRecord::Migration
  def change
    create_table :recipies do |t|
      t.string :name 
      t.string :ingridients
      t.decimal :cook_time
    end
  
  end
end
