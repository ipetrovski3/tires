class Comintent < ApplicationRecord
  belongs_to :warehouse
  has_many :clients
end
