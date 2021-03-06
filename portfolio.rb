class Portfolio < ActiveRecord::Base
  validates :client, presence: true #validates that form cannot be submitted without a client or devoid of name.
  validates :name, presence: true
  belongs_to :client
  has_and_belongs_to_many :stocks
end