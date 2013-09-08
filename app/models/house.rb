class House < ActiveRecord::Base
  validates :title, :description, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 1}
end
