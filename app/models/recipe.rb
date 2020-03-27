#Placeholder for a model
class Recipie < ActiveRecord::Base 
  validates :name, presence true 
  validates :ingridients, presence true
  validates :cook_time, presence true
end