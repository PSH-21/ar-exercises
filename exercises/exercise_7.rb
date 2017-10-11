require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  has_many :employees
  validates_length_of :name, :minimum => 3
  validates_numericality_of :annual_revenue, :greater_than_or_equal_to => 0
end

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, presence: true, :inclusion => {:in => [40,200]}
  validates :store, presence: true
end


puts 'Name a store'
@store_name = gets.chomp

new_store = Store.create!(name: @store_name)
new_store.errors.full_messages

