class Client < ApplicationRecord
  belongs_to :comintent

  validates :name, presence: true
  validates :plate, presence: true
  validates :dimension, presence: true
  validates :brand, presence: true
  validates :qty, presence: true
end
