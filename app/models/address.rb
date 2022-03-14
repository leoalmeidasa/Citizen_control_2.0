# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :citizen, inverse_of: :address

  validates :CEP, :public_place, :district, :city, :UF, presence: true
  validates :CEP, length: { is: 8 }
end