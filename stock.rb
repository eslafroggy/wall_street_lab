class Stock < ActiveRecord::Base
  validates :symbol, presence: true
  has_and_belongs_to_many :portfolios
end