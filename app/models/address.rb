# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :citizen
  validates :CEP, :public_place, :district, :city, :UF, presence: true
end