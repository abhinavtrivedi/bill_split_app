class Expense < ActiveRecord::Base
  attr_accessible :amount, :name

  validates :name, presence: true
  validates :amount, presence: true, numericality: true
end
