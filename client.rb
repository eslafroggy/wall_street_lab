class Client < ActiveRecord::Base
  validates :name, presence: true
  has_many :portfolios
end